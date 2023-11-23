import 'package:cgpa_cal/context/app.dart';
import 'package:cgpa_cal/models/sem.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:provider/provider.dart';

void main() async {
  await Hive.initFlutter();
  Hive.registerAdapter(SemesterAdapter());
  Hive.registerAdapter(SubjectAdapter());
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => AppContext(),
        ),
      ],
      child: MaterialApp(
        title: 'CGPA Calc',
        theme: ThemeData(
          colorScheme: const ColorScheme.dark(background: Colors.black),
          useMaterial3: true,
        ),
        home: const MyHomePage(),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text("CGPA Calc"),
      ),
      body: const SemesterView(),
    );
  }
}

class SemesterView extends StatelessWidget {
  const SemesterView({super.key});

  @override
  Widget build(BuildContext context) {
    final semesters = context.watch<AppContext>().semesters;
    if (semesters.isEmpty) {
      return const Center(
        child: Text("No Semesters"),
      );
    }
    return GridView.builder(
      gridDelegate:
          const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
      itemBuilder: (ctx, idx) {
        final sem = semesters.elementAt(idx);
        return GestureDetector(
          onTap: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => SemPage(
                  semIdx: idx,
                ),
              ),
            );
          },
          child: Column(
            children: [
              Text(
                sem.name,
              ),
              Text(
                calcSGPA(sem),
              )
            ],
          ),
        );
      },
      itemCount: semesters.length,
    );
  }
}

class SemPage extends StatelessWidget {
  const SemPage({super.key, required this.semIdx});
  final int semIdx;
  @override
  Widget build(BuildContext context) {
    final semester = context.watch<AppContext>().semesters.elementAt(semIdx);
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Text(
              semester.name,
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            Flexible(
              flex: 2,
              child: ListView.builder(
                itemBuilder: (ctx, idx) {
                  final sub = semester.subjects[idx];
                  return ListTile(
                    title: Text(sub.name),
                    trailing: DropdownButton(
                      value: sub.grade,
                      items: grades.keys
                          .map((e) => DropdownMenuItem(
                                value: e,
                                child: Text(e),
                              ))
                          .toList(),
                      onChanged: (e) {
                        if (e != null) {
                          context.read<AppContext>().setGrade(semIdx, idx, e);
                        }
                      },
                    ),
                  );
                },
                itemCount: semester.subjects.length,
              ),
            ),
            Flexible(child: Text(calcSGPA(semester)))
          ],
        ),
      ),
    );
  }
}

String calcSGPA(Semester sem) {
  int totalCredits = 0;
  int totalNum = 0;
  for (var sub in sem.subjects) {
    int cred = 0;
    switch (sub.credits) {
      case SubType.SUB:
        cred = 3;
        break;
      case SubType.LAB:
        cred = 1;
        break;
      default:
    }
    if (grades[sub.grade] != null) {
      totalNum += cred * grades[sub.grade]!;
    }
    totalCredits += cred;
  }
  if (totalNum == 0) {
    return "No Grade Entered";
  }
  return "${totalNum / totalCredits}";
}

import 'package:cgpa_cal/context/app.dart';
import 'package:cgpa_cal/models/sem.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:provider/provider.dart';
import 'package:google_fonts/google_fonts.dart';

void main() async {
  await Hive.initFlutter();
  Hive.registerAdapter(SemesterAdapter());
  Hive.registerAdapter(SubjectAdapter());
  Hive.registerAdapter(SubTypeAdapter());
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
        title: Text(
          "CGPA Calc",
          style: GoogleFonts.poppins(
            fontWeight: FontWeight.w600,
            fontSize: 20,
          ),
        ),
      ),
      body: Column(
        children: [
          const Flexible(
            flex: 8,
            child: SemesterView(),
          ),
          Material(
            elevation: 10,
            child: Flexible(
              child: ListTile(
                title: Text(
                  "CGPA",
                  style: GoogleFonts.poppins(),
                ),
                trailing: Consumer<AppContext>(
                  builder: (ctx, app, w) {
                    return Text(
                      calcCGPA(app.semesters),
                      style: GoogleFonts.poppins(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    );
                  },
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class SemesterView extends StatelessWidget {
  const SemesterView({super.key});

  @override
  Widget build(BuildContext context) {
    final semesters = context.watch<AppContext>().semesters;
    if (semesters.isEmpty) {
      return Center(
        child: Text(
          "No Semesters",
          style: GoogleFonts.poppins(
            fontWeight: FontWeight.w600,
            fontSize: 20,
          ),
        ),
      );
    }
    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisSpacing: 5,
          crossAxisSpacing: 5,
          childAspectRatio: 1,
        ),
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
            child: Container(
              decoration: BoxDecoration(
                border: Border.all(
                  color: Colors.cyan,
                ),
                borderRadius: BorderRadius.circular(
                  20,
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    padding: const EdgeInsets.only(left: 5, top: 2),
                    decoration: const BoxDecoration(
                      color: Colors.cyan,
                      borderRadius: BorderRadius.vertical(
                        top: Radius.circular(20),
                      ),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          sem.name,
                          style: GoogleFonts.poppins(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const Spacer(),
                  Column(
                    children: [
                      RichText(
                        textAlign: TextAlign.center,
                        text: TextSpan(
                          text: "${sem.subjects.length}\n",
                          children: [
                            TextSpan(
                              text: "Subjects",
                              style: GoogleFonts.poppins(
                                color: Colors.black,
                                fontSize: 14,
                              ),
                            ),
                          ],
                          style: GoogleFonts.poppins(
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                            fontSize: 25,
                          ),
                        ),
                      ),
                      Text(
                        "SGPA: ${calcSGPA(sem)}",
                        style: GoogleFonts.poppins(),
                      ),
                    ],
                  ),
                  const Spacer(),
                ],
              ),
            ),
          );
        },
        itemCount: semesters.length,
      ),
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
              flex: 8,
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
  if (sem.subjects.where((element) => element.grade == '-').isNotEmpty) {
    return "Enter Grades";
  }
  for (var sub in sem.subjects) {
    int cred = 0;
    switch (sub.credits) {
      case SubType.SUB:
        cred = 3;
        break;
      case SubType.LAB:
        cred = 1;
        break;
      case SubType.PP1:
        cred = 2;
        break;
      case SubType.PP2:
        cred = 8;
        break;
      default:
    }
    if (grades[sub.grade] != null) {
      totalNum += cred * grades[sub.grade]!;
    }
    totalCredits += cred;
  }
  return (totalNum / totalCredits).toStringAsFixed(2);
}

String calcCGPA(List<Semester> sems) {
  int totalCredits = 0;
  int totalNum = 0;
  for (var sem in sems) {
    for (var sub in sem.subjects) {
      if (sub.grade == "-") continue;
      int cred = 0;
      switch (sub.credits) {
        case SubType.SUB:
          cred = 3;
          break;
        case SubType.LAB:
          cred = 1;
          break;
        case SubType.PP1:
          cred = 2;
          break;
        case SubType.PP2:
          cred = 8;
          break;
        default:
          continue;
      }
      if (grades[sub.grade] != null) {
        totalNum += cred * grades[sub.grade]!;
      }
      totalCredits += cred;
    }
  }

  return (totalNum / totalCredits).toStringAsFixed(2);
}

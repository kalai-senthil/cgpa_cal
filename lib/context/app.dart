import 'package:cgpa_cal/models/sem.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

class AppContext extends ChangeNotifier {
  late Box appBox;
  bool loading = true;
  List<Semester> semesters = [
    Semester(
      "Sem 1",
      [
        Subject(
          name: "name",
          grade: '-',
          credits: SubType.NONE,
        ),
        Subject(
          name: "name",
          grade: '-',
          credits: SubType.NONE,
        ),
        Subject(
          name: "name",
          grade: '-',
          credits: SubType.NONE,
        ),
        Subject(
          name: "name",
          grade: '-',
          credits: SubType.NONE,
        ),
        Subject(
          name: "name",
          grade: '-',
          credits: SubType.NONE,
        ),
        Subject(
          name: "name",
          grade: '-',
          credits: SubType.NONE,
        ),
        Subject(
          name: "name",
          grade: '-',
          credits: SubType.NONE,
        ),
        Subject(
          name: "name",
          grade: '-',
          credits: SubType.NONE,
        ),
      ],
    ),
    Semester("Sem 2", [
      Subject(
        name: "name",
        grade: '-',
        credits: SubType.NONE,
      ),
      Subject(
        name: "name",
        grade: '-',
        credits: SubType.NONE,
      ),
      Subject(
        name: "name",
        grade: '-',
        credits: SubType.NONE,
      ),
      Subject(
        name: "name",
        grade: '-',
        credits: SubType.NONE,
      ),
      Subject(
        name: "name",
        grade: '-',
        credits: SubType.NONE,
      ),
      Subject(
        name: "name",
        grade: '-',
        credits: SubType.NONE,
      ),
      Subject(
        name: "name",
        grade: '-',
        credits: SubType.NONE,
      ),
      Subject(
        name: "name",
        grade: '-',
        credits: SubType.NONE,
      ),
      Subject(
        name: "name",
        grade: '-',
        credits: SubType.NONE,
      ),
    ]),
    Semester("Sem 3", [
      Subject(
        name: "name",
        grade: '-',
        credits: SubType.NONE,
      ),
      Subject(
        name: "name",
        grade: '-',
        credits: SubType.NONE,
      ),
      Subject(
        name: "name",
        grade: '-',
        credits: SubType.NONE,
      ),
      Subject(
        name: "name",
        grade: '-',
        credits: SubType.NONE,
      ),
      Subject(
        name: "name",
        grade: '-',
        credits: SubType.NONE,
      ),
      Subject(
        name: "name",
        grade: '-',
        credits: SubType.NONE,
      ),
      Subject(
        name: "name",
        grade: '-',
        credits: SubType.NONE,
      ),
      Subject(
        name: "name",
        grade: '-',
        credits: SubType.NONE,
      ),
      Subject(
        name: "name",
        grade: '-',
        credits: SubType.NONE,
      ),
      Subject(
        name: "name",
        grade: '-',
        credits: SubType.NONE,
      ),
      Subject(
        name: "name",
        grade: '-',
        credits: SubType.NONE,
      ),
    ]),
    Semester("Sem 4", [
      Subject(
        name: "name",
        grade: '-',
        credits: SubType.NONE,
      ),
      Subject(
        name: "name",
        grade: '-',
        credits: SubType.NONE,
      ),
      Subject(
        name: "name",
        grade: '-',
        credits: SubType.NONE,
      ),
      Subject(
        name: "name",
        grade: '-',
        credits: SubType.NONE,
      ),
      Subject(
        name: "name",
        grade: '-',
        credits: SubType.NONE,
      ),
      Subject(
        name: "name",
        grade: '-',
        credits: SubType.NONE,
      ),
      Subject(
        name: "name",
        grade: '-',
        credits: SubType.NONE,
      ),
      Subject(
        name: "name",
        grade: '-',
        credits: SubType.NONE,
      ),
      Subject(
        name: "name",
        grade: '-',
        credits: SubType.NONE,
      ),
      Subject(
        name: "name",
        grade: '-',
        credits: SubType.NONE,
      ),
    ]),
    Semester("Sem 5", [
      Subject(
        name: "name",
        grade: '-',
        credits: SubType.NONE,
      ),
      Subject(
        name: "name",
        grade: '-',
        credits: SubType.NONE,
      ),
      Subject(
        name: "name",
        grade: '-',
        credits: SubType.NONE,
      ),
      Subject(
        name: "name",
        grade: '-',
        credits: SubType.NONE,
      ),
      Subject(
        name: "name",
        grade: '-',
        credits: SubType.NONE,
      ),
      Subject(
        name: "name",
        grade: '-',
        credits: SubType.NONE,
      ),
      Subject(
        name: "name",
        grade: '-',
        credits: SubType.NONE,
      ),
      Subject(
        name: "name",
        grade: '-',
        credits: SubType.NONE,
      ),
      Subject(
        name: "name",
        grade: '-',
        credits: SubType.NONE,
      ),
    ]),
    Semester("Sem 6", [
      Subject(
        name: "name",
        grade: '-',
        credits: SubType.NONE,
      ),
      Subject(
        name: "name",
        grade: '-',
        credits: SubType.NONE,
      ),
      Subject(
        name: "name",
        grade: '-',
        credits: SubType.NONE,
      ),
      Subject(
        name: "name",
        grade: '-',
        credits: SubType.NONE,
      ),
      Subject(
        name: "name",
        grade: '-',
        credits: SubType.NONE,
      ),
      Subject(
        name: "name",
        grade: '-',
        credits: SubType.NONE,
      ),
      Subject(
        name: "name",
        grade: '-',
        credits: SubType.NONE,
      ),
      Subject(
        name: "name",
        grade: '-',
        credits: SubType.NONE,
      ),
      Subject(
        name: "name",
        grade: '-',
        credits: SubType.NONE,
      ),
    ]),
    Semester("Sem 7", [
      Subject(
        name: "name",
        grade: '-',
        credits: SubType.NONE,
      ),
      Subject(
        name: "name",
        grade: '-',
        credits: SubType.NONE,
      ),
      Subject(
        name: "name",
        grade: '-',
        credits: SubType.NONE,
      ),
      Subject(
        name: "name",
        grade: '-',
        credits: SubType.NONE,
      ),
      Subject(
        name: "name",
        grade: '-',
        credits: SubType.NONE,
      ),
      Subject(
        name: "name",
        grade: '-',
        credits: SubType.NONE,
      ),
      Subject(
        name: "name",
        grade: '-',
        credits: SubType.NONE,
      ),
      Subject(
        name: "name",
        grade: '-',
        credits: SubType.NONE,
      ),
      Subject(
        name: "name",
        grade: '-',
        credits: SubType.NONE,
      ),
      Subject(
        name: "name",
        grade: '-',
        credits: SubType.NONE,
      ),
    ]),
    Semester("Sem 8", [
      Subject(
        name: "name",
        grade: '-',
        credits: SubType.NONE,
      ),
      Subject(
        name: "name",
        grade: '-',
        credits: SubType.NONE,
      ),
      Subject(
        name: "name",
        grade: '-',
        credits: SubType.NONE,
      ),
      Subject(
        name: "name",
        grade: '-',
        credits: SubType.NONE,
      ),
      Subject(
        name: "name",
        grade: '-',
        credits: SubType.NONE,
      ),
    ])
  ];
  bool semesterLoaded = false;
  AppContext() {
    init();
  }
  void setGrade(int semIdx, int subIdx, String grade) {
    semesters[semIdx].subjects[subIdx].grade = grade;
    notifyListeners();
    syncSemesters();
  }

  void init() async {
    try {
      appBox = await Hive.openBox("appDb");
      loading = false;
      _getSemesters();
    } catch (e) {}
  }

  void syncSemesters() async {
    await appBox.put("semesters", semesters);
  }

  Future<List<Semester>> _getSemesters() async {
    if (semesterLoaded) {
      return semesters;
    }
    var data = await appBox.get("semesters", defaultValue: []);
    List<Semester> sems = [];
    for (var e in (data as List)) {
      sems.add(e as Semester);
    }
    semesters.addAll(sems);
    notifyListeners();
    return semesters;
  }
}

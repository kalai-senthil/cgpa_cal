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
          name: "Engineering Math",
          grade: '-',
          credits: SubType.SUB,
        ),
        Subject(
          name: "IEDPA",
          grade: '-',
          credits: SubType.SUB,
        ),
        Subject(
          name: "MEDSD",
          grade: '-',
          credits: SubType.SUB,
        ),
        Subject(
          name: "PSA",
          grade: '-',
          credits: SubType.SUB,
        ),
        Subject(
          name: "PPY",
          grade: '-',
          credits: SubType.SUB,
        ),
        Subject(
          name: "MEDSD Lab",
          grade: '-',
          credits: SubType.LAB,
        ),
        Subject(
          name: "PPY Lab",
          grade: '-',
          credits: SubType.LAB,
        ),
        Subject(
          name: "EG lab",
          grade: '-',
          credits: SubType.LAB,
        ),
      ],
    ),
    Semester("Sem 2", [
      Subject(
        name:
            "Engineering Mathematics – II (Multiple Integrals and Transforms)",
        grade: '-',
        credits: SubType.SUB,
      ),
      Subject(
        name: "Programming in C ",
        grade: '-',
        credits: SubType.SUB,
      ),
      Subject(
        name: "Microprocessors and Microcontrollers",
        grade: '-',
        credits: SubType.SUB,
      ),
      Subject(
        name: "Front-End Web Development",
        grade: '-',
        credits: SubType.SUB,
      ),
      Subject(
        name: "Computer Organization and Architecture",
        grade: '-',
        credits: SubType.SUB,
      ),
      Subject(
        name: "Computer Graphics",
        grade: '-',
        credits: SubType.SUB,
      ),
      Subject(
        name: "Programming in C Laboratory ",
        grade: '-',
        credits: SubType.LAB,
      ),
      Subject(
        name: "Microprocessors and Microcontrollers Laboratory",
        grade: '-',
        credits: SubType.LAB,
      ),
      Subject(
        name: "Front-End Web Development Laboratory",
        grade: '-',
        credits: SubType.LAB,
      ),
    ]),
    Semester("Sem 3", [
      Subject(
        name: "Numerical Methods",
        grade: '-',
        credits: SubType.SUB,
      ),
      Subject(
        name: "Data Structures",
        grade: '-',
        credits: SubType.SUB,
      ),
      Subject(
        name: "Programming in C++",
        grade: '-',
        credits: SubType.SUB,
      ),
      Subject(
        name: "Automata and Compiler Design",
        grade: '-',
        credits: SubType.SUB,
      ),
      Subject(
        name: "Operating Systems",
        grade: '-',
        credits: SubType.SUB,
      ),
      Subject(
        name: "Data Communications and Computer Networks",
        grade: '-',
        credits: SubType.SUB,
      ),
      Subject(
        name: "General Proficiency - I",
        grade: '-',
        credits: SubType.LAB,
      ),
      Subject(
        name: "Numerical Methods Laboratory",
        grade: '-',
        credits: SubType.LAB,
      ),
      Subject(
        name: "Data Structures Laboratory",
        grade: '-',
        credits: SubType.LAB,
      ),
      Subject(
        name: "Programming in C++ Laboratory",
        grade: '-',
        credits: SubType.LAB,
      ),
      Subject(
        name: "Linux Internals Laboratory",
        grade: '-',
        credits: SubType.LAB,
      ),
    ]),
    Semester("Sem 4", [
      Subject(
        name: "Discrete Mathematics and Graph Theory",
        grade: '-',
        credits: SubType.SUB,
      ),
      Subject(
        name: "Programming in Java",
        grade: '-',
        credits: SubType.SUB,
      ),
      Subject(
        name: "Database Management Systems",
        grade: '-',
        credits: SubType.SUB,
      ),
      Subject(
        name: "Design and Analysis of Algorithms",
        grade: '-',
        credits: SubType.SUB,
      ),
      Subject(
        name: "Professional Elective - I",
        grade: '-',
        credits: SubType.SUB,
      ),
      Subject(
        name: "Open Elective - I",
        grade: '-',
        credits: SubType.SUB,
      ),
      Subject(
        name: "General Proficiency - II",
        grade: '-',
        credits: SubType.LAB,
      ),
      Subject(
        name: "Programming in Java Laboratory",
        grade: '-',
        credits: SubType.LAB,
      ),
      Subject(
        name: "Database Management Systems Laboratory",
        grade: '-',
        credits: SubType.LAB,
      ),
      Subject(
        name: "Design and Analysis of Algorithms Laboratory",
        grade: '-',
        credits: SubType.LAB,
      ),
    ]),
    Semester("Sem 5", [
      Subject(
        name: "Probability and Statistics",
        grade: '-',
        credits: SubType.SUB,
      ),
      Subject(
        name: "Handheld Computing: Design and Application Development",
        grade: '-',
        credits: SubType.SUB,
      ),
      Subject(
        name: "Programming in PHP",
        grade: '-',
        credits: SubType.SUB,
      ),
      Subject(
        name: "Software Engineering and Testing",
        grade: '-',
        credits: SubType.SUB,
      ),
      Subject(
        name: "Professional Elective - II",
        grade: '-',
        credits: SubType.SUB,
      ),
      Subject(
        name: "Open Elective – II",
        grade: '-',
        credits: SubType.SUB,
      ),
      Subject(
        name: "Handheld Computing Laboratory",
        grade: '-',
        credits: SubType.LAB,
      ),
      Subject(
        name: "Programming in PHP Laboratory",
        grade: '-',
        credits: SubType.LAB,
      ),
      Subject(
        name: "Software Testing Laboratory",
        grade: '-',
        credits: SubType.LAB,
      ),
    ]),
    Semester("Sem 6", [
      Subject(
        name: "Artificial Intelligence and Expert Systems",
        grade: '-',
        credits: SubType.SUB,
      ),
      Subject(
        name: "C# and .Net Programming",
        grade: '-',
        credits: SubType.SUB,
      ),
      Subject(
        name: "Cloud Computing and Big Data",
        grade: '-',
        credits: SubType.SUB,
      ),
      Subject(
        name: "Animation and Visual Effects",
        grade: '-',
        credits: SubType.SUB,
      ),
      Subject(
        name: "Professional Elective - III",
        grade: '-',
        credits: SubType.SUB,
      ),
      Subject(
        name: "Open Elective - III",
        grade: '-',
        credits: SubType.SUB,
      ),
      Subject(
        name: "Artificial Intelligence and Expert Systems Laboratory",
        grade: '-',
        credits: SubType.LAB,
      ),
      Subject(
        name: "C# and .Net Programming Laboratory",
        grade: '-',
        credits: SubType.LAB,
      ),
      Subject(
        name: "Animation and Visual Effects Laboratory",
        grade: '-',
        credits: SubType.LAB,
      ),
    ]),
    Semester("Sem 7", [
      Subject(
        name: "IoT and Edge Computing",
        grade: '-',
        credits: SubType.SUB,
      ),
      Subject(
        name: "Data Science and Digital Marketing Analytics",
        grade: '-',
        credits: SubType.SUB,
      ),
      Subject(
        name: "Professional Elective – IV",
        grade: '-',
        credits: SubType.SUB,
      ),
      Subject(
        name: "Open Elective – IV",
        grade: '-',
        credits: SubType.SUB,
      ),
      Subject(
        name: "Business Basics for Entrepreneur",
        grade: '-',
        credits: SubType.LAB,
      ),
      Subject(
        name: "IoT and Edge Computing Laboratory",
        grade: '-',
        credits: SubType.LAB,
      ),
      Subject(
        name: "Data Science and Digital Marketing Analytics Laboratory",
        grade: '-',
        credits: SubType.LAB,
      ),
      Subject(
        name: "Comprehensive Viva-Voce",
        grade: '-',
        credits: SubType.LAB,
      ),
      Subject(
        name: "Project phase – I",
        grade: '-',
        credits: SubType.PP1,
      ),
      Subject(
        name: "Internship / Inplant Training",
        grade: '-',
        credits: SubType.PP1,
      ),
    ]),
    Semester("Sem 8", [
      Subject(
        name: "Block chain and Cryptography",
        grade: '-',
        credits: SubType.SUB,
      ),
      Subject(
        name: "Professional Elective – V",
        grade: '-',
        credits: SubType.SUB,
      ),
      Subject(
        name: "Professional Elective – VI ",
        grade: '-',
        credits: SubType.SUB,
      ),
      Subject(
        name: "Entrepreneurship Management",
        grade: '-',
        credits: SubType.LAB,
      ),
      Subject(
        name: "Project phase – II",
        grade: '-',
        credits: SubType.PP2,
      ),
    ])
  ];
  bool semesterLoaded = false;
  AppContext() {
    init();
  }
  void clearSem(int semIdx) {
    for (var element in semesters[semIdx].subjects) {
      element.grade = '-';
    }
    notifyListeners();
    syncSemesters();
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

  void _getSemesters() async {
    if (semesterLoaded) {
      return;
    }
    var data = await appBox.get("semesters", defaultValue: []) as List;
    if (data.isEmpty) {
      await appBox.put("semesters", semesters);
      return;
    }
    List<Semester> sems = [];
    for (var e in data) {
      sems.add(e as Semester);
    }
    semesters = sems;
    semesterLoaded = false;
    notifyListeners();
  }
}

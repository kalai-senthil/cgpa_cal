import 'package:hive_flutter/adapters.dart';
part 'sem.g.dart';

@HiveType(typeId: 2)
enum SubType {
  @HiveField(0)
  SUB,
  @HiveField(1)
  LAB,
  @HiveField(2)
  NONE,
  @HiveField(3)
  PP2,
  @HiveField(4)
  PP1,
}

Map<String, int> grades = {
  "S": 10,
  "A": 9,
  "B": 8,
  "C": 7,
  "D": 6,
  "E": 5,
  "F": 0,
  "FA": 0,
  '-': 0
};

@HiveType(typeId: 0)
class Semester extends HiveObject {
  @HiveField(0)
  String name;
  @HiveField(1)
  List<Subject> subjects = [];
  Semester(this.name, this.subjects);
}

@HiveType(typeId: 1)
class Subject extends HiveObject {
  @HiveField(0)
  String name;
  @HiveField(1)
  String grade = '-';
  @HiveField(2)
  SubType credits;
  Subject({required this.name, required this.grade, required this.credits});
}

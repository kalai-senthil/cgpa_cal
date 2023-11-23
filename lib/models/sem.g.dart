// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sem.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class SemesterAdapter extends TypeAdapter<Semester> {
  @override
  final int typeId = 0;

  @override
  Semester read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Semester(
      fields[0] as String,
      (fields[1] as List).cast<Subject>(),
    );
  }

  @override
  void write(BinaryWriter writer, Semester obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.name)
      ..writeByte(1)
      ..write(obj.subjects);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is SemesterAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class SubjectAdapter extends TypeAdapter<Subject> {
  @override
  final int typeId = 1;

  @override
  Subject read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Subject(
      name: fields[0] as String,
      grade: fields[1] as String,
      credits: fields[2] as SubType,
    );
  }

  @override
  void write(BinaryWriter writer, Subject obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.name)
      ..writeByte(1)
      ..write(obj.grade)
      ..writeByte(2)
      ..write(obj.credits);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is SubjectAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class SubTypeAdapter extends TypeAdapter<SubType> {
  @override
  final int typeId = 2;

  @override
  SubType read(BinaryReader reader) {
    switch (reader.readByte()) {
      case 0:
        return SubType.SUB;
      case 1:
        return SubType.LAB;
      case 2:
        return SubType.NONE;
      case 3:
        return SubType.PP2;
      case 4:
        return SubType.PP1;
      default:
        return SubType.SUB;
    }
  }

  @override
  void write(BinaryWriter writer, SubType obj) {
    switch (obj) {
      case SubType.SUB:
        writer.writeByte(0);
        break;
      case SubType.LAB:
        writer.writeByte(1);
        break;
      case SubType.NONE:
        writer.writeByte(2);
        break;
      case SubType.PP2:
        writer.writeByte(3);
        break;
      case SubType.PP1:
        writer.writeByte(4);
        break;
    }
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is SubTypeAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'quest_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class QuestModelAdapter extends TypeAdapter<QuestModel> {
  @override
  final int typeId = 1;

  @override
  QuestModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return QuestModel(
      id: fields[0] as String,
      title: fields[1] as String,
      description: fields[2] as String,
      xp: fields[3] as int,
      durationDays: fields[4] as int?,
      category: fields[5] as QuestCategory,
      isActive: fields[6] as bool,
      startTime: fields[7] as DateTime?,
      completionTime: fields[8] as DateTime?,
    );
  }

  @override
  void write(BinaryWriter writer, QuestModel obj) {
    writer
      ..writeByte(9)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.title)
      ..writeByte(2)
      ..write(obj.description)
      ..writeByte(3)
      ..write(obj.xp)
      ..writeByte(4)
      ..write(obj.durationDays)
      ..writeByte(5)
      ..write(obj.category)
      ..writeByte(6)
      ..write(obj.isActive)
      ..writeByte(7)
      ..write(obj.startTime)
      ..writeByte(8)
      ..write(obj.completionTime);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is QuestModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class QuestCategoryAdapter extends TypeAdapter<QuestCategory> {
  @override
  final int typeId = 0;

  @override
  QuestCategory read(BinaryReader reader) {
    switch (reader.readByte()) {
      case 0:
        return QuestCategory.basic;
      case 1:
        return QuestCategory.difficult;
      case 2:
        return QuestCategory.family;
      case 3:
        return QuestCategory.investments;
      default:
        return QuestCategory.basic;
    }
  }

  @override
  void write(BinaryWriter writer, QuestCategory obj) {
    switch (obj) {
      case QuestCategory.basic:
        writer.writeByte(0);
        break;
      case QuestCategory.difficult:
        writer.writeByte(1);
        break;
      case QuestCategory.family:
        writer.writeByte(2);
        break;
      case QuestCategory.investments:
        writer.writeByte(3);
        break;
    }
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is QuestCategoryAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

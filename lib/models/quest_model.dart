import 'package:hive/hive.dart';

part 'quest_model.g.dart';

@HiveType(typeId: 0)
enum QuestCategory {
  @HiveField(0)
  basic,

  @HiveField(1)
  difficult,

  @HiveField(2)
  family,

  @HiveField(3)
  investments,
}

@HiveType(typeId: 1)
class QuestModel extends HiveObject {
  @HiveField(0)
  String id;

  @HiveField(1)
  String title;

  @HiveField(2)
  String description;

  @HiveField(3)
  int xp;

  @HiveField(4)
  int? durationDays;

  @HiveField(5)
  QuestCategory category;

  @HiveField(6)
  bool isActive;

  @HiveField(7)
  DateTime? startTime;

  @HiveField(8)
  DateTime? completionTime;

  QuestModel({
    required this.id,
    required this.title,
    required this.description,
    required this.xp,
    required this.durationDays,
    required this.category,
    this.isActive = false,
    this.startTime,
    this.completionTime,
  });

  Duration? get duration =>
      durationDays != null ? Duration(days: durationDays!) : null;

  bool get isCompleted => completionTime != null;

  bool get isExpired {
    if (duration == null || startTime == null) return false;
    final end = startTime!.add(duration!);
    return DateTime.now().isAfter(end);
  }

  bool get canBeCompleted => !isCompleted && (duration == null || isExpired);
}

import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

import '../models/quest_model.dart';

class QuestProvider extends ChangeNotifier {
  final Box<QuestModel> _box;
  QuestCategory _selectedCategory = QuestCategory.basic;

  QuestProvider(this._box);

  QuestCategory get selectedCategory => _selectedCategory;

  List<QuestModel> get all => _box.values.toList();

  List<QuestModel> get activeQuests =>
      all.where((q) => q.isActive && !q.isCompleted).toList();

  List<QuestModel> get completedQuests =>
      all.where((q) => q.isCompleted).toList();

  List<QuestModel> get availableQuests => all
      .where((q) =>
          q.category == _selectedCategory && !q.isActive && !q.isCompleted)
      .toList();

  int get completedCount => completedQuests.length;
  int get totalCount => all.length;
  double get progress => totalCount == 0 ? 0 : completedCount / totalCount;

  void selectCategory(QuestCategory category) {
    _selectedCategory = category;
    notifyListeners();
  }

  void activateQuest(QuestModel quest) {
    if (activeQuests.length >= 5 || quest.isActive) return;
    quest
      ..isActive = true
      ..startTime = DateTime.now();
    quest.save();
    notifyListeners();
  }

  void cancelQuest(QuestModel quest) {
    quest
      ..isActive = false
      ..startTime = null;
    quest.save();
    notifyListeners();
  }

  void completeQuest(QuestModel quest) {
    if (!quest.canBeCompleted) return;
    quest.completionTime = DateTime.now();
    quest.save();
    notifyListeners();
  }

  void resetAllQuests() {
    for (final quest in all) {
      quest
        ..isActive = false
        ..startTime = null
        ..completionTime = null;
      quest.save();
    }
    notifyListeners();
  }

  void completeAllQuests() {
    for (final q in all) {
      q
        ..completionTime = DateTime.now()
        ..isActive = false;
      q.save();
    }
    notifyListeners();
  }
}

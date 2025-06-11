import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/quest_model.dart';
import '../providers/quest_provider.dart';
import '../screens/сompleted_screen.dart';

class CategoryTabs extends StatelessWidget {
  const CategoryTabs({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = context.watch<QuestProvider>();
    final selected = provider.selectedCategory;
    final hasCompleted = provider.completedQuests.isNotEmpty;
    final availableCategories = QuestCategory.values.where((cat) {
      return provider.all
          .where((q) => !q.isActive && !q.isCompleted)
          .any((q) => q.category == cat);
    }).toList();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text(
              'Tasks',
              style: TextStyle(
                color: Colors.white,
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            if (hasCompleted)
              GestureDetector(
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (_) => const CompletedScreen(),
                    ),
                  );
                },
                child: const Row(
                  children: [
                    Text(
                      'Completed',
                      style: TextStyle(
                        color: Colors.lightBlueAccent,
                        fontSize: 14,
                        decoration: TextDecoration.underline,
                        decorationColor: Colors.lightBlueAccent,
                      ),
                    ),
                    SizedBox(width: 4),
                    Icon(Icons.arrow_forward,
                        color: Colors.lightBlueAccent, size: 18),
                  ],
                ),
              ),
          ],
        ),
        const SizedBox(height: 8),
        if (availableCategories.isNotEmpty)
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            physics: const NeverScrollableScrollPhysics(),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: List.generate(availableCategories.length, (index) {
                final cat = availableCategories[index];
                final isSelected = cat == selected;
                final isLast = index == availableCategories.length - 1;

                return Padding(
                  padding: EdgeInsets.only(right: isLast ? 0 : 8),
                  child: GestureDetector(
                    onTap: () => provider.selectCategory(cat),
                    child: FittedBox(
                      fit: BoxFit.scaleDown,
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 12, vertical: 8),
                        decoration: BoxDecoration(
                          color: isSelected ? Colors.lightBlue : Colors.white12,
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Text(
                          cat.name[0].toUpperCase() + cat.name.substring(1),
                          style: TextStyle(
                            color: isSelected ? Colors.white : Colors.white70,
                            fontSize: 14,
                          ),
                        ),
                      ),
                    ),
                  ),
                );
              }),
            ),
          ),
      ],
    );
  }
}

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/quest_model.dart';
import '../providers/quest_provider.dart';
import '../widgets/completed_quest_card.dart';

class CompletedScreen extends StatefulWidget {
  const CompletedScreen({super.key});

  @override
  State<CompletedScreen> createState() => _CompletedScreenState();
}

class _CompletedScreenState extends State<CompletedScreen> {
  QuestCategory? selectedCategory;

  @override
  Widget build(BuildContext context) {
    final provider = context.watch<QuestProvider>();
    final allCompleted = provider.completedQuests;
    final categories = allCompleted.map((e) => e.category).toSet().toList();

    final filtered = selectedCategory != null
        ? allCompleted.where((q) => q.category == selectedCategory).toList()
        : allCompleted;

    filtered.sort((a, b) => b.completionTime!.compareTo(a.completionTime!));

    return Scaffold(
      backgroundColor: const Color(0xFF0E0D2A),
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0,
        surfaceTintColor: Colors.transparent,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new, color: Colors.white),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: const Text(
          'Completed',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (categories.length > 1)
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: categories.map((cat) {
                    final isSelected = cat == selectedCategory;
                    return Padding(
                      padding: const EdgeInsets.only(right: 8),
                      child: GestureDetector(
                        onTap: () {
                          setState(() {
                            selectedCategory = isSelected ? null : cat;
                          });
                        },
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 12, vertical: 8),
                          decoration: BoxDecoration(
                            color:
                                isSelected ? Colors.lightBlue : Colors.white12,
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
                    );
                  }).toList(),
                ),
              ),
            const SizedBox(height: 16),
            Expanded(
              child: ListView.builder(
                itemCount: filtered.length,
                itemBuilder: (_, index) =>
                    CompletedQuestCard(quest: filtered[index]),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';

import '../models/quest_model.dart';
import '../providers/quest_provider.dart';
import '../widgets/active_quest_card.dart';
import '../widgets/category_tabs.dart';
import '../widgets/completed_quest_card.dart';
import '../widgets/progress_block.dart';
import '../widgets/quest_card.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  QuestCategory selectedTab = QuestCategory.basic;

  @override
  Widget build(BuildContext context) {
    final provider = context.watch<QuestProvider>();
    final allCompleted = provider.completedCount == provider.totalCount &&
        provider.totalCount == 40;

    return Scaffold(
      backgroundColor: const Color(0xFF0E0D2A),
      appBar: AppBar(
        surfaceTintColor: Colors.transparent,
        centerTitle: true,
        title: const Text(
          'Home',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.fromLTRB(16, 16, 16, 90),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ProgressBlock(
              completed: provider.completedCount,
              total: provider.totalCount,
              percent: provider.progress,
            ),
            const SizedBox(height: 20),
            if (allCompleted) ...[
              Center(
                child: Lottie.asset(
                  'assets/animations/winer.json',
                  width: 250,
                ),
              ),
              const SizedBox(height: 16),
              const Center(
                child: Text(
                  "You've completed all the tasks",
                  style: TextStyle(color: Colors.white70, fontSize: 16),
                ),
              ),
              const SizedBox(height: 24),
              const Text(
                'Completed',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 12),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: QuestCategory.values.map((cat) {
                    final isSelected = cat == selectedTab;
                    return Padding(
                      padding: const EdgeInsets.only(right: 8),
                      child: GestureDetector(
                        onTap: () => setState(() => selectedTab = cat),
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
              const SizedBox(height: 12),
              ...provider.completedQuests
                  .where((q) => q.category == selectedTab)
                  .map((q) => CompletedQuestCard(quest: q))
                  .toList(),
            ] else ...[
              if (provider.activeQuests.isEmpty) ...[
                Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
                  decoration: BoxDecoration(
                    color: const Color(0xFF1C2343),
                    border: Border.all(color: Colors.white24, width: 0.5),
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        'No active tasks',
                        style: TextStyle(color: Colors.white, fontSize: 16),
                      ),
                      Text(
                        '0/5',
                        style: TextStyle(color: Colors.white54, fontSize: 15),
                      ),
                    ],
                  ),
                ),
              ] else ...[
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text('Active Tasks',
                        style: TextStyle(color: Colors.white, fontSize: 16)),
                    Text(
                      '${provider.activeQuests.length}/5',
                      style: const TextStyle(color: Colors.white70),
                    ),
                  ],
                ),
                const SizedBox(height: 8),
                Column(
                  children: provider.activeQuests
                      .map((q) => ActiveQuestCard(quest: q))
                      .toList(),
                ),
              ],
              const SizedBox(height: 20),
              const CategoryTabs(),
              const SizedBox(height: 12),
              ...provider.availableQuests
                  .map((q) => QuestCard(quest: q))
                  .toList(),
            ],
          ],
        ),
      ),
    );
  }
}

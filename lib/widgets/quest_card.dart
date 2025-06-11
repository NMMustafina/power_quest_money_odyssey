import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/quest_model.dart';
import '../providers/quest_provider.dart';
import '../utils/show_confirm_dialog.dart';

class QuestCard extends StatelessWidget {
  final QuestModel quest;

  const QuestCard({super.key, required this.quest});

  @override
  Widget build(BuildContext context) {
    final provider = context.read<QuestProvider>();
    final canActivate = provider.activeQuests.length < 5;

    return Container(
      margin: const EdgeInsets.only(bottom: 4),
      padding: const EdgeInsets.fromLTRB(12, 4, 4, 12),
      decoration: BoxDecoration(
        color: const Color(0xFF1C2343),
        border: Border.all(color: Colors.white24, width: 0.5),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                child: Text(
                  quest.title,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              GestureDetector(
                onTap: canActivate
                    ? () => showConfirmDialog(
                          context,
                          title: 'Get the task',
                          content:
                              'Please note that some tasks are time-limited',
                          confirmText: 'Start',
                          onConfirm: () => provider.activateQuest(quest),
                        )
                    : null,
                child: Container(
                  width: 40,
                  height: 40,
                  decoration: BoxDecoration(
                    color: canActivate ? const Color(0xFF7CDC33) : Colors.grey,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: const Icon(Icons.play_arrow, color: Colors.white),
                ),
              ),
            ],
          ),
          const SizedBox(height: 4),
          Text(
            quest.description,
            style: const TextStyle(
              color: Colors.white70,
              fontSize: 14,
            ),
          ),
          const SizedBox(height: 12),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                '${quest.xp} XP',
                style: const TextStyle(
                  color: Colors.white54,
                  fontSize: 13,
                ),
              ),
              if (quest.duration != null)
                Row(
                  children: [
                    const Icon(
                      Icons.schedule,
                      color: Colors.lightBlueAccent,
                      size: 16,
                    ),
                    const SizedBox(width: 4),
                    Text(
                      '${quest.durationDays} day${quest.durationDays == 1 ? '' : 's'}',
                      style: const TextStyle(
                        color: Colors.lightBlueAccent,
                        fontSize: 13,
                      ),
                    ),
                    const SizedBox(width: 8),
                  ],
                ),
            ],
          ),
        ],
      ),
    );
  }
}

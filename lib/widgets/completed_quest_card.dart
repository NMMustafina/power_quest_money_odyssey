import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../models/quest_model.dart';

class CompletedQuestCard extends StatelessWidget {
  final QuestModel quest;

  const CompletedQuestCard({super.key, required this.quest});

  @override
  Widget build(BuildContext context) {
    final date = quest.completionTime != null
        ? DateFormat('dd.MM.yyyy').format(quest.completionTime!)
        : '';

    return Container(
      margin: const EdgeInsets.only(bottom: 8),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: const Color(0xFF1C2343),
        border: Border.all(color: Colors.white24, width: 0.5),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            quest.title,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
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
              Row(
                children: [
                  if (quest.completionTime != null) ...[
                    Text(
                      date,
                      style: const TextStyle(
                        color: Color(0xFF7CDC33),
                        fontSize: 13,
                      ),
                    ),
                  ],
                  if (quest.durationDays != null) ...[
                    const SizedBox(width: 12),
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
                  ],
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}

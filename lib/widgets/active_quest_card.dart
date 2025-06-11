import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

import '../models/quest_model.dart';
import '../providers/quest_provider.dart';
import '../utils/show_confirm_dialog.dart';

class ActiveQuestCard extends StatefulWidget {
  final QuestModel quest;

  const ActiveQuestCard({super.key, required this.quest});

  @override
  State<ActiveQuestCard> createState() => _ActiveQuestCardState();
}

class _ActiveQuestCardState extends State<ActiveQuestCard> {
  Timer? _timer;
  String remaining = '';

  @override
  void initState() {
    super.initState();
    _updateTimer();
    if (widget.quest.duration != null) {
      _timer =
          Timer.periodic(const Duration(seconds: 1), (_) => _updateTimer());
    }
  }

  void _updateTimer() {
    if (widget.quest.duration == null || widget.quest.startTime == null) return;
    final end = widget.quest.startTime!.add(widget.quest.duration!);
    final diff = end.difference(DateTime.now());
    if (diff.isNegative) {
      _timer?.cancel();
      setState(() => remaining = 'Time\'s up');
    } else {
      final d = diff.inDays;
      final h = (diff.inHours % 24).toString().padLeft(2, '0');
      final m = (diff.inMinutes % 60).toString().padLeft(2, '0');
      final s = (diff.inSeconds % 60).toString().padLeft(2, '0');

      setState(() {
        remaining = d > 0 ? '$d day${d == 1 ? '' : 's'} $h:$m:$s' : '$h:$m:$s';
      });
    }
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final provider = context.read<QuestProvider>();
    final quest = widget.quest;
    final canFinish = quest.canBeCompleted;

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
              Row(
                children: [
                  GestureDetector(
                    onTap: () => showConfirmDialog(
                      context,
                      title: 'Cancel task?',
                      content: 'The progress of this task will be reset',
                      confirmText: 'Confirm',
                      onConfirm: () => provider.cancelQuest(quest),
                    ),
                    child: Container(
                      width: 40,
                      height: 40,
                      margin: const EdgeInsets.only(right: 4),
                      decoration: BoxDecoration(
                        color: const Color(0xFFE54D4D),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: const Icon(Icons.close, color: Colors.white),
                    ),
                  ),
                  GestureDetector(
                    onTap: canFinish
                        ? () => showConfirmDialog(
                              context,
                              title: 'Complete the task',
                              confirmText: 'Confirm',
                              onConfirm: () => provider.completeQuest(quest),
                            )
                        : null,
                    child: Container(
                      width: 40,
                      height: 40,
                      decoration: BoxDecoration(
                        color: canFinish ? Colors.lightBlueAccent : Colors.grey,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Center(
                        child: SvgPicture.asset(
                          'assets/icons/flag.svg',
                          color: Colors.white,
                          width: 20,
                          height: 20,
                        ),
                      ),
                    ),
                  ),
                ],
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
                      color: Color(0xFF7CDC33),
                      size: 16,
                    ),
                    const SizedBox(width: 4),
                    Text(
                      remaining,
                      style: const TextStyle(
                        color: Color(0xFF7CDC33),
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

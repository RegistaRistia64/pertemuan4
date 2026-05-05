import 'package:flutter/material.dart';
import 'package:regista2306157p4/models/quest.dart';
import 'package:regista2306157p4/pages/detail_quest_page.dart';

class QuestListWidget extends StatelessWidget {
  final List<Quest> quests;
  final Function(int) onQuestToggle;

  const QuestListWidget({
    super.key,
    required this.quests,
    required this.onQuestToggle,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: quests.length,
      separatorBuilder: (_, __) => const SizedBox(height: 8),
      itemBuilder: (context, index) => QuestWidget(
        quest: quests[index],
        onTap: () async {
          final result = await Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => DetailQuestPage(quest: quests[index]),
            ),
          );
          
          if (result == true) {
            onQuestToggle(index);
          }
        },
      ),
    );
  }
}

class QuestWidget extends StatelessWidget {
  final Quest quest;
  final VoidCallback onTap;

  const QuestWidget({super.key, required this.quest, required this.onTap});

  @override
  Widget build(BuildContext context) {
    final bool isTaken = quest.isTaken;

    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(14),
      child: Ink(
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: isTaken ? Colors.green.shade50 : Colors.pinkAccent.withAlpha(24),
          borderRadius: BorderRadius.circular(14),
          border: Border.all(color: Colors.black.withAlpha(20)),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withAlpha(20),
              blurRadius: 4,
              offset: const Offset(0, 2),
            )
          ],
        ),
        child: Row(
          children: [
            Container(
              width: 40,
              height: 40,
              decoration: BoxDecoration(
                color: isTaken ? Colors.green.shade100 : Colors.pinkAccent.withAlpha(12),
                borderRadius: BorderRadius.circular(999),
              ),
              child: Icon(
                isTaken ? Icons.check_circle : Icons.circle_outlined,
                color: isTaken ? Colors.green : Colors.pink,
              ),
            ),
            const SizedBox(width: 10),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    quest.title,
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      decoration: isTaken ? TextDecoration.lineThrough : null,
                    ),
                  ),
                  const SizedBox(height: 2),
                  Row(
                    children: [
                      Text(
                        "Rank: ${quest.rank} | Result: ${quest.reward}",
                        style: TextStyle(fontSize: 12, color: Colors.grey[600]),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

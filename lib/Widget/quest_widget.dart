import 'package:flutter/material.dart';

class Quest {
  final String title;
  final String reward;
  final IconData icon;
  final Color color;

  const Quest({
    required this.title,
    required this.reward,
    this.icon = Icons.task_alt,
    this.color = const Color.fromARGB(255, 253, 80, 138),
  });
}

class QuestListWidget extends StatelessWidget {
  final List<Quest> quests;

  const QuestListWidget({super.key, required this.quests});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: quests.length,
      separatorBuilder: (_, __) => const SizedBox(height: 8),
      itemBuilder: (context, index) => QuestWidget(quest: quests[index]),
    );
  }
}

class QuestWidget extends StatelessWidget {
  final Quest quest;

  const QuestWidget({super.key, required this.quest});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      borderRadius: BorderRadius.circular(14),
      child: Ink(
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: Colors.pinkAccent.withAlpha(24),
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
                color: Colors.pinkAccent.withAlpha(12),
                borderRadius: BorderRadius.circular(999),
              ),
              child: Icon(quest.icon, color: quest.color),
            ),
            const SizedBox(width: 10),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    quest.title,
                    style: const TextStyle(fontWeight: FontWeight.w600),
                  ),
                  const SizedBox(height: 2),
                  Text(
                    "Reward : ${quest.reward}",
                    style: TextStyle(fontSize: 12, color: Colors.grey[600]),
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
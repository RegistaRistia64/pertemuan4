import 'package:flutter/material.dart';
import 'package:regista2306157p4/models/quest.dart';

class DetailQuestPage extends StatefulWidget {
  final Quest quest;

  const DetailQuestPage({super.key, required this.quest});

  @override
  State<DetailQuestPage> createState() => _DetailQuestPageState();
}

class _DetailQuestPageState extends State<DetailQuestPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Detail Quest"),
        backgroundColor: Colors.pinkAccent,
        foregroundColor: Colors.white,
      ),
      backgroundColor: Colors.pink[50],
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              height: 200,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                image: DecorationImage(
                  image: NetworkImage(widget.quest.imagePath),
                  fit: BoxFit.cover,
                ),
                boxShadow: [
                  BoxShadow(color: Colors.black26, blurRadius: 8, offset: Offset(0, 4)),
                ],
              ),
            ),
            const SizedBox(height: 24),
            Text(
              widget.quest.title,
              style: const TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
                color: Colors.pinkAccent,
              ),
            ),
            const SizedBox(height: 8),
            Row(
              children: [
                Chip(
                  label: Text("Rank: ${widget.quest.rank}"),
                  backgroundColor: Colors.pink.shade100,
                  side: BorderSide.none,
                ),
                const SizedBox(width: 8),
                Chip(
                  label: Text(widget.quest.isTaken ? "Status: Diambil" : "Status: Tersedia"),
                  backgroundColor: widget.quest.isTaken ? Colors.green.shade100 : Colors.amber.shade100,
                  side: BorderSide.none,
                ),
              ],
            ),
            const SizedBox(height: 16),
            const Text(
              "Deskripsi Quest:",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Text(
              widget.quest.desc,
              style: const TextStyle(fontSize: 16, height: 1.5),
            ),
            const SizedBox(height: 24),
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.pink.shade100,
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: Colors.pinkAccent),
              ),
              child: Row(
                children: [
                  const Icon(Icons.shopping_bag, color: Colors.pinkAccent),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Text(
                      "Reward: ${widget.quest.reward}",
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.pinkAccent,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 48),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: widget.quest.isTaken ? Colors.grey : Colors.pinkAccent,
                padding: const EdgeInsets.symmetric(vertical: 16),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              onPressed: widget.quest.isTaken
                  ? null
                  : () {
                      Navigator.pop(context, true); // true indicates status changed
                    },
              child: Text(
                widget.quest.isTaken ? "Quest Sudah Diambil" : "Ambil Quest",
                style: const TextStyle(fontSize: 18, color: Colors.white, fontWeight: FontWeight.bold),
              ),
            )
          ],
        ),
      ),
    );
  }
}

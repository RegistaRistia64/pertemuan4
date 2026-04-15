import 'package:flutter/material.dart';
import 'package:regista2306157p4/Widget/chip_widget.dart';
import 'package:regista2306157p4/Widget/header_widget.dart';
import 'package:regista2306157p4/Widget/quest_widget.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  final List<Quest> questList = const [
    Quest(title: "Memburu Rusa", reward: "100+ Gold"),
    Quest(title: "Mengumpulkan Kayu", reward: "50 Gold", icon: Icons.forest),
    Quest(title: "Kalahkan Naga", reward: "500+ Gold", icon: Icons.local_fire_department),
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Adventure Game',
      home: Scaffold(
        appBar: AppBar(
          title: const Text(
            "Adventure Game",
            style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
          ),
          backgroundColor: Colors.pinkAccent,
        ),
        body: Padding(
          padding: const EdgeInsets.all(12),
          child: Column(
            children: [
              HeaderWidget(
                name: "Level999",
                role: "Role Saya",
                imageUrl: "https://picsum.photos/seed/picsum/200/300",
              ),
              const SizedBox(height: 12),
              Row(
                spacing: 8,
                children: [
                  ChipWidget(color: Colors.pinkAccent, icon: Icons.favorite, label: "Health", value: 80),
                  ChipWidget(color: Colors.blueAccent, icon: Icons.favorite, label: "Heart", value: 80),
                  ChipWidget(color: Colors.amberAccent, icon: Icons.favorite, label: "Shield", value: 80),
                ],
              ),
              const SizedBox(height: 12),
              const Text("Quest list"),
              const SizedBox(height: 8),
              QuestListWidget(quests: questList),
            ],
          ),
        ),
      ),
    );
  }
}
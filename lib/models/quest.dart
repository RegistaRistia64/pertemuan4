import 'package:flutter/material.dart';

class Quest {
  final String title;
  final String rank;
  final String reward;
  final String imagePath;
  final String desc;
  bool isTaken;
  final IconData icon;

  Quest({
    required this.title,
    required this.rank,
    required this.reward,
    required this.imagePath,
    required this.desc,
    this.isTaken = false,
    this.icon = Icons.task_alt,
  });
}

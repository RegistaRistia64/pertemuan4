import 'package:flutter/material.dart';


class ChipWidget extends StatelessWidget {
  final Color color;
  final String label;
  final IconData icon;
  final int value;

  const ChipWidget({super.key, this.color = Colors.blueAccent, required this.label, required this.icon, required this.value});

  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
      decoration: BoxDecoration(
        color: color.withAlpha(25),
        borderRadius: BorderRadius.circular(999),
        border: Border.all(color: color.withAlpha(64),
        )
      ),
      child: Row(
        children: [
          Icon(Icons.favorite, size:18, color: Colors.pinkAccent,),
          Text(label),
          Text(value.toString(), style: const TextStyle(fontWeight: FontWeight.bold),),
        ],
      ),
    );
  }
}
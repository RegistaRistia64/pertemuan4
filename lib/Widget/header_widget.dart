import 'package:flutter/material.dart';

class HeaderWidget extends StatelessWidget {
  final String name;
  final String role;
  final String imageUrl;

  const HeaderWidget({super.key, required this.name, required this.role, required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.blueAccent,
        gradient: LinearGradient(
          colors: [Colors.blueGrey, Colors.brown],
          begin:.topStart,
          end: .bottomEnd
        ),
        borderRadius: BorderRadius.circular(12)
      ),
      padding: EdgeInsets.all(20),
      child: Row(
        children: [
          Stack(
            children: [
              CircleAvatar(
                radius: 100,
                backgroundImage: NetworkImage("https://picsum.photos/seed/picsum/200/300"),
              ),
              Positioned(
                right: 3,
                bottom: 0,
                child: Container(
                  padding: EdgeInsets.symmetric(
                    horizontal: 8, 
                    vertical: 4
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(999),
                    color: Colors.pinkAccent
                  ),
                  child: Text(name,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold
                  ),
                  ),
                ),
              )
            ],
          ),
          SizedBox(width: 12,),
          Expanded(
            child: Column(
              crossAxisAlignment: .start,
              children: [
                Text("level.toString()",
                style: TextStyle(
                  color: Colors.brown,
                  fontSize: 24,
                  fontWeight: FontWeight.bold
                ),
                ),
                Text("Secret")
              ],
            )
            )
      ],
      ),
    );
  }
}

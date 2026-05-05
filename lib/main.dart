import 'package:flutter/material.dart';
import 'package:regista2306157p4/Widget/chip_widget.dart';
import 'package:regista2306157p4/Widget/header_widget.dart';
import 'package:regista2306157p4/Widget/quest_widget.dart';
import 'package:regista2306157p4/models/quest.dart';
import 'package:regista2306157p4/pages/login_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final List<Quest> questList = [
    Quest(
      title: "Memburu Rusa Merah",
      rank: "E",
      reward: "100 Gold, 10 Exp",
      desc: "Rusa merah terlihat di dekat hutan utara. Bawa culanya kemari.",
      imagePath: "https://picsum.photos/seed/deer/400/200",
    ),
    Quest(
      title: "Mengumpulkan Serpihan Bintang",
      rank: "B",
      reward: "500 Gold, 100 Exp",
      desc: "Bintang jatuh di danau terlarang. Ambil serpihannya tanpa membangunkan naga.",
      imagePath: "https://picsum.photos/seed/star/400/200",
      icon: Icons.star,
    ),
    Quest(
      title: "Kalahkan Naga Kegelapan",
      rank: "SS",
      reward: "5000 Gold, Gelar",
      desc: "Naga legendaris telah bangun. Jangan mati.",
      imagePath: "https://picsum.photos/seed/dragon/400/200",
      icon: Icons.local_fire_department,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Adventure Game',
      debugShowCheckedModeBanner: false,
      initialRoute: "/",
      onGenerateRoute: (datas) {
        if (datas.name == "/") {
          if (datas.arguments == null || datas.arguments is! Map) {
            return MaterialPageRoute(builder: (context) => const LoginPage());
          }

          final args = Map<String, dynamic>.from(datas.arguments as Map);
          return MaterialPageRoute(
            builder: (context) => Homepage(
              userData: args,
              questList: questList,
              onQuestToggle: (int index) {
                setState(() {
                  questList[index].isTaken = true;
                });
              },
            ),
          );
        }
        return null;
      },
    );
  }
}

class Homepage extends StatefulWidget {
  final Map<String, dynamic> userData;
  final List<Quest> questList;
  final Function(int) onQuestToggle;

  const Homepage({
    super.key,
    required this.userData,
    required this.questList,
    required this.onQuestToggle,
  });

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  @override
  Widget build(BuildContext context) {
    final String name = widget.userData["name"] ?? "Unknown";
    final String level = widget.userData["level"] ?? "1";
    final String role = widget.userData["job"] ?? "Novice";
    final String rank = widget.userData["rank"] ?? "F";

    return Scaffold(
      backgroundColor: Colors.pink[50],
      appBar: AppBar(
        title: const Text(
          "Papan Misi Guild",
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
        ),
        backgroundColor: Colors.pinkAccent,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            HeaderWidget(
              name: name,
              level: level,
              role: role,
              imageUrl: "https://picsum.photos/seed/adventurer/200/300",
              rank: rank,
            ),
            const SizedBox(height: 16),
            const Text(
              "Daftar Quest Tersedia",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.pinkAccent),
            ),
            const SizedBox(height: 12),
            QuestListWidget(
              quests: widget.questList,
              onQuestToggle: widget.onQuestToggle,
            ),
          ],
        ),
      ),
    );
  }
}

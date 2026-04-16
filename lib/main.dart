import 'package:flutter/material.dart';
import 'package:flutter_application_1/pages/login_pages.dart';
import 'package:flutter_application_1/widget/chip_widget.dart';
import 'package:flutter_application_1/widget/header_widget.dart';
import 'package:flutter_application_1/widget/quest_widget.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Adventure Guild',
      initialRoute: "/",
      routes: {
        "/": (context) => const HomePage(),
        "/login": (context) => LoginPages(),
      },
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  // DATA QUEST DYNAMIC
  final List<Map<String, String>> questList = const [
    {"title": "Daily Login", "reward": "50 Gold"},
    {"title": "Kill 10 Monster", "reward": "100 Gold"},
    {"title": "Boss Raid", "reward": "Epic Sword"},
    {"title": "Collect Potion", "reward": "Healing Potion"},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Adventure Guild',
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
        ),
        backgroundColor: Colors.amberAccent,
      ),
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const HeaderWidget(
                name: "silfi", level: 1, role: "fighter", rank: "E"),
            const SizedBox(height: 10),

            Row(
              children: const [
                ChipWidget(
                  bg: Colors.red,
                  icon: Icons.favorite,
                  color: Colors.brown,
                  label: "HP",
                  value: "90",
                ),
                SizedBox(width: 8),
                ChipWidget(
                  bg: Colors.pinkAccent,
                  icon: Icons.flash_on,
                  color: Colors.greenAccent,
                  label: "MP",
                  value: "60",
                ),
                SizedBox(width: 8),
                ChipWidget(
                  bg: Colors.blueAccent,
                  icon: Icons.shield,
                  color: Colors.grey,
                  label: "DEF",
                  value: "30",
                ),
              ],
            ),

            const SizedBox(height: 15),
            const Text(
              "Quest List",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),

            const SizedBox(height: 10),

            // LIST QUEST DYNAMIC
            Expanded(
              child: ListView.builder(
                itemCount: questList.length,
                itemBuilder: (context, index) {
                  return QuestWidget(
                    title: questList[index]["title"]!,
                    reward: questList[index]["reward"]!,
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
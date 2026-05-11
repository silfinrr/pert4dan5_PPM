import 'package:flutter/material.dart';
import 'package:flutter_application_1/pages/login_pages.dart';
import 'package:flutter_application_1/pages/detail_quest_page.dart';
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
      initialRoute: "/login",
      onGenerateRoute: (datas) {
        if (datas.name == "/") {
          if (datas.arguments == null || datas.arguments is! Map) {
            return MaterialPageRoute(builder: (context) => const LoginPages());
          }

          final args = Map<String, dynamic>.from(datas.arguments as Map);
          return MaterialPageRoute(builder: (context) => HomePage(userData: args));
        }
        return null;
      },
    );
  }
}

class HomePage extends StatefulWidget {
  final Map<String, dynamic> userData;

  const HomePage({super.key, required this.userData});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // DATA QUEST DYNAMIC
  final List<Map<String, dynamic>> questList = [
    {
      "title": "Daily Login",
      "rank": "E",
      "reward": "50 Gold",
      "image": "https://picsum.photos/seed/daily/400/200",
      "desc": "Login ke dalam game setiap hari untuk mendapatkan reward harian.",
      "isTaken": false,
    },
    {
      "title": "Kill 10 Monster",
      "rank": "D",
      "reward": "100 Gold",
      "image": "https://picsum.photos/seed/monster/400/200",
      "desc": "Kalahkan 10 monster di hutan terdekat untuk melindungi desa.",
      "isTaken": false,
    },
    {
      "title": "Boss Raid",
      "rank": "S",
      "reward": "Epic Sword",
      "image": "https://picsum.photos/seed/boss/400/200",
      "desc": "Bergabung dengan tim untuk mengalahkan boss naga merah yang ganas.",
      "isTaken": false,
    },
    {
      "title": "Collect Potion",
      "rank": "F",
      "reward": "Healing Potion",
      "image": "https://picsum.photos/seed/potion/400/200",
      "desc": "Kumpulkan bahan-bahan herbal di hutan untuk meracik potion.",
      "isTaken": false,
    },
  ];

  @override
  Widget build(BuildContext context) {
    final String name = widget.userData['name'];
    final int level = widget.userData['level'];
    final String rank = widget.userData['rank'];
    final String job = widget.userData['job'];

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
            HeaderWidget(
              name: name,
              level: level,
              role: job,
              rank: rank,
            ),
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
                  return Padding(
                    padding: const EdgeInsets.only(bottom: 10.0),
                    child: QuestWidget(
                      title: questList[index]["title"],
                      reward: questList[index]["reward"],
                      rank: questList[index]["rank"],
                      isTaken: questList[index]["isTaken"],
                      onTap: () async {
                        final result = await Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => DetailQuestPage(quest: questList[index]),
                          ),
                        );

                        if (result == true) {
                          setState(() {
                            questList[index]["isTaken"] = true;
                          });
                        }
                      },
                    ),
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

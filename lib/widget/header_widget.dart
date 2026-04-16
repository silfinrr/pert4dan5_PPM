import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HeaderWidget extends StatelessWidget {
  final String name;
  final String role;
  final int level;
  final String rank; 

  const HeaderWidget({
    super.key,
    required this.name,
    required this.role,
    required this.level, 
    required this.rank,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [Colors.pinkAccent, Colors.cyan],
          begin: .topStart,
          end: .bottomEnd,
        ),
        borderRadius: BorderRadius.circular(16),
      ),
      padding: EdgeInsets.all(20),
      child: Row(
        children: [
          Stack(
            children: [
              CircleAvatar(
                radius: 100,
                backgroundImage: NetworkImage(
                  "https://picsum.photos/seed/picsum/200/300",
                ),
              ),
              Positioned(
                right: 3,
                bottom: 0,
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(999),
                    color: Colors.deepPurpleAccent,
                  ),
                  child: Text(
                    'level 9999999999',
                    style: TextStyle(
                      color: Colors.blueAccent,
                      fontSize: 15,
                      fontWeight: .bold,
                    ),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: .start,
              children: [
                Text(
                  name,
                  style: TextStyle(
                    color: Colors.black26,
                    fontWeight: .bold,
                    fontSize: 16,
                  ),
                ),
                Text("level anda : $level"),
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 16),
            decoration: BoxDecoration(
              color: Colors.blueAccent.withAlpha(20),
              borderRadius: BorderRadius.circular(4),
            ),
            child: Text(rank, style: GoogleFonts.bubblegumSans(
              textStyle: TextStyle(fontSize: 32, color: Colors.amberAccent)
            )),
          )
        ],
      ),
    );
  }
}





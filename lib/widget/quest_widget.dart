import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class QuestWidget extends StatelessWidget {
  final String title;
  final String reward;

  const QuestWidget({
    super.key,
    required this.title,
    required this.reward,
  });
  
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      borderRadius: BorderRadius.circular(14),
      child: Ink(
        padding: const EdgeInsets.all(50),
        decoration: BoxDecoration(
          color: Colors.blueAccent.withAlpha(45),
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: Colors.green),
          boxShadow: [
            BoxShadow(
              color: Colors.pink,
              blurRadius: 15,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Row(
          children: [
            Container(
              width: 12,
              height: 15,
              decoration: BoxDecoration(
                color: Colors.deepOrangeAccent.withAlpha(20),
                borderRadius: BorderRadius.circular(15),
              ),
              child: Icon(Icons.task_alt, color: CupertinoColors.systemPink),
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: .start,
                children: [
                  Text(title),
                  const SizedBox(height: 2),
                  Text(
                    reward,
                    style: const TextStyle(fontSize: 12),
                  ),
                ]

                
              ),
            ),
          ],
        ),
        
      ),
    );
  }
}

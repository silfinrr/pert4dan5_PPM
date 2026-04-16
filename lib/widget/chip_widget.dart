import 'package:flutter/material.dart';

class ChipWidget extends StatelessWidget {
  final IconData icon;
  final String label;
  final Color color;
  final String value;
  final Color bg;

  const ChipWidget({
    super.key,
    required this.icon,
    required this.label,
    required this.color,
    required this.value,
    required this.bg
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
      decoration: BoxDecoration(
        color: bg.withAlpha(20),
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: Colors.deepOrange.withAlpha(56)),
      ),
      child: Row(
        children: [
          Icon(icon, color: color),
          SizedBox(width: 10),
          Text(label),
          Text(value, style: const TextStyle(fontWeight: .bold)),
        ],
      ),
    );
  }
}

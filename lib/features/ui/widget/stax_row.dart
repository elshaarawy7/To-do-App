import 'package:flutter/material.dart';

class StatsRow extends StatelessWidget {
  final String title;
  final String value;
  final String subValue;
  final String? unit; // مثلاً % أو /496
  final IconData icon;

  const StatsRow({
    super.key,
    required this.title,
    required this.value,
    required this.subValue,
    this.unit,
    this.icon = Icons.arrow_right_alt,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          title,
          style: const TextStyle(
            color: Colors.black,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        Icon(icon, color: Colors.black, size: 30),
        Text(
          value,
          style: const TextStyle(
            color: Colors.black,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        Text(
          subValue,
          style: const TextStyle(
            color: Colors.grey,
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
        const Spacer(),
      ],
    );
  }
}

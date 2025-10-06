import 'package:flutter/material.dart';

class TaskProgressBar extends StatelessWidget {
  final double progress; // نسبة التقدم من 0 لـ 1
  const TaskProgressBar({super.key, required this.progress});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // النصوص اللي فوق الشريط
        Row(
          children: [
            const Text(
              "Completion rate",
              style: TextStyle(
                color: Colors.black,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            const Icon(Icons.arrow_right_alt, color: Colors.black, size: 30),
            Text(
              "${(progress * 100).toInt()}%",
              style: const TextStyle(
                color: Colors.black,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(width: 5),
            const Text(
              "completed",
              style: TextStyle(
                color: Colors.grey,
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),

        const SizedBox(height: 10),

        // شريط التقدم نفسه
        ClipRRect(
          borderRadius: BorderRadius.circular(15),
          child: LinearProgressIndicator(
            value: progress, // نسبة الإنجاز (0.8 = 80%)
            minHeight: 15,
            backgroundColor: Colors.grey.shade300,
            color: Colors.green,
          ),
        ),
      ],
    );
  }
}

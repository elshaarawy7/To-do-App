import 'package:flutter/material.dart';

class TaskItem extends StatelessWidget {
  final String title;
  final String category;
  final Color color;
  final bool isDone; // هل متعلم عليها؟
  final ValueChanged<bool?>? onChanged; // لما المستخدم يضغط على checkbox

  const TaskItem({
    super.key,
    required this.title,
    required this.category,
    required this.color,
    this.isDone = false,
    this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Checkbox(
        value: isDone,
        activeColor: color,
        onChanged: onChanged,
      ),
      title: Text(
        title,
        style: TextStyle(
          fontWeight: FontWeight.bold,
          decoration: isDone ? TextDecoration.lineThrough : null,
        ),
      ),
      trailing: Row(
  mainAxisSize: MainAxisSize.min, // 👈 الحل السحري
  children: [
    IconButton(
      onPressed: () {},
      icon: Icon(Icons.edit, color: Colors.black, size: 18),
    ),
    SizedBox(height: 5),
    IconButton(
      onPressed: () {},
      icon: Icon(Icons.delete_sharp, size: 18, color: Colors.black),
    ),
  ],
),

    );
  }
}

import 'package:flutter/material.dart';

class TaskPage extends StatelessWidget {
  final List<String> tasks;
  const TaskPage({super.key, required this.tasks});

  @override
  Widget build(BuildContext context) {
    if (tasks.isEmpty) {
      return const Center(
        child: Text(
          "No tasks yet 😴",
          style: TextStyle(fontSize: 16, color: Colors.grey),
        ),
      );
    }

    return ListView.builder(
      shrinkWrap: true,
      itemCount: tasks.length,
      itemBuilder: (context, index) {
        return Card(
          margin: const EdgeInsets.symmetric(vertical: 6),
          child: ListTile(
            title: Text(tasks[index]),
          ),
        );
      },
    );
  }
}

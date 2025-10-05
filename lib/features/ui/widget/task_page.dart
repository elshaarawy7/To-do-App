import 'package:flutter/material.dart';

class TaskPage extends StatefulWidget {
  final List<String> tasks;
  const TaskPage({super.key, required this.tasks});

  @override
  State<TaskPage> createState() => _TaskPageState();
}

class _TaskPageState extends State<TaskPage> {
  late List<bool> completed;

  @override
  void initState() {
    super.initState();
    completed = List.generate(widget.tasks.length, (_) => false);
  }

  @override
  Widget build(BuildContext context) {
     if (completed.length != widget.tasks.length) {
    completed = List.generate(widget.tasks.length, (index) {
      if (index < completed.length) {
        return completed[index]; // احتفظ بالحالة القديمة لو موجودة
      } else {
        return false; // التاسكات الجديدة تكون false
      }
    });
  } 

  
  if (widget.tasks.isEmpty) {
    return const Center(
      child: Text(
        "No tasks yet 😴",
        style: TextStyle(fontSize: 16, color: Colors.grey),
      ),
    );
  }

    return ListView.builder(
      itemCount: widget.tasks.length,
      itemBuilder: (context, index) {
        return SizedBox(
          height: 75, 
          child: Card(
            
            margin: const EdgeInsets.symmetric(vertical: 6, horizontal: 10),
            child: ListTile(
              leading: IconButton(
                icon: Icon(
                  completed[index]
                      ? Icons.check_box
                      : Icons.check_box_outline_blank,
                  color: completed[index] ? Colors.green : Colors.grey,
                ),
                onPressed: () {
                  setState(() {
                    completed[index] = !completed[index];
                  });
                },
              ),
              title: Text(
                widget.tasks[index],
                style: TextStyle(
                  decoration: completed[index]
                      ? TextDecoration.lineThrough
                      : TextDecoration.none,
                ),
              ),
              trailing: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  IconButton(
                    icon: const Icon(Icons.edit, color: Colors.blue),
                    onPressed: () {
                      // هنا تقدر تضيف logic التعديل
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text('Edit task ${widget.tasks[index]}')),
                      );
                    },
                  ),
                  IconButton(
                    icon: const Icon(Icons.delete, color: Colors.red),
                    onPressed: () {
                      setState(() {
                        widget.tasks.removeAt(index);
                        completed.removeAt(index);
                      });
                    },
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}

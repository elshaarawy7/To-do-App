import 'package:flutter/material.dart';
import 'package:todo_app/features/ui/widget/add_task_battom_sheate.dart';
import 'package:todo_app/features/ui/widget/flotang_action_batton.dart';
import 'package:todo_app/features/ui/widget/task_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // هنا الليستة اللي بتحتفظ بالتاسكات
  final List<String> tasks = [];

  // function لإضافة التاسك
  void addTask(String title) {
    setState(() {
      tasks.add(title);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 12),
        child: Column(
          children: [
            const SizedBox(height: 40),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                children: [
                  const CircleAvatar(
                    radius: 20,
                    child: Icon(Icons.person, color: Colors.white),
                    backgroundColor: Colors.green,
                  ),
                  const SizedBox(width: 12),
                  const Text(
                    'Good morning 👋',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),
                  const Spacer(),
                  Container(
                    width: 48,
                    height: 48,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(24),
                      color: const Color(0xffF1F3F3),
                    ),
                    child: const Icon(
                      Icons.notifications_outlined,
                      size: 30,
                      color: Color(0xff7E8491),
                    ),
                  ),
                ],
              ),
            ),

            /// هنا صفحة المهام
            TaskPage(tasks: tasks),
          ],
        ),
      ),

      // زرار إضافة التاسك
      floatingActionButton: CustomFAB(
        onPressed: () {
          showModalBottomSheet(
            context: context,
            isScrollControlled: true,
            backgroundColor: Colors.white,
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.vertical(top: Radius.circular(25)),
            ),
            builder: (context) {
              return AddTaskBottomSheet(
                onTaskAdded: addTask,
              );
            },
          );
        },
      ),
    );
  }
}

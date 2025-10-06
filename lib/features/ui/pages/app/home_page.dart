import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:todo_app/features/ui/widget/task_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Gap(40),
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
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
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
            const TaskPage(),
          ],
        ),
      ),
    );
  }
}

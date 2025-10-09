import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:todo_app/core/utils/app_router.dart';
import 'package:todo_app/features/ui/widget/selector_statics.dart';

class StatisticsPage extends StatefulWidget {
  const StatisticsPage({super.key});

  @override
  State<StatisticsPage> createState() => _StatisticsPageState();
}

class _StatisticsPageState extends State<StatisticsPage> {
  String selectedFilter = "Week"; // الافتراضي
  double progress = 0.9; // نسبة الانجاز الافتراضية
  int completedTasks = 418;
  int totalTasks = 496;

  // بيانات كل اختيار
  final Map<String, Map<String, dynamic>> stats = {
    "Week": {"progress": 0.10, "completed": 418, "total": 496},
    "Month": {"progress": 0.6, "completed": 1230, "total": 2050},
    "Year": {"progress": 0.9, "completed": 14500, "total": 16100},
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: IconButton(
          onPressed: () {
            context.go(AppRouter.kHomePage);
          },
          icon: Icon(Icons.arrow_back_ios, size: 25, color: Colors.black),
        ),

        title: Text(
          "Statistics",
          style: TextStyle(
            color: Colors.black,
            fontSize: 25,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SelectorStatics(),
            SizedBox(height: 20),
            Row(
              children: [
                Text(
                  "Tasks completed",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Icon(Icons.arrow_right_alt, color: Colors.black, size: 30),
                Text(
                  "418",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                Text(
                  "/496",
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                Spacer(),
              ],
            ),

            SizedBox(height: 10),

            Row(
              children: [
                Text(
                  "Completion rate",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Icon(Icons.arrow_right_alt, color: Colors.black, size: 30),
                Text(
                  "80",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                Text(
                  "%",
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                SizedBox(height: 30),

                // --- Simple Progress Bar ---
                // ✅ Progress Bar with fixed width
              ],
            ),

            SizedBox(height: 20),
            Container(
              width: MediaQuery.of(
                context,
              ).size.width, // العرض بيساوي عرض الشاشة
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: LinearProgressIndicator(
                  value: progress, // مثلا 0.84
                  minHeight: 20,
                  backgroundColor: Colors.grey.shade300,
                  color: Colors.greenAccent,
                ),
              ),
            ),

            SizedBox(height: 10),

            Center(
              child: Text(
                "${(progress * 100).toStringAsFixed(0)}% completed",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';

class StatisticsPage extends StatefulWidget {
  const StatisticsPage({super.key});

  @override
  State<StatisticsPage> createState() => _StatisticsPageState();
}

class _StatisticsPageState extends State<StatisticsPage> {
  String selectedFilter = "Week"; // الافتراضي
  double progress = 0.8; // نسبة الانجاز الافتراضية
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
        title: const Text("Statistics")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // ✅ الفلاتر (Week / Month / Year)
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: stats.keys.map((key) {
                bool isSelected = selectedFilter == key;
                return GestureDetector(
                  onTap: () {
                    setState(() {
                      selectedFilter = key;
                      progress = stats[key]!["progress"];
                      completedTasks = stats[key]!["completed"];
                      totalTasks = stats[key]!["total"];
                    });
                  },
                  child: Card(
                    color: isSelected ? Colors.green : Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    elevation: 4,
                    child: SizedBox(
                      height: 60,
                      width: 80,
                      child: Center(
                        child: Text(
                          key,
                          style: TextStyle(
                            color: isSelected ? Colors.white : Colors.black,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ),
                );
              }).toList(),
            ),

            const SizedBox(height: 30),

            // ✅ الاحصائيات
            Row(
              children: [
                const Text("Tasks completed",
                    style:
                        TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                const Icon(Icons.arrow_right_alt, size: 30),
                Text(
                  "$completedTasks",
                  style: const TextStyle(
                      fontSize: 20, fontWeight: FontWeight.bold),
                ),
                Text(
                  "/$totalTasks",
                  style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.grey),
                ),
              ],
            ),

            const SizedBox(height: 10),

            Row(
              children: [
                const Text("Completion rate",
                    style:
                        TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                const Icon(Icons.arrow_right_alt, size: 30),
                Text(
                  "${(progress * 100).toInt()}%",
                  style: const TextStyle(
                      fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ],
            ),

            const SizedBox(height: 15),

            // ✅ شريط التقدم
            ClipRRect(
              borderRadius: BorderRadius.circular(15),
              child: LinearProgressIndicator(
                value: progress,
                minHeight: 15,
                color: Colors.green,
                backgroundColor: Colors.grey.shade300,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

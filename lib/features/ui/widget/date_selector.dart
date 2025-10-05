import 'package:flutter/material.dart';

class DateSelector extends StatefulWidget {
  const DateSelector({super.key});

  @override
  State<DateSelector> createState() => _DateSelectorState();
}

class _DateSelectorState extends State<DateSelector> {
  int selectedIndex = 2; // اليوم اللي متحدد (مثلاً يوم الأربعاء)

  final List<Map<String, String>> days = [
    {"day": "Mon", "date": "10"},
    {"day": "Tue", "date": "11"},
    {"day": "Wed", "date": "12"},
    {"day": "Thu", "date": "13"},
    {"day": "Fri", "date": "14"},
    {"day": "Sat", "date": "15"},
    {"day": "Sun", "date": "16"},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F5F5),
      body: Center(
        child: Container(
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            color: Colors.teal.shade200,
            borderRadius: BorderRadius.circular(25),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: List.generate(days.length, (index) {
              bool isSelected = selectedIndex == index;
              return GestureDetector(
                onTap: () {
                  setState(() {
                    selectedIndex = index;
                  });
                },
                child: AnimatedContainer(
                  duration: const Duration(milliseconds: 300),
                  width: 45,
                  height: 60,
                  decoration: BoxDecoration(
                    color: isSelected ? Colors.teal : Colors.white,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        days[index]["date"]!,
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: isSelected ? Colors.white : Colors.black,
                        ),
                      ),
                      const SizedBox(height: 5),
                      Text(
                        days[index]["day"]!,
                        style: TextStyle(
                          fontSize: 12,
                          color: isSelected ? Colors.white70 : Colors.black54,
                        ),
                      ),
                    ],
                  ),
                ),
              );
            }),
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class CustomBottomNavigation extends StatelessWidget {
  const CustomBottomNavigation({
    super.key,
    this.onPressed,
    this.onPressed2,
    required this.currentIndex,
  });

  final void Function()? onPressed;
  final void Function()? onPressed2;
  final int currentIndex;

  @override
  Widget build(BuildContext context) {
    // النصوص اللي هتتغير حسب الصفحة
    final List<String> titles = [
      "Create task reminders",
      "Keep track of tasks",
      "Create profile to get started",
    ];

    return Column(
      children: [
        /// النص العلوي المتغير
        Text(
          titles[currentIndex],
          textAlign: TextAlign.center,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.w500,
          ),
        ),
        Gap(100),

        /// أزرار التنقل + المؤشرات
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            /// زر Skip / Back
            TextButton(
              onPressed: onPressed,
              child: const Text(
                "Skip",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),

            /// النقاط
            Row(
              children: List.generate(
                3,
                (index) => Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 3),
                  child: Container(
                    height: 10,
                    width: 10,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(75),
                      color: index == currentIndex ? Colors.grey : Colors.white,
                    ),
                  ),
                ),
              ),
            ),

            /// زر Next
            TextButton(
              onPressed: onPressed2,
              child: Text(
                currentIndex == 2 ? "Get Started" : "Next",
                style: const TextStyle(
                  color: Colors.black,
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}

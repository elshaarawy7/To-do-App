import 'package:flutter/material.dart';

class CustomFAB extends StatelessWidget {
  final VoidCallback onPressed;

  const CustomFAB({super.key, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 70,
      width: 70,
      child: FloatingActionButton(
        onPressed: onPressed,
        backgroundColor: const Color(0xff00A86B),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20), // مربع بحواف ناعمة
        ),
        child: const Icon(Icons.add, size: 30, color: Colors.white),
      ),
    );
  }
}

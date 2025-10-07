import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:todo_app/core/utils/app_router.dart';
import 'package:todo_app/features/ui/widget/selector_statics.dart';

class StaticPage extends StatelessWidget {
  const StaticPage({super.key});

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
        padding: EdgeInsets.symmetric(horizontal: 12),
        child: Column(
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

                Spacer(),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

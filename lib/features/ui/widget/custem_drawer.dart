import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:todo_app/core/utils/app_router.dart';

class CustemDrawer extends StatelessWidget {
  const CustemDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Colors.green,
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Gap(80),
            GestureDetector(
              onTap: () {
                context.go(AppRouter.staticPage);
              },
              child: Row(
                children: [
                  Gap(20),

                  Icon(Icons.bar_chart, size: 30, color: Colors.white),

                  Text(
                    ": statistics",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
            Gap(20),

            GestureDetector(
              onTap: () {
                context.go(AppRouter.kSettingsPage);
              },
              child: Row(
                children: [
                  Gap(20),

                  Icon(Icons.settings, size: 30, color: Colors.white),

                  Text(
                    ": settings",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

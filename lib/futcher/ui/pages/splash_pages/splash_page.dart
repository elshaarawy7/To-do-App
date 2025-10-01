import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:todo_app/core/utils/app_router.dart';
import 'package:todo_app/core/utils/color_app.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorApp.primary,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          children: [
            SizedBox(height: 200),
            Padding(
              padding: const EdgeInsets.only(left: 50),
              child: Align(
                alignment: Alignment.bottomLeft,
                child: SizedBox(
                  height: 25,
                  width: 25,
                  child: Positioned(
                    top: 0,
                    bottom: 0,
                    right: 80,
                    child: CircleAvatar(backgroundColor: Colors.white),
                  ),
                ),
              ),
            ),
            Gap(30),
            Align(
              alignment: Alignment.center,
              child: Image.asset("assets/splash/Group 33624.png"),
            ),
            Spacer(),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.white,
                padding: EdgeInsets.symmetric(horizontal: 120, vertical: 15),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadiusGeometry.circular(16),
                ),
              ),
              onPressed: () {
                context.go(AppRouter.kOnBoardingPage);
              },
              child: Text(
                "Get Started",
                style: TextStyle(
                  color: ColorApp.primary,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Gap(70),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:todo_app/core/utils/app_router.dart';
import 'package:todo_app/core/utils/color_app.dart';
import 'package:todo_app/futcher/ui/widget/custom_bottom_navigation.dart';

class SplashOage4 extends StatelessWidget {
  const SplashOage4({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
               SizedBox(height: 150),
            Image.asset('assets/splash/Rectangle 4239 (2).png'),

            SizedBox(height: 100),

            Expanded(
              child: Container(
                width: double.infinity, 
                decoration: BoxDecoration(
                  color: ColorApp.green,
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(16),
                    topRight: Radius.circular(16),
                  ),
                ), 

              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16 , vertical: 45),
                child: CustomBottomNavigation(
                  onPressed: () {
                    context.go(AppRouter.KSplashPage3) ;
                  },  
                  onPressed2: () {
                    context.go(AppRouter.KSingInPage) ;
                  },
                  currentIndex: 2,
                ) , 
              ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
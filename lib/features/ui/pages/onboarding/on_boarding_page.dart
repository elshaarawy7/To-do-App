import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:todo_app/core/utils/app_router.dart';
import 'package:todo_app/core/utils/color_app.dart';
import 'package:todo_app/features/ui/widget/custom_bottom_navigation.dart';

class OnBoardingPage extends StatefulWidget {
  const OnBoardingPage({super.key});

  @override
  State<OnBoardingPage> createState() => _OnBoardingPageState();
}

class _OnBoardingPageState extends State<OnBoardingPage> {
  final PageController _pageController = PageController();
  int _currentIndex = 0;

  final List<String> images = [
    "assets/splash/Rectangle 4239.png",
    "assets/splash/Rectangle 4239 (1).png",
    "assets/splash/Rectangle 4239 (2).png",
  ];

  void _nextPage() {
    if (_currentIndex < images.length - 1) {
      _pageController.nextPage(
        duration: const Duration(milliseconds: 400),
        curve: Curves.easeInOut,
      );
    } else {
      context.go(AppRouter.kSingInPage); // آخر صفحة -> SignIn
    }
  }

 void _prevPage() {
  context.go(AppRouter.kSingInPage); 
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Gap(100),

          /// PageView للصور فقط
          Expanded(
            flex: 3,
            child: PageView.builder(
              controller: _pageController,
              itemCount: images.length,
              onPageChanged: (index) {
                setState(() {
                  _currentIndex = index;
                });
              },
              itemBuilder: (context, index) {
                return Center(child: Image.asset(images[index], height: 250));
              },
            ),
          ),

          Gap(30),

          /// Bottom Navigation
          Expanded(
            flex: 2,
            child: Container(
              width: double.infinity,
              decoration: BoxDecoration(
                color: ColorApp.primary,
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(48),
                  topRight: Radius.circular(48),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 45,
                ),
                child: CustomBottomNavigation(
                  onPressed: _prevPage,
                  onPressed2: _nextPage,
                  currentIndex: _currentIndex,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

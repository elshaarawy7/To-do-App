import 'package:go_router/go_router.dart';
import 'package:todo_app/features/ui/pages/app/home_page.dart';
import 'package:todo_app/features/ui/pages/app/settings_page.dart';
import 'package:todo_app/features/ui/pages/app/static_page.dart';
import 'package:todo_app/features/ui/pages/auth/sing_in.dart';
import 'package:todo_app/features/ui/pages/auth/sing_up.dart';
import 'package:todo_app/features/ui/pages/onboarding/on_boarding_page.dart';
import 'package:todo_app/features/ui/pages/splash_pages/splash_page.dart';

class AppRouter {
  static final String kSplashPage = '/';
  static final String kOnBoardingPage = '/on_boarding_page';
  static final String kSingInPage = '/sing_in_page';
  static final String kSingUP = '/sing_up';
  static final String kHomePage = '/home_page';
  static final String staticPage = '/static_page';
  static final String kSettingsPage = '/settings_page';

  static final GoRouter router = GoRouter(
    routes: [
      GoRoute(path: kSplashPage, builder: (context, state) => SplashPage()),

      GoRoute(
        path: kOnBoardingPage,
        builder: (context, state) => OnBoardingPage(),
      ),

      GoRoute(path: kSingInPage, builder: (context, state) => SingIn()),

      GoRoute(path: kSingUP, builder: (context, state) => SingUp()),
      GoRoute(path: kHomePage, builder: (context, state) => HomePage()),
      GoRoute(path: staticPage, builder: (context, state) => StaticPage()),
      GoRoute(path: kSettingsPage, builder: (context, state) => SettingsPage()),
    ],
  );
}

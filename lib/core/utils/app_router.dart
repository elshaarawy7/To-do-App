import 'package:go_router/go_router.dart';
import 'package:todo_app/futcher/ui/pages/auth/sing_in.dart';
import 'package:todo_app/futcher/ui/pages/auth/sing_up.dart';
import 'package:todo_app/futcher/ui/pages/splash_pages/on_boarding_page.dart';
import 'package:todo_app/futcher/ui/pages/splash_pages/splash_page.dart';

class AppRouter {
  static final String kSplashPage = '/';
  static final String kOnBoardingPage = '/on_boarding_page';
  static final String kSingInPage = '/sing_in_page';
  static final String kSingUP = '/sing_up';

  static final GoRouter router = GoRouter(
    routes: [
      GoRoute(path: kSplashPage, builder: (context, state) => SplashPage()),

      GoRoute(path: kOnBoardingPage, builder: (context, state) => OnBoardingPage()),

      GoRoute(path: kSingInPage, builder: (context, state) => SingIn()),

      GoRoute(path: kSingUP, builder: (context, state) => SingUp()),
    ],
  );
}

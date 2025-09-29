import 'package:go_router/go_router.dart';
import 'package:todo_app/futcher/ui/pages/splash_pages/splash_page_1.dart';
import 'package:todo_app/futcher/ui/pages/splash_pages/splash_page_2.dart';
import 'package:todo_app/futcher/ui/pages/splash_pages/splash_page_3.dart';

class AppRouter { 
 
 static final String KsplashPage1 = '/' ;
 static final String KsplahPage2 = '/splash_page_2' ;
 static final String KSplashPage3 = '/splash_page_3' ;

 static final GoRouter router = GoRouter(
  routes: [

    GoRoute(
      path: KsplashPage1 , 
      builder: (context, state) => SplashPage1(),
    ) , 

    GoRoute(
      path: KsplahPage2 , 
      builder: (context, state) => SplashPage2(),
    ) ,  

    GoRoute(
      path: KSplashPage3 , 
      builder: (context, state) => SplashPage3(),
    )

  ]
 );

}
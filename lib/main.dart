import 'package:flutter/material.dart';
import 'package:todo_app/futcher/ui/pages/splash_pages/splash_page_1.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp( 
      debugShowCheckedModeBanner: false, 
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.white
      ),
      home: SplashPage1(),
    ) ;
  }
}

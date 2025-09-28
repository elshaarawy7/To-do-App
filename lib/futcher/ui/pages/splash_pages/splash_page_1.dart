import 'package:flutter/material.dart';
import 'package:todo_app/core/utils/color_app.dart';

class SplashPage1 extends StatelessWidget {
  const SplashPage1({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorApp.green,

      body: Column(
        children: [
          SizedBox(height: 200,) , 

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

          SizedBox(height: 30,) , 

          Container(
            height: 30, 
            width: 100, 
          decoration: BoxDecoration(
          color: Colors.amber , 
          borderRadius: BorderRadius.circular(75) , 
          ), 
          child: Row( 
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircleAvatar(
                backgroundColor: Color(0xffFFF8A00), 
                radius: 5, 
              ) , 

              SizedBox(width: 10,) , 

              Text("Add Task" , style: TextStyle(
                color: Colors.white , 
                fontSize: 16 , 
                fontWeight: FontWeight.bold , 
              ),) , 
            ],
          ),
          ) ,  

          Container( 
            height: 120, 
            width: 1,
            color: Colors.white, 
          ) ,
 

          Align(
            alignment: Alignment.center,
            child: Image.asset("assets/splash/Group 33624.png"),
          ),
        ],
      ),
    );
  }
}

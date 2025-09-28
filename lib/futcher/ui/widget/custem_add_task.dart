import 'package:flutter/material.dart';

class CustemAddTask extends StatelessWidget {
  const CustemAddTask({super.key, required this.circal});  

  final Color  circal  ; 


  @override
  Widget build(BuildContext context) {
    return Container(
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
          );
  }
}
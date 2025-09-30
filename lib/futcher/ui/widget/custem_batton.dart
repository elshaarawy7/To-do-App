import 'package:flutter/material.dart';
import 'package:todo_app/core/utils/color_app.dart';

class CustemBatton extends StatelessWidget {
  const CustemBatton({super.key});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
       style: ElevatedButton.styleFrom(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadiusGeometry.circular(15) , 
        ),
       backgroundColor: ColorApp.green , 
       padding: EdgeInsets.symmetric(
        horizontal: 40 , 
        vertical: 20 , 
        )
        ),
      onPressed: () {
        
      },
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
      
          Text("Sign up" , style: TextStyle(
            color: Colors.white , 
            fontSize: 20 , 
            fontWeight: FontWeight.bold , 
          ),) ,  

         SizedBox(width: 75,) ,
      
          Container(
            height: 25, 
            width: 25, 
            decoration: BoxDecoration(
              color: Colors.amber , 
              borderRadius: BorderRadius.circular(75) , 
      
            ), 
            child: Icon(Icons.arrow_back , size: 15,
            color: Colors.white,
            ),
          )
        ],
      ),
    ) ; 
  }
}
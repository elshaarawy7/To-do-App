import 'package:flutter/material.dart';
import 'package:todo_app/core/utils/color_app.dart';

class CustemBatton extends StatelessWidget {
  const CustemBatton({super.key});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
       style: ElevatedButton.styleFrom(
       backgroundColor: ColorApp.green , 
       padding: EdgeInsets.symmetric(
        horizontal: double.infinity , 
        vertical: 50 , 
        )
        ),
      onPressed: () {
        
      },
      child: Row(
        children: [],
      ),
    ) ; 
  }
}
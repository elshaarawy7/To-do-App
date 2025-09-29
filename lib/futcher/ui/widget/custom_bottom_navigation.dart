import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';
import 'package:todo_app/core/utils/app_router.dart';

class CustomBottomNavigation extends StatelessWidget {
  const CustomBottomNavigation({super.key, this.onPressed, required this.currentIndex}); 
  final  void Function()? onPressed ; 

  final int currentIndex; 

  @override
  Widget build(BuildContext context) {
    return Column(
                 
                  children: [
                    Text("Create task reminders" , style: TextStyle(
                      color: Colors.white , 
                      fontSize: 20 , 
                      fontWeight: FontWeight.w500 , 
                    ),) , 

                    SizedBox(height: 100,) ,

                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween, 
                      children: [
                        TextButton(
                        onPressed: onPressed ,  
                        child: Text("Skip" , style: TextStyle(
                          color: Colors.white , 
                          fontSize: 16 , 
                          fontWeight: FontWeight.w400 , 
                        ),),
                        )  ,  

                        Row(
                          children: List.generate(
                             3 , (index) => Padding(
                               padding: const EdgeInsets.symmetric(horizontal: 3),
                               child: Container(
                                height: 10, 
                                width: 10, 
                                decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(75) , 
                                color: index == currentIndex ? Colors.grey : Colors.white , 
                               
                                ),
                               ),
                             ) , 
                          ),
                        ) ,  

                        TextButton(onPressed:  onPressed ,
                        child: Text("Next" , style: TextStyle(
                          color: Colors.black , 
                          fontSize: 16 , 
                          fontWeight: FontWeight.w400 , 
                        ),),
                        )  ,

                      ],
                    )
                    
                  ],
                );

  }
}
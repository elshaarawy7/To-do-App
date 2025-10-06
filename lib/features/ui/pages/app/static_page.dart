import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:todo_app/core/utils/app_router.dart';

class StaticPage extends StatelessWidget {
  const StaticPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: IconButton(
          onPressed: () {
            context.go(AppRouter.kHomePage) ;
          },
          icon: Icon(Icons.arrow_back_ios, size: 25, color: Colors.black),
        ), 

        title: Text("Statistics" , style: TextStyle(
          color: Colors.black , 
          fontSize: 25 , 
          fontWeight: FontWeight.bold , 
        ),),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 12),
        child: Column(
          children: [
            Row(
              children: [
                SizedBox(
                  height: 70, 
                  width: 80,
                  child: Card(
                    elevation: 4, 
                    color: Colors.white, 
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15) ,
                    ),
                    
                    child: Center(child: Text("week")),
                  ),
                )
              ],
            ) , 
          ],
        ),
      ),
    );
  }
}

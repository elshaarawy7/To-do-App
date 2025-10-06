import 'package:flutter/material.dart';

class CustemDrawer extends StatelessWidget {
  const CustemDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
        backgroundColor: Colors.green,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
             Row(
               children: [
                 IconButton(
                  onPressed: () {
                    
                  }, 
                  icon: Icon(Icons.bar_chart , size: 30,color: Colors.white,),
                 ), 

                 Text(": statistics" , style: TextStyle(
                  color: Colors.white , fontSize: 20 , 
                  fontWeight: FontWeight.bold
                 ),) , 
               ],
             ) ,  

               Row(
               children: [
                 IconButton(
                  onPressed: () {
                    
                  }, 
                  icon: Icon(Icons.settings , size: 30,color: Colors.white,),
                 ), 

                 Text(": settings" , style: TextStyle(
                  color: Colors.white , fontSize: 20 , 
                  fontWeight: FontWeight.bold
                 ),) , 
               ],
             ) ,
            ],
          ),
        ),
      );
  }
}
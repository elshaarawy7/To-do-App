import 'package:flutter/material.dart';

class SingIn extends StatelessWidget {
  const SingIn({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(height: 200,) , 

            Text("Sing in" , style: TextStyle(
              color: Colors.black , 
              fontSize: 25 , 
              fontWeight: FontWeight.bold 
            ),) , 

            //  email and passowrd , 

            
          ],
        ),
      ),
    ) ; 
  }
}
import 'package:flutter/material.dart';
import 'package:todo_app/futcher/ui/widget/custem_text_filed.dart';

class SingIn extends StatelessWidget {
  const SingIn({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 200,) , 

            Text("Sing in" , style: TextStyle(
              color: Colors.black , 
              fontSize: 25 , 
              fontWeight: FontWeight.bold 
            ),) , 

            SizedBox(height: 10,) , 

            //  email and passowrd , 
            CustemTextFiled( 
              hintText: "enter ypur email", 
              icon:Icons.email_outlined , 
              validator: (value) {
                if(value == null || value.isEmpty){
                  return "please enter ypur email " ;
                }
              },
            ) , 

            SizedBox(height: 20,) ,  

              CustemTextFiled( 
              hintText: "enter ypur password", 
              icon:Icons.lock, 
              validator: (value) {
                if(value == null || value.isEmpty || value.length > 6){
                  return "please enter ypur password" ;
                } 

              },
            ) , 

            SizedBox(height: 20,) , 

            // forget passowrd and remmber me 

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween, 
              children: [
                Text("remmber me " , style: TextStyle(
                  color: Colors.black , 
                  fontSize: 16 , 
                  fontWeight: FontWeight.w500 , 
                ),) ,  

                 Text("forget passowrd " , style: TextStyle(
                  color: Colors.green , 
                  fontSize: 16 , 
                  fontWeight: FontWeight.w500 , 
                ),) ,  

                // batton 

                
              ],
            )
            

          ],
        ),
      ),
    ) ; 
  }
}
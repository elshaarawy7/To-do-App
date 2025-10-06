import 'package:flutter/material.dart';

class SelectorStatics extends StatelessWidget {
  const SelectorStatics({super.key});

  @override
  Widget build(BuildContext context) {
    return   Row(
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
                ) , 
              ],
            );
  }
}
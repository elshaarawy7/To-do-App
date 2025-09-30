import 'package:flutter/material.dart';

class CustemScoilAuth extends StatelessWidget {
  const CustemScoilAuth({
    super.key,
    
    required this.text, required this.image,
  });

  final String image;
  final String text;


  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset(image, height: 50, width: 50),

        Text(
          text,
          style: TextStyle(
            color: Colors.black,
            fontSize: 15,
            fontWeight: FontWeight.w500,
          ),
        ), 

      ],
    );
  }
}

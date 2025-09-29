import 'package:flutter/material.dart';

class CustemTextFiled extends StatelessWidget {
  const CustemTextFiled({super.key});
  final bool obscureText = false ;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: obscureText,
    );
  }
}
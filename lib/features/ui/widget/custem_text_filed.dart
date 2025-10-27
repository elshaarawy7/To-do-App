import 'package:flutter/material.dart';

class CustemTextFiled extends StatelessWidget {
  const CustemTextFiled({
    super.key,
    required this.icon,
    required this.hintText,
    this.validator, 
  });
  final bool obscureText = false;
  final IconData icon;
  final String hintText;
  final String? Function(String?)? validator;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: validator,
      obscureText: obscureText,
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: TextStyle(color: Colors.grey, fontSize: 16),
        prefixIcon: Icon(icon),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: BorderSide(color: Colors.grey, width: 1),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: BorderSide(color: Colors.grey, width: 1),
        ),
      ),
    );
  }
}

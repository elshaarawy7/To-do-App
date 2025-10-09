import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SettingItem extends StatelessWidget {
  const SettingItem({super.key, required this.image, required this.text, required this.colorText});
  final String image;
  final String text;
  final Color colorText;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: SvgPicture.asset(image),
      title: Text(
        text,
        style: TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.w500,
          color:colorText,
        ),
      ),
    );
  }
}

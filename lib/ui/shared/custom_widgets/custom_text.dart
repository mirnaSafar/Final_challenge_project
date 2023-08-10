import 'package:flutter/material.dart';
import '../colors.dart';

class CustomText extends StatelessWidget {
  const CustomText({
    super.key,
    this.textColor,
    this.fontSize,
    this.bold = false,
    required this.text,
    this.textAlign,
  });
  final Color? textColor;
  final double? fontSize;
  final bool? bold;
  final String text;
  final TextAlign? textAlign;
  @override
  Widget build(BuildContext context) {
    return Text(
        textAlign: textAlign ?? TextAlign.start,
        text,
        style: TextStyle(
          fontWeight: bold == true ? FontWeight.bold : FontWeight.normal,
          fontSize: fontSize ?? 15,
          color: textColor ?? AppColors.mainPurpleColore,
        ));
  }
}

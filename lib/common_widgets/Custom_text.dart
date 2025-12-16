import 'package:flutter/material.dart';

class CustomText extends StatelessWidget {
  final String text;
  final TextAlign? textAlign;
  final TextStyle? textStyle;
  final Color? color;
  final double? fontSize;
  final FontWeight? fontWeight;
  final String? fontFamily;
  final FontStyle? fontStyle;

  const CustomText({
    super.key,
    required this.text,
    this.textAlign,
    this.textStyle,
    this.color,
    this.fontSize,
    this.fontWeight,
    this.fontFamily,
    this.fontStyle,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: textAlign ?? TextAlign.start,
      style: textStyle?.copyWith(
        color: color,
        fontSize: fontSize,
        fontWeight: fontWeight,
        fontFamily: fontFamily,
        fontStyle: fontStyle,
      ) ??
          TextStyle(
            color: color ?? Colors.white70,
            fontSize: fontSize ?? 14,
            fontWeight: fontWeight ?? FontWeight.normal,
            fontFamily: fontFamily,
            fontStyle: fontStyle,
          ),
    );
  }
}

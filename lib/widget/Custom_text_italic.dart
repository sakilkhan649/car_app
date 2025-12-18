import 'package:flutter/material.dart';

class CustomTextItalic extends StatelessWidget {
  final String text;
  final TextAlign? textAlign;
  final TextStyle? textStyle;
  final Color? color;
  final double? fontSize;
  final FontWeight? fontWeight;
  final String? fontFamily;
  final FontStyle? fontStyle;

  const CustomTextItalic({
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
            color: color ?? Colors.white,
            fontSize: fontSize ?? 26,
            fontWeight: fontWeight ?? FontWeight.w700,
            fontFamily: fontFamily,
            fontStyle: fontStyle??FontStyle.italic,
          ),
    );
  }
}

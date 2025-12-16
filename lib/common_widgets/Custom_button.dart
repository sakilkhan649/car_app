import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter/material.dart';
import '../utils/app_colors/app_colors.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final Color? backgroundColor;
  final Color? textColor;
  final double width;
  final double height;
  final TextStyle? style;
  final EdgeInsetsGeometry? padding;
  final Color? borderColor;

  const CustomButton({
    super.key,
    required this.text,
    required this.onPressed,
    this.backgroundColor,
    this.textColor,
    this.width = double.maxFinite,
    this.height = 48,
    this.style,
    this.padding,
    this.borderColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width.w,
      height: height.h,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: backgroundColor ?? AppColors.yellow100,
          foregroundColor: textColor ?? Colors.black,
          padding: padding,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12.r),
            side: BorderSide(
              color: borderColor ?? Colors.transparent,
              width: 1.5,
            ),
          ),
        ),
        child: Text(
          text,
          style: style ??
              TextStyle(
                color: textColor ?? Colors.black,
                fontSize: 14,
                fontWeight: FontWeight.bold,
              ),
        ),
      ),
    );
  }
}

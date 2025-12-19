import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomBadge extends StatelessWidget {
  final String text;
  final EdgeInsetsGeometry? padding;
  final double? radius;
  final Color? backgroundColor;
  final TextStyle? textStyle;
  final List<BoxShadow>? boxShadow;

  const CustomBadge({
    super.key,
    required this.text,
    this.padding,
    this.radius,
    this.backgroundColor,
    this.textStyle,
    this.boxShadow,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: padding ?? EdgeInsets.symmetric(horizontal: 14.w, vertical: 8.h),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(radius ?? 30.r),
        boxShadow:
            boxShadow ??
            [
              BoxShadow(
                blurRadius: 0,
                offset: const Offset(-1, 0),
                spreadRadius: 0,
                color: Colors.white54,
              ),
              BoxShadow(
                blurRadius: 2,
                offset: const Offset(1, 1),
                spreadRadius: 0,
                color: const Color(0xFF5B5B5B),
              ),
              BoxShadow(
                blurRadius: 0,
                offset: const Offset(2, 2),
                spreadRadius: 0,
                color: const Color(0xFF5B5B5B),
              ),
            ],
      ),
      child: Text(
        text,
        style:
            textStyle ??
            TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w500,
              fontSize: 11.sp,
            ),
      ),
    );
  }
}

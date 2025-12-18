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
                color: Colors.white54,
                blurRadius: 0,
                spreadRadius: 1,
                offset: const Offset(0, 2),
              ),
              BoxShadow(
                color: Colors.black45,
                blurRadius: 1,
                spreadRadius: 1,
                offset: Offset(2, 4),
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

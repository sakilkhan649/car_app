import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../utils/app_colors/app_colors.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;

  // Style
  final Color? backgroundColor;
  final Color? textColor;
  final double width;
  final double height;
  final TextStyle? style;
  final EdgeInsetsGeometry? padding;
  final Color? borderColor;

  // 🔹 Icon support
  final Widget? icon;
  final bool iconRight;
  final double iconSpacing;

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

    // icon params
    this.icon,
    this.iconRight = false,
    this.iconSpacing = 8,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width.w,
      height: height.h,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: backgroundColor ?? AppColors.yellow100,
          foregroundColor: textColor ?? Colors.black,
          padding: padding,
          elevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12.r),
            side: BorderSide(
              color: borderColor ?? Colors.transparent,
              width: 1.5,
            ),
          ),
        ),
        child: _buildContent(),
      ),
    );
  }

  Widget _buildContent() {
    if (icon == null) {
      return Text(
        text,
        style: style ??
            TextStyle(
              color: textColor ?? Colors.black,
              fontSize: 14,
              fontWeight: FontWeight.bold,
            ),
      );
    }

    return Row(
      mainAxisSize: MainAxisSize.min,
      children: iconRight
          ? [
        Text(
          text,
          style: style ??
              TextStyle(
                color: textColor ?? Colors.black,
                fontSize: 14,
                fontWeight: FontWeight.bold,
              ),
        ),
        SizedBox(width: iconSpacing),
        icon!,
      ]
          : [
        icon!,
        SizedBox(width: iconSpacing),
        Text(
          text,
          style: style ??
              TextStyle(
                color: textColor ?? Colors.black,
                fontSize: 14,
                fontWeight: FontWeight.bold,
              ),
        ),
      ],
    );
  }
}

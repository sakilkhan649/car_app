import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomCard extends StatelessWidget {
  final Widget child;
  final EdgeInsetsGeometry? padding;
  final double? radius;
  final List<Color>? gradientColors;
  final List<BoxShadow>? boxShadow;
  final Color? borderColor;

  const CustomCard({
    super.key,
    required this.child,
    this.padding,
    this.radius,
    this.gradientColors,
    this.boxShadow,
    this.borderColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: padding ?? EdgeInsets.all(16.w),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors:
              gradientColors ?? const [Color(0xFF3F3F3F), Color(0xFF2B2B2B)],
        ),
        borderRadius: BorderRadius.circular(radius ?? 18.r),
        border: Border.all(
          color: borderColor ?? Colors.white.withOpacity(0.06),
          width: 1,
        ),
        boxShadow:
            boxShadow ??
            [
              BoxShadow(
                color: Colors.white54,
                blurRadius: 0,
                spreadRadius: 1,
                offset: const Offset(0, 0),
              ),
              BoxShadow(
                color: Colors.black45,
                blurRadius: 1,
                spreadRadius: 1,
                offset: Offset(0, 4),
              ),
            ],
      ),
      child: child,
    );
  }
}

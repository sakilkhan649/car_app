import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomCircleIcon extends StatelessWidget {
  final String iconPath;
  final double size;
  final double padding;
  final List<BoxShadow>? boxShadows;
  final Color? backgroundColor;

  const CustomCircleIcon({
    Key? key,
    required this.iconPath,
    this.size = 48,
    this.padding = 12,
    this.boxShadows,
    this.backgroundColor = Colors.transparent,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(padding.w),
      decoration: BoxDecoration(
        color: backgroundColor,
        shape: BoxShape.circle,
        boxShadow:
            boxShadows ??
            [
              BoxShadow(
                color: Colors.grey,
                blurRadius: 0,
                spreadRadius: 1,
                offset: const Offset(0, 2),
              ),
              BoxShadow(
                color: Colors.black,
                blurRadius: 1,
                spreadRadius: 1,
                offset: Offset(2, 4),
              ),
            ],
      ),
      child: Center(
        child: SvgPicture.asset(iconPath, height: size, width: size),
      ),
    );
  }
}

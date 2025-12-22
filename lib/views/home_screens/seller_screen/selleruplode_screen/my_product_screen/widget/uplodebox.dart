import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../../widget/CustomTexth.dart';


class UploadBox extends StatelessWidget {
  final String iconPath;
  final String highlightText;
  final String normalText;
  final Color iconBgColor;
  final Color iconColor;
  final VoidCallback? onTap;

  const UploadBox({
    Key? key,
    required this.iconPath,
    this.highlightText = 'Click here',
    this.normalText = ' to upload or drop media here',
    this.iconBgColor = const Color(0xFF3D4F3A),
    this.iconColor = const Color(0xFF5BB349),
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 54.w, vertical: 18.h),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12.r),
          border: Border.all(color: Colors.white),
        ),
        child: Column(
          children: [
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(15),
              decoration: BoxDecoration(
                color: iconBgColor,
                shape: BoxShape.circle,
              ),
              child: SvgPicture.asset(
                iconPath,
                height: 40,
                width: 40,
                colorFilter: ColorFilter.mode(iconColor, BlendMode.srcIn),
              ),
            ),
            SizedBox(height: 16.w),
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                CustomTexth(text: highlightText, color: iconColor),
                CustomTexth(text: normalText),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

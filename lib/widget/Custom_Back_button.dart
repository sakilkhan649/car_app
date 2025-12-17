import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../utils/app_icons/app_icons.dart';

class CustomBackButton extends StatelessWidget {
  final Color backgroundColor;
  final List<BoxShadow>? boxShadows;
  final VoidCallback? onTap;

  const CustomBackButton({
    super.key,
    this.backgroundColor = Colors.transparent,
    this.boxShadows,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20),
      child: Row(
        children: [
          Material(
            color: Colors.transparent,
            shape: const CircleBorder(),
            child: InkWell(
              onTap: onTap ?? () => Get.back(),
              customBorder: const CircleBorder(),
              child: Container(
                width: 36.w,
                height: 36.h,
                padding: EdgeInsets.all(5.w),
                decoration: BoxDecoration(
                  color: backgroundColor,
                  shape: BoxShape.circle,
                  boxShadow: boxShadows ??
                      const [
                        BoxShadow(
                          color: Colors.grey,
                          blurRadius: 0,
                          spreadRadius: 1,
                          offset: Offset(0, 2),
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
                  child: SvgPicture.asset(
                    AppIcons.back_icon,
                    height: 23.h,
                    width: 13.w,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
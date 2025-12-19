import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SearchBarWithFilter extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  final String filterIconPath;
  final VoidCallback? onFilterTap;

  const SearchBarWithFilter({
    super.key,
    required this.controller,
    this.hintText = "Search for make, model & products",
    required this.filterIconPath,
    this.onFilterTap,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        // 🔍 Search Field
        Expanded(
          child: Container(
            height: 56.h,
            padding: EdgeInsets.symmetric(horizontal: 12.w),
            decoration: BoxDecoration(
              color: const Color(0xFF373737),
              borderRadius: BorderRadius.circular(16.r),
              border: Border.all(color: const Color(0xFF525252)),
            ),
            child: Row(
              children: [
                const Icon(Icons.search, color: Colors.white, size: 24),
                SizedBox(width: 10.w),
                Expanded(
                  child: TextField(
                    controller: controller,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 14.sp,
                    ),
                    decoration: InputDecoration(
                      hintText: hintText,
                      hintStyle: TextStyle(
                        color: Colors.white70,
                        fontSize: 14.sp,
                      ),
                      border: InputBorder.none,
                      isDense: true,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),

        SizedBox(width: 12.w),

        // 🧰 Filter Icon
        GestureDetector(
          onTap: onFilterTap,
          child: Container(
            height: 56.h,
            width: 56.h,
            padding: EdgeInsets.all(14.w),
            decoration: BoxDecoration(
              color: const Color(0xFF373737),
              borderRadius: BorderRadius.circular(16.r),
              border: Border.all(color: const Color(0xFF525252)),
            ),
            child: SvgPicture.asset(filterIconPath),
          ),
        ),
      ],
    );
  }
}

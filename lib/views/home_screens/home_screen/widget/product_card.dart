import 'dart:ui';

import 'package:car_app/common_widgets/Custom_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'Custom_icon.dart';

class ProductCard extends StatelessWidget {
  final String name;
  final String imageUrl;
  final double price;

  const ProductCard({
    super.key,
    required this.name,
    required this.imageUrl,
    required this.price,
  });

  static const LinearGradient greenGradient = LinearGradient(
    colors: [Color(0xFF5BB349), Color(0xFF5BB349), Color(0xFFB2FFA2)],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 270.h,
      decoration: BoxDecoration(
        color: const Color(0xFF1E1E1E),
        borderRadius: BorderRadius.circular(16.r),
        border: Border.all(color: Colors.white24, width: 1),
      ),
      padding: EdgeInsets.all(12.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          /// Title
          CustomText(text: "CAR CLUTCH", fontSize: 10),
          SizedBox(height: 2.h),

          ShaderMask(
            shaderCallback: (bounds) =>
                ProductCard.greenGradient.createShader(bounds),
            child: Text(
              'New',
              style: TextStyle(
                fontSize: 14.sp,
                fontWeight: FontWeight.bold,
                color: Colors.white, // required, but overridden by ShaderMask
              ),
            ),
          ),

          SizedBox(height: 10.h),

          /// Image
          Center(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20.r),
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 6, sigmaY: 6),
                child: Container(
                  height: 130.h,
                  width: 130.w,
                  decoration: BoxDecoration(
                    color: Colors.black.withOpacity(0.50), // semi-transparent
                    borderRadius: BorderRadius.circular(20.r),
                    border: Border.all(color: Colors.black.withOpacity(0.50)),
                  ),
                  padding: EdgeInsets.all(8.w),
                  child: Image.asset(imageUrl, fit: BoxFit.contain),
                ),
              ),
            ),
          ),

          SizedBox(height: 12.h),
          CustomText(text: "PRICE", fontSize: 10),

          SizedBox(height: 4.h),

          /// Price + Button
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              ShaderMask(
                shaderCallback: (bounds) =>
                    ProductCard.greenGradient.createShader(bounds),
                child: Text(
                  '\$${price.toStringAsFixed(2)}',
                  style: TextStyle(
                    fontSize: 14.sp,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
              const ArrowIconButton(), // 👈 use this
            ],
          ),
        ],
      ),
    );
  }
}

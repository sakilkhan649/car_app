import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:car_app/common_widgets/Custom_text.dart';
import 'ItemIcon.dart';

class ItemCard extends StatelessWidget {
  final String name;
  final String imageUrl;
  final double price;
  final String status;

  const ItemCard({
    super.key,
    required this.name,
    required this.imageUrl,
    required this.price,
    required this.status,
  });

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
          CustomText(text: name.toUpperCase(), fontSize: 10),
          SizedBox(height: 2.h),

          /// Status Label
          ShaderMask(
            shaderCallback: (bounds) =>
                getGradientForStatus().createShader(bounds),
            child: Text(
              status,
              style: TextStyle(
                fontSize: 14.sp,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ),

          SizedBox(height: 10.h),

          /// Product Image
          Center(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20.r),
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 6, sigmaY: 6),
                child: Container(
                  height: 130.h,
                  width: 130.w,
                  decoration: BoxDecoration(
                    color: Colors.black.withOpacity(0.50),
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

          /// Price + Icon
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              ShaderMask(
                shaderCallback: (bounds) =>
                    Itemicon.greenGradient.createShader(bounds),
                child: Text(
                  '\$${price.toStringAsFixed(2)}',
                  style: TextStyle(
                    fontSize: 14.sp,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
              Itemicon(),
            ],
          ),
        ],
      ),
    );
  }

  /// Dynamic color for status
  LinearGradient getGradientForStatus() {
    switch (status.toLowerCase()) {
      case 'new':
        return const LinearGradient(
          colors: [Color(0xFFFF0000), Color(0xFFFF0000),Color(0xFFFFB5B5)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        );
      case 'used':
        return const LinearGradient(
          colors: [Color(0xFFE7BE00), Color(0xFFE7BE00),Color(0xFFFFEFA6)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        );
      default:
        return const LinearGradient(
          colors: [Colors.grey, Colors.white30],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        );
    }
  }
}

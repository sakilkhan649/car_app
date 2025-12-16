import 'package:car_app/utils/app_colors/app_colors.dart';
import 'package:car_app/utils/app_images/app_images.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'controller/splash_controller.dart';

class SplashScreen extends StatelessWidget {
  SplashScreen({super.key});

  final controller = Get.put(SplashController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Yellow background for step 3
          Obx(() {
            return Container(
              color: controller.step.value == 3
                  ? const Color(0xFFE7BE00)
                  : AppColors.black100, // optional default bg
            );
          }),

          // Centered Logo (fixed)
          Center(
            child: Container(
              height: 238.h,
              width: 238.w,
              decoration: const BoxDecoration(shape: BoxShape.circle),
              child: Image.asset(AppImages.app_logo),
            ),
          ),

          // Progress or Dot (bottom overlay)
          // Progress or Dot (25px niche)
          Obx(() {
            if (controller.step.value == 1) {
              return Positioned(
                bottom:
                    MediaQuery.of(context).size.height / 2 - 238.h / 2 - 25.h,
                left: 20.w,
                right: 20.w,
                child: TweenAnimationBuilder<double>(
                  tween: Tween(begin: 0, end: 1),
                  duration: const Duration(seconds: 2),
                  builder: (_, value, __) {
                    return Container(
                      height: 16,
                      decoration: BoxDecoration(
                        color: Colors.grey.shade800,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: FractionallySizedBox(
                        alignment: Alignment.centerLeft,
                        widthFactor: value,
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            gradient: const LinearGradient(
                              begin: Alignment.centerLeft,
                              end: Alignment.centerRight,
                              colors: [Color(0xFFE7BE00), Color(0xFF5BB349)],
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                ),
              );
            } else if (controller.step.value == 2) {
              return Positioned(
                bottom:
                    MediaQuery.of(context).size.height / 2 - 238.h / 2 - 25.h,
                left: 0,
                right: 0,
                child: const Center(
                  child: CircleAvatar(
                    radius: 10,
                    backgroundColor: Color(0xFFE7BE00),
                  ),
                ),
              );
            } else {
              return const SizedBox.shrink();
            }
          }),
        ],
      ),
    );
  }
}

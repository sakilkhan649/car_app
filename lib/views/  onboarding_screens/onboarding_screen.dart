import 'package:car_app/views/%20%20onboarding_screens/widgets/Custom_circular_button.dart';
import 'package:car_app/views/%20%20onboarding_screens/widgets/custom_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'controller/onboarding_controller.dart';

class OnboardingScreen extends StatelessWidget {
  OnboardingScreen({super.key});

  final controller = Get.put(OnboardingController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.white.withOpacity(0.25),
        elevation: 0,
        toolbarHeight: 0,
        systemOverlayStyle: SystemUiOverlayStyle.light,
      ),
      body: PageView.builder(
        controller: controller.pageController,
        onPageChanged: controller.onPageChanged,
        itemCount: controller.pages.length,
        itemBuilder: (context, index) {
          final page = controller.pages[index];
          return Stack(
            children: [
              // 🔹 Background Image
              Stack(
                children: [
                  // 🔹 Image
                  Positioned(
                    top: 0,
                    left: 0,
                    right: 0,
                    child: Image.asset(
                      page.image,
                      height: 600,
                      width: double.infinity,
                      fit: BoxFit.cover,
                    ),
                  ),

                  // 🔹 Bottom Gradient Overlay
                  Positioned(
                    top: 0,
                    left: 0,
                    right: 0,
                    height: 600,
                    child: Container(
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [
                            Colors.transparent,
                            Colors.black.withOpacity(0.4),
                            Colors.black.withOpacity(0.8),
                          ],
                          stops: const [0.5, 0.75, 1.0],
                        ),
                      ),
                    ),
                  ),
                ],
              ),

              // 🔹 Content
              Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _indicator(index),
                    const SizedBox(height: 12),

                    Text(
                      page.title,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 26,
                        fontWeight: FontWeight.bold,
                        fontStyle: FontStyle.italic,
                      ),
                    ),

                    const SizedBox(height: 10),

                    Text(
                      page.subtitle,
                      style: TextStyle(
                        color: Colors.white.withOpacity(0.7),
                        fontSize: 14,
                      ),
                    ),

                    const SizedBox(height: 30),

                    _buttons(index),
                    const SizedBox(height: 20),
                  ],
                ),
              ),
            ],
          );
        },
      ),
    );
  }

  Widget _indicator(int index) {
    return Obx(() {
      return StepButton(
          current: controller.currentIndex.value + 1,
          total: controller.pages.length,
        );

    });
  }

  Widget _buttons(int index) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        if (index != 0)
          DoubleBorderCircleButton(
            onTap: () {
              controller.pageController.previousPage(
                duration: const Duration(milliseconds: 300),
                curve: Curves.easeInOut,
              );
            },
          )
        else
          const SizedBox(width: 60),

        SizedBox(
          width: 130,
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.yellow,
              foregroundColor: Colors.black,
              shape: const StadiumBorder(),
              padding: const EdgeInsets.symmetric(horizontal: 28, vertical: 14),
            ),
            onPressed: controller.nextPage,
            child: Text(index == 2 ? 'Get Started' : 'Next'),
          ),
        ),
      ],
    );
  }
}

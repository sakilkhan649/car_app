import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../core/routs/routs.dart';
import '../../../utils/app_images/app_images.dart';
import '../model/onboarding_model.dart';

class OnboardingController extends GetxController {
  PageController pageController = PageController();
  RxInt currentIndex = 0.obs;

  final List<OnboardingModel> pages = [
    OnboardingModel(
      image: AppImages.past_image,
      title: 'Illuminate Your Drive with\nUnmatched Precision',
      subtitle: 'Precision lighting that guides every journey\nwith clarity.',
    ),
    OnboardingModel(
      image: AppImages.second_image,
      title: 'Built for Performance\nand Timeless Style',
      subtitle:
          'Rims engineered for strength, balance, and\nstyle in every drive.',
    ),
    OnboardingModel(
      image: AppImages.thard_image,
      title: 'Engineered for Unrivaled\nPower and Reliability',
      subtitle: 'Unleash power and reliability with advanced\nengineering.',
    ),
  ];

  void onPageChanged(int index) {
    currentIndex.value = index;
  }

  void nextPage() {
    if (currentIndex.value < pages.length - 1) {
      pageController.nextPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    } else {
      Get.offAllNamed(Routes.loginScreen);
    }
  }
}

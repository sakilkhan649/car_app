import 'package:get/get.dart';

import '../../../core/routs/routs.dart';

class SplashController extends GetxController {
  RxInt step = 0.obs; // 0,1,2,3

  @override
  void onInit() {
    super.onInit();
    _startAnimation();
  }

  void _startAnimation() async {
    await Future.delayed(const Duration(seconds: 1));
    step.value = 1; // progress bar

    await Future.delayed(const Duration(seconds: 2));
    step.value = 2; // dot

    await Future.delayed(const Duration(seconds: 1));
    step.value = 3; // yellow screen

    await Future.delayed(const Duration(seconds: 1));
    Get.offAllNamed(Routes.onboardingScreen);
  }
}

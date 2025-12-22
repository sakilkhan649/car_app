import 'package:get/get.dart';

class StepController extends GetxController {
  RxInt currentStep = 0.obs;

  final int totalSteps = 3;

  void nextStep() {
    if (currentStep.value < totalSteps - 1) {
      currentStep.value++;
    }
  }

  void prevStep() {
    if (currentStep.value > 0) {
      currentStep.value--;
    }
  }

  void goToStep(int index) {
    if (index >= 0 && index < totalSteps) {
      currentStep.value = index;
    }
  }
}

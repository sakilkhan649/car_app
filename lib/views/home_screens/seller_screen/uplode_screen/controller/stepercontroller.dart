// lib/controller/stepercontroller.dart
import 'package:get/get.dart';

class StepController extends GetxController {
  /// current step index
  RxInt currentStep = 0.obs;

  /// total number of steps (page count)
  /// MainuplodeScreen এর steps.length এর সাথে মিলবে
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

  /// optional: reset all
  void reset() {
    currentStep.value = 0;
  }
}

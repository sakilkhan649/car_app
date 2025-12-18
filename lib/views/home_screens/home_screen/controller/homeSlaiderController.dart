import 'package:get/get.dart';

class SlideController extends GetxController {
  final dragPosition = 0.0.obs;
  final isCompleted = false.obs;

  void updateDrag(double dx, double maxDrag) {
    dragPosition.value += dx;
    if (dragPosition.value < 0) dragPosition.value = 0;
    if (dragPosition.value > maxDrag) {
      dragPosition.value = maxDrag;
    }
  }

  void reset() {
    dragPosition.value = 0;
    isCompleted.value = false;
  }

  void complete() {
    isCompleted.value = true;
  }
}
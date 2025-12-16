import 'package:get/get.dart';

/// ---------------- Controller ----------------
class BottomNavController extends GetxController {
  final RxInt selectedIndex = 0.obs;

  void changeIndex(int index) {
    selectedIndex.value = index;
  }
}

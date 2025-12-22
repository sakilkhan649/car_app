import 'package:get/get.dart';

import '../../../../../utils/app_images/app_images.dart';

class ProductDetailsController extends GetxController {
  RxInt dotPosition = 0.obs;

  List<String> carouselImages = [
    AppImages.cartire,
    AppImages.cartire,
    AppImages.cartire,
    AppImages.cartire,
    AppImages.cartire,
  ];

  void updateDot(int index) {
    dotPosition.value = index;
  }
}

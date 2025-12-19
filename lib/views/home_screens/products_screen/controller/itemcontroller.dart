import 'package:get/get.dart';
import '../../../../utils/app_images/app_images.dart';
import '../model/itemmodel.dart';

class Itemcontroller extends GetxController {
  final RxList<ItemProduct> products = <ItemProduct>[
    ItemProduct(
      name: "Clutch",
      imageUrl: AppImages.cartire,
      price: 32.3,
      status: "New",
    ),
    ItemProduct(
      name: "Tire",
      imageUrl: AppImages.cartire,
      price: 22.0,
      status: "Used",
    ),
    ItemProduct(
      name: "Glass",
      imageUrl: AppImages.cartire,
      price: 15.5,
      status: "New",
    ),
    ItemProduct(
      name: "Shock",
      imageUrl: AppImages.cartire,
      price: 40.0,
      status: "Used",
    ),
  ].obs;
}

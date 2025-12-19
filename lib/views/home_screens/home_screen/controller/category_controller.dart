import 'package:get/get.dart';
import '../../../../utils/app_images/app_images.dart';
import '../categori_buy_product/category_model.dart';
import '../categori_buy_product/product_model.dart';

class CategoryController extends GetxController {
  RxList<Category> categories = <Category>[
    Category(name: 'All', isSelected: true),
    Category(name: 'Engine'),
    Category(name: 'Tier'),
    Category(name: 'Glass'),
    Category(name: 'Suspension'),
  ].obs;

  RxString selectedCategory = 'All'.obs;

  void selectCategory(int index) {
    for (var i = 0; i < categories.length; i++) {
      categories[i].isSelected = i == index;
    }
    selectedCategory.value = categories[index].name;
    categories.refresh();
    updateFilteredProducts();
  }

  final List<Product> allProducts = [
    Product(name: "Clutch", category: "Engine", imageUrl: AppImages.cartire, price: 32.3),
    Product(name: "Tire", category: "Tier", imageUrl: AppImages.cartire, price: 22.0),
    Product(name: "Glass", category: "Glass", imageUrl: AppImages.cartire, price: 15.5),
    Product(name: "Shock", category: "Suspension", imageUrl: AppImages.cartire, price: 40.0),
  ];

  RxList<Product> filteredProducts = <Product>[].obs;

  @override
  void onInit() {
    updateFilteredProducts();
    super.onInit();
  }

  void updateFilteredProducts() {
    if (selectedCategory.value == 'All') {
      filteredProducts.value = allProducts;
    } else {
      filteredProducts.value = allProducts
          .where((product) => product.category == selectedCategory.value)
          .toList();
    }
  }
}


import 'package:car_app/views/home_screens/home_screen/controller/category_controller.dart';
import 'package:car_app/views/home_screens/home_screen/widget/product_card.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../common_widgets/Custom_text.dart';
import '../../../widget/Custom_Back_button.dart';

class AllProductScreen extends StatelessWidget {
  AllProductScreen({super.key});

  final categoryController = Get.find<CategoryController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: CustomBackButton(),
        title: CustomText(
          text: "All Products",
          fontSize: 20,
          fontWeight: FontWeight.w600,
          fontStyle: FontStyle.italic,
          color: Colors.white,
        ),
      ),
      body: Obx(() {
        final products = categoryController.filteredProducts;

        if (products.isEmpty) {
          return const Center(
            child: Text(
              'No products available',
              style: TextStyle(color: Colors.white70),
            ),
          );
        }

        return Padding(
          padding: const EdgeInsets.all(16),
          child: GridView.builder(
            itemCount: products.length,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 12,
              mainAxisSpacing: 12,
              childAspectRatio: 0.70,
            ),
            itemBuilder: (context, index) {
              final product = products[index];
              return ProductCard(
                name: product.name,
                imageUrl: product.imageUrl,
                price: product.price,
              );
            },
          ),
        );
      }),
    );
  }
}

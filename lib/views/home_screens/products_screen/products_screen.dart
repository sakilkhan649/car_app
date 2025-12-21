import 'package:car_app/views/home_screens/products_screen/widget/filter_drower.dart';
import 'package:car_app/views/home_screens/products_screen/widget/item_card.dart';
import 'package:car_app/views/home_screens/products_screen/widget/searchbarwithfilter.dart';
import 'package:car_app/widget/Custom_text_italic.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../utils/app_icons/app_icons.dart';
import '../main_home_screen/Drawer/drower_screens/Custom_drader.dart';
import 'controller/itemcontroller.dart';

class ProductsScreen extends StatelessWidget {
  ProductsScreen({super.key});

  final searchController = TextEditingController();
  final Itemcontroller itemController = Get.put(Itemcontroller());

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      drawer:  FilterDrawer(), // LEFT drawer
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: CustomTextItalic(text: "Products"),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.fromLTRB(20.w, 24.w, 20.w, 50.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SearchBarWithFilter(
                controller: searchController,
                filterIconPath: AppIcons.filtericon,
                onFilterTap: () {
                  _scaffoldKey.currentState?.openDrawer(); // ✅ Open LEFT drawer
                },
              ),
              SizedBox(height: 20.h),

              /// Reactive GridView using Obx
              Obx(
                    () => GridView.builder(
                  itemCount: itemController.products.length,
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 12.w,
                    mainAxisSpacing: 12.h,
                    childAspectRatio: 0.70,
                  ),
                  itemBuilder: (context, index) {
                    final product = itemController.products[index];
                    return ItemCard(
                      name: product.name,
                      imageUrl: product.imageUrl,
                      price: product.price,
                      status: product.status,
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

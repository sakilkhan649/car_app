import 'package:car_app/views/home_screens/home_screen/widget/CategoryChip.dart';
import 'package:car_app/views/home_screens/home_screen/widget/Custom_container.dart';
import 'package:car_app/views/home_screens/home_screen/widget/product_card.dart';
import 'package:car_app/widget/Custom_text_italic.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import '../../../common_widgets/Custom_text.dart';
import '../../../core/routs/routs.dart';
import '../../../utils/app_icons/app_icons.dart';
import '../../../utils/app_images/app_images.dart';
import '../../../widget/Custom_badge.dart';
import '../../../widget/Custom_pani_card.dart';
import '../../../widget/Custom_searchbar.dart';
import '../main_home_screen/Drawer/drower_screens/Custom_drader.dart';
import 'controller/category_controller.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  final searchController = TextEditingController();
  final categoryController = Get.put(CategoryController());

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        drawer: CustomDrawer(),
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          leadingWidth: 40,
          leading: Builder(
            builder: (context) => IconButton(
              icon: SvgPicture.asset(
                AppIcons.drawericon,
                height: 24,
                width: 24,
              ),
              onPressed: () {
                Scaffold.of(context).openDrawer();
              },
            ),
          ),
          titleSpacing: 10,
          title: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              CircleAvatar(
                radius: 20,
                backgroundImage: AssetImage(AppImages.profile_image),
              ),
              SizedBox(width: 6),
              CustomText(
                text: "Hi Nick",
                fontWeight: FontWeight.w600,
                fontSize: 16,
                color: Colors.white,
              ),
            ],
          ),
          actions: [
            IconButton(
              onPressed: () {
                Get.toNamed(Routes.notificationsScreen);
              },
              icon: SvgPicture.asset(
                AppIcons.notificationicon,
                height: 24,
                width: 24,
              ),
            ),
          ],
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.fromLTRB(20.w, 24.w, 20.w, 50.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomSearchBar(
                  controller: searchController,
                  onChanged: (value) {},
                ),
                SizedBox(height: 24.h),

                /// Main promo card
                CustomCard(
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Expanded(
                            flex: 3,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                CustomBadge(text: "Premium Product"),
                                SizedBox(height: 12),
                                CustomTextItalic(text: "Engine"),
                                SizedBox(height: 8),
                                Text(
                                  "Engine is the science\nof delivering power.",
                                  style: TextStyle(
                                    color: Colors.white.withOpacity(0.8),
                                    fontWeight: FontWeight.w400,
                                    fontSize: 14,
                                    height: 1.5,
                                  ),
                                ),
                                SizedBox(height: 20),
                                GetXSlideButton(
                                  color: Color(0xFF878787),
                                  onComplete: () {
                                    Get.toNamed(Routes.sellermyproductScreen);
                                  },
                                ),
                              ],
                            ),
                          ),
                          Expanded(
                            flex: 3,
                            child: Image.asset(
                              AppImages.enginone,
                              fit: BoxFit.contain,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),

                SizedBox(height: 24.h),
                CustomTextItalic(text: "Popular Categories"),
                SizedBox(height: 10.h),

                /// Categories List
                Obx(
                  () => SizedBox(
                    height: 45,
                    child: ListView.separated(
                      scrollDirection: Axis.horizontal,
                      itemCount: categoryController.categories.length,
                      separatorBuilder: (_, __) => SizedBox(width: 10.w),
                      itemBuilder: (context, index) {
                        final category = categoryController.categories[index];
                        return GestureDetector(
                          onTap: () => categoryController.selectCategory(index),
                          child: CategoryChip(
                            label: category.name,
                            isselected: category.isSelected,
                          ),
                        );
                      },
                    ),
                  ),
                ),

                SizedBox(height: 24.h),

                /// All + See More Row
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Obx(
                      () => CustomTextItalic(
                        text: categoryController.selectedCategory.value,
                      ),
                    ),
                    GestureDetector(
                      onTap: () => Get.toNamed(Routes.allProductScreen),
                      child: CustomText(
                        text: "See more",
                        fontSize: 16,
                        color: Colors.white70,
                      ),
                    ),
                  ],
                ),

                SizedBox(height: 16.h),

                /// Product Grid (fixed!)
                Obx(
                  () => GridView.builder(
                    itemCount: categoryController.filteredProducts.length,
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 12,
                      mainAxisSpacing: 12,
                      childAspectRatio: 0.70,
                    ),

                    itemBuilder: (context, index) {
                      final product =
                          categoryController.filteredProducts[index];
                      return ProductCard(
                        name: product.name,
                        imageUrl: product.imageUrl,
                        price: product.price,
                      );
                    },
                  ),
                ),

                SizedBox(height: 21.h),

                /// Main promo card
                CustomCard(
                  gradientColors: [Color(0xFF5BB349), Color(0xFF5BB349)],
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Expanded(
                            flex: 3,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  padding: EdgeInsets.symmetric(
                                    horizontal: 14.w,
                                    vertical: 8.h,
                                  ),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(30.r),
                                    border: Border.all(
                                      color: Colors.black,
                                      width: 1,
                                    ),
                                  ),
                                  child: CustomText(
                                    text: "Become a Seller",
                                    color: Colors.black,
                                    fontSize: 12,
                                  ),
                                ),
                                SizedBox(height: 12),
                                CustomTextItalic(
                                  text: "Drive\nYour Business Forward",
                                  color: Colors.black,
                                ),
                                SizedBox(height: 8),
                                CustomText(
                                  text: "Sell today, reach\neverywhere.",
                                  color: Colors.black,
                                  fontSize: 13,
                                ),
                                SizedBox(height: 20),
                                GetXSlideButton(
                                  color: Color(0xFF376B2C),
                                  onComplete: () {
                                    Get.toNamed(Routes.sellermyproductScreen);
                                  },
                                ),
                              ],
                            ),
                          ),
                          Expanded(
                            flex: 3,
                            child: Image.asset(
                              AppImages.manimage,
                              fit: BoxFit.contain,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 20.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CustomTextItalic(text: "New Arrival"),
                    GestureDetector(
                      onTap: () => Get.toNamed(Routes.allProductScreen),
                      child: CustomText(
                        text: "See more",
                        fontSize: 16,
                        color: Colors.white70,
                      ),
                    ),
                  ],
                ),

                SizedBox(height: 16.h),

                /// Product Grid (fixed!)
                Obx(
                  () => GridView.builder(
                    itemCount: categoryController.filteredProducts.length,
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 12,
                      mainAxisSpacing: 12,
                      childAspectRatio: 0.70,
                    ),

                    itemBuilder: (context, index) {
                      final product =
                          categoryController.filteredProducts[index];
                      return ProductCard(
                        name: product.name,
                        imageUrl: product.imageUrl,
                        price: product.price,
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

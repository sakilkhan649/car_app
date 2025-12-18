import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../utils/app_icons/app_icons.dart';
import '../home_screen/home_screen.dart';
import '../products_screen/products_screen.dart';
import '../category_screen/category_screen.dart';
import '../seller_screen/seller_screen.dart';
import 'main_controller/main_controller.dart';

class MainHomeScreen extends StatelessWidget {
  MainHomeScreen({super.key});

  final BottomNavController controller = Get.put(BottomNavController());

  final List<String> icons = [
    AppIcons.homeicon,
    AppIcons.producticon,
    AppIcons.categoryicon,
    AppIcons.sellericon,
  ];

  final List<Widget> pages = [
    HomeScreen(),
    const ProductsScreen(),
    const CategoryScreen(),
    const SellerScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF1E1E1E),

      /// -------- Page Change --------
      body: Obx(
        () => IndexedStack(
          index: controller.selectedIndex.value,
          children: pages,
        ),
      ),

      /// -------- Bottom Nav --------
      bottomNavigationBar: Padding(
        padding: EdgeInsets.all(20.w),
        child: Container(
          height: 100.h,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(100.r),
            boxShadow: [
              BoxShadow(
                color: Colors.grey,
                blurRadius: 0,
                spreadRadius: 1,
                offset: const Offset(0, 2),
              ),
              BoxShadow(
                color: Colors.black,
                blurRadius: 1,
                spreadRadius: 1,
                offset: Offset(2, 4),
              ),
            ],
          ),
          child: Obx(
            () => Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: List.generate(icons.length, (index) {
                bool isSelected = controller.selectedIndex.value == index;
                return GestureDetector(
                  onTap: () {
                    controller.changeIndex(index);
                  },
                  child: Container(
                    height: 66,
                    width: 66,
                    padding: EdgeInsets.all(20.sp),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(100.r),
                      color: isSelected ? Colors.white : Colors.transparent,
                      border: isSelected
                          ? Border.all(color: const Color(0xFFFE9100), width: 2)
                          : null,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey,
                          blurRadius: 0,
                          spreadRadius: 1,
                          offset: const Offset(0, 2),
                        ),
                        BoxShadow(
                          color: const Color(0xFF1A1A1A),
                          blurRadius: 1,
                          spreadRadius: 1,
                          offset: const Offset(2, 4),
                        ),
                      ],
                    ),
                    child: SvgPicture.asset(
                      icons[index],
                      color: isSelected ? Colors.black : Colors.white,
                    ),
                  ),
                );
              }),
            ),
          ),
        ),
      ),
    );
  }
}

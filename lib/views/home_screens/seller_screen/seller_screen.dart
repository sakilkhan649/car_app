import 'package:car_app/utils/app_icons/app_icons.dart';
import 'package:car_app/views/home_screens/seller_screen/widget/containerbox.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../core/routs/routs.dart';
import '../../../widget/Custom_text_italic.dart';

class SellerScreen extends StatelessWidget {
  const SellerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: CustomTextItalic(text: "Seller Account"),
      ),
      body: Padding(
        padding: EdgeInsets.fromLTRB(20.w, 10.w, 20.w, 50.w),
        child: Column(

          children: [
            ActionTile(
              icon: AppIcons.magnifyingGlass,
              title: 'Upload Products',
              subtitle: 'Add new products to your store inventory',
              gradientColors: [
                Color(0xFF5BB349),
                Color(0xFF5BB349),
                Color(0xFFB2FFA2),
              ],
              onTap: () {
                Get.toNamed(Routes.mainuplodeScreen);
              },
            ),
            SizedBox(height: 12),
            ActionTile(
              icon: AppIcons.addcategoryicon,
              title: 'Add New Category',
              subtitle: 'Create and organize product categories',
              gradientColors: [
                Color(0xFFE7BE00),
                Color(0xFFE7BE00),
                Color(0xFFFFEFA6),
              ],
              onTap: () {
                Get.toNamed(Routes.selleraddnewcategory);
              },
            ),
            SizedBox(height: 12),
            ActionTile(
              icon: AppIcons.myboxicon,
              title: 'My Products',
              subtitle: 'View and manage your existing products',
              gradientColors: [
                Color(0xFFFF0000),
                Color(0xFFFF0000),
                Color(0xFFFFB5B5),
              ],
              onTap: () {
                Get.toNamed(Routes.sellermyproductScreen);
              },
            ),
            SizedBox(height: 5),
          ],
        ),
      ),
    );
  }
}

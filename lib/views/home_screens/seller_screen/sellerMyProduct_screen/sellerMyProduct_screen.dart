import 'package:car_app/utils/app_images/app_images.dart';
import 'package:car_app/views/home_screens/seller_screen/sellerMyProduct_screen/widget/CustomGalassCard.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../common_widgets/Custom_text.dart';
import '../../../../widget/Custom_Back_button.dart';

class SellermyproductScreen extends StatelessWidget {
  const SellermyproductScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: CustomBackButton(),
        title: CustomText(
          text: "My Product",
          fontSize: 20,
          fontWeight: FontWeight.w600,
          fontStyle: FontStyle.italic,
          color: Colors.white,
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.fromLTRB(20.w, 24.w, 20.w, 50.w),
          child: Column(
            children: [
              Row(
                children: [
                  Expanded(
                    child: ProductItemCard(
                      title: "Car Clutch",
                      status: "Used",
                      price: "32.30",
                      imagePath: AppImages.cartire,
                      onTap: () {
                        // Handle tap
                      },
                    ),
                  ),
                  SizedBox(width: 10.w),
                  Expanded(
                    child: ProductItemCard(
                      title: "Car Clutch",
                      status: "Refurb",
                      price: "32.30",
                      statusGradientColors: [
                        Color(0xFFE7BE00),
                        Color(0xFFE7BE00),
                        Color(0xFFFFEFA6),
                      ],
                      imagePath: AppImages.cartire,
                      onTap: () {
                        // Handle tap
                      },
                    ),
                  ),
                ],
              ),
              SizedBox(height: 10.h),
              Row(
                children: [
                  Expanded(
                    child: ProductItemCard(
                      title: "Car Clutch",
                      status: "Used",
                      price: "32.30",
                      imagePath: AppImages.cartire,
                      onTap: () {
                        // Handle tap
                      },
                    ),
                  ),
                  SizedBox(width: 10.w),
                  Expanded(
                    child: ProductItemCard(
                      title: "Car Clutch",
                      status: "Refurb",
                      price: "32.30",
                      statusGradientColors: [
                        Color(0xFFE7BE00),
                        Color(0xFFE7BE00),
                        Color(0xFFFFEFA6),
                      ],
                      imagePath: AppImages.cartire,
                      onTap: () {
                        // Handle tap
                      },
                    ),
                  ),
                ],
              ),
              SizedBox(height: 10.h),
              Row(
                children: [
                  Expanded(
                    child: ProductItemCard(
                      title: "Car Clutch",
                      status: "Used",
                      price: "32.30",
                      imagePath: AppImages.cartire,
                      onTap: () {
                        // Handle tap
                      },
                    ),
                  ),
                  SizedBox(width: 10.w),
                  Expanded(
                    child: ProductItemCard(
                      title: "Car Clutch",
                      status: "Refurb",
                      price: "32.30",
                      statusGradientColors: [
                        Color(0xFFE7BE00),
                        Color(0xFFE7BE00),
                        Color(0xFFFFEFA6),
                      ],
                      imagePath: AppImages.cartire,
                      onTap: () {
                        // Handle tap
                      },
                    ),
                  ),
                ],
              ),
              SizedBox(height: 10.h),
              Row(
                children: [
                  Expanded(
                    child: ProductItemCard(
                      title: "Car Clutch",
                      status: "Used",
                      price: "32.30",
                      imagePath: AppImages.cartire,
                      onTap: () {
                        // Handle tap
                      },
                    ),
                  ),
                  SizedBox(width: 10.w),
                  Expanded(
                    child: ProductItemCard(
                      title: "Car Clutch",
                      status: "Refurb",
                      price: "32.30",
                      statusGradientColors: [
                        Color(0xFFE7BE00),
                        Color(0xFFE7BE00),
                        Color(0xFFFFEFA6),
                      ],
                      imagePath: AppImages.cartire,
                      onTap: () {
                        // Handle tap
                      },
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

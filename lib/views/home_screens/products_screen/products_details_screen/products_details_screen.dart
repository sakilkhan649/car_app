import 'package:car_app/common_widgets/Custom_button.dart';
import 'package:car_app/utils/app_icons/app_icons.dart';
import 'package:car_app/views/home_screens/products_screen/products_details_screen/widget/Custom_hards.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import '../../../../common_widgets/Custom_text.dart';
import '../../../../widget/CustomTexth.dart';
import '../../../../widget/Custom_Back_button.dart';
import 'controller/detailcontroller.dart';

class ProductsDetailsScreen extends StatelessWidget {
  ProductsDetailsScreen({super.key});

  final ProductDetailsController c = Get.put(ProductDetailsController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: const CustomBackButton(),
        title: const CustomText(
          text: "Product Details",
          fontSize: 20,
          fontWeight: FontWeight.w600,
          fontStyle: FontStyle.italic,
          color: Colors.white,
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.fromLTRB(20.w, 24.w, 20.w, 100.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              /// 🔘 Top row icons (custom)
              IconBoxRow(),

              /// 📷 Carousel + image + rating
              AspectRatio(
                aspectRatio: 1.3,
                child: CarouselSlider(
                  items: c.carouselImages.map((path) {
                    return Builder(
                      builder: (context) => SizedBox.expand(
                        child: Container(
                          decoration: BoxDecoration(
                            color: Color(0xFF212121),
                            borderRadius: BorderRadius.circular(12.r),
                            border: Border.all(color: Colors.white),
                          ),
                          child: Stack(
                            children: [
                              /// 🖼 Image
                              Center(
                                child: Padding(
                                  padding: EdgeInsets.all(16.w),
                                  child: Image.asset(path, fit: BoxFit.contain),
                                ),
                              ),

                              /// ⭐ Rating badge
                              Positioned(
                                top: 12.h,
                                right: 12.w,
                                child: Container(
                                  padding: EdgeInsets.symmetric(
                                    horizontal: 6.w,
                                    vertical: 2.h,
                                  ),
                                  decoration: BoxDecoration(
                                    color: Color(0xFF212121),
                                    borderRadius: BorderRadius.circular(10.r),
                                    border: Border.all(color: Colors.white),
                                  ),
                                  child: Row(
                                    children: [
                                      Icon(
                                        Icons.star,
                                        color: Colors.amber,
                                        size: 14.sp,
                                      ),
                                      SizedBox(width: 4.w),
                                      const CustomText(
                                        text: "4.0",
                                        fontSize: 12,
                                        fontWeight: FontWeight.w600,
                                        color: Colors.white,
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  }).toList(),
                  options: CarouselOptions(
                    autoPlay: false,
                    enlargeCenterPage: true,
                    viewportFraction: 0.85, // change to 1.0 for full width
                    onPageChanged: (index, reason) {
                      c.updateDot(index);
                    },
                  ),
                ),
              ),

              /// 🔘 Dot Indicator
              Align(
                alignment: Alignment.center,
                child: Obx(
                  () => DotsIndicator(
                    mainAxisAlignment: MainAxisAlignment.center,
                    dotsCount: c.carouselImages.length,
                    position: c.dotPosition.value.toDouble(),
                    decorator: DotsDecorator(
                      activeColor: Colors.white,
                      color: Colors.grey,
                      spacing: EdgeInsets.all(3.w),
                      activeSize: Size(12.w, 12.w),
                      size: Size(10.w, 10.w),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 5.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CustomTexth(
                    text: "OEM Front Bumper",
                    fontSize: 24,
                    fontWeight: FontWeight.w700,
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(
                      horizontal: 12.w,
                      vertical: 5.h,
                    ),
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [
                          Color(0xFFFF0000),
                          Color(0xFFFF0000),
                          Color(0xFFFFB5B5),
                        ],
                      ),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Text(
                      "Used",
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w500,
                        fontSize: 12.sp,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 10.h),
              CustomText(text: "Toyota Corolla", fontSize: 16),
              SizedBox(height: 10.h),
              CustomText(
                text:
                    "High-quality OEM replacement front bumper for Toyota"
                    " Corolla. Perfect fit and finish with all mounting "
                    "hardware included. Features impact-resistant ABS plastic"
                    " construction with primer finish ready for painting.",
              ),
              SizedBox(height: 5.h),
              Divider(color: Colors.grey, thickness: 1.h),
              SizedBox(height: 5.h),
              Row(
                children: [
                  SvgPicture.asset(
                    AppIcons.myboxtwoicon,
                    height: 24,
                    width: 24,
                  ),
                  SizedBox(width: 5.w),
                  CustomTexth(text: "Specifications", fontSize: 18),
                ],
              ),
              SizedBox(height: 16.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CustomText(text: "Brand", fontSize: 15),
                  CustomTexth(text: "Toyota Genuine", fontSize: 15),
                ],
              ),
              SizedBox(height: 16.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CustomText(text: "Car Model", fontSize: 15),
                  CustomTexth(text: "Toyota", fontSize: 15),
                ],
              ),
              SizedBox(height: 10.h),
              Center(
                child: Container(
                  height: 4,
                  width: 100,
                  decoration: BoxDecoration(
                    color: Color(0xFFC4C4C4),
                    borderRadius: BorderRadius.circular(12.r),
                  ),
                ),
              ),
              SizedBox(height: 10.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CustomText(text: "Chassis Number", fontSize: 15),
                  CustomTexth(text: "ZRE172", fontSize: 15),
                ],
              ),
              SizedBox(height: 16.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CustomText(text: "Category", fontSize: 15),
                  CustomTexth(text: "Body Parts", fontSize: 15),
                ],
              ),
              SizedBox(height: 16.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CustomText(text: "Warranty", fontSize: 15),
                  CustomTexth(text: "1 Year", fontSize: 15),
                ],
              ),
              SizedBox(height: 5.h),
              Divider(color: Colors.grey, thickness: 1.h),
              SizedBox(height: 5.h),
              Row(
                children: [
                  SvgPicture.asset(
                    AppIcons.sellerprofileicon,
                    height: 24,
                    width: 24,
                  ),
                  SizedBox(width: 5.w),
                  CustomTexth(text: "Seller Information", fontSize: 18),
                ],
              ),
              SizedBox(height: 16.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CustomText(
                    text: "Shakhowat Hossain",
                    fontSize: 15,
                    color: Colors.white,
                  ),
                  Row(
                    children: [
                      Icon(Icons.star, color: Colors.amber, size: 25),
                      SizedBox(width: 4.w),
                      const CustomText(
                        text: "4.0",
                        fontSize: 12,
                        fontWeight: FontWeight.w600,
                        color: Colors.white,
                      ),
                    ],
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CustomText(text: "Verified Seller", fontSize: 15),
                  CustomText(text: "Rating", fontSize: 15),
                ],
              ),
              SizedBox(height: 32.h),
              CustomButton(
                backgroundColor: Color(0xFF5BB349),
                textColor: Colors.white,
                icon: SvgPicture.asset(
                  AppIcons.whatsupicon,
                  height: 24,
                  width: 24,
                ),
                text: "Chat With Seller",
                onPressed: () {},
              ),
              SizedBox(height: 16.h),
              CustomButton(
                icon: SvgPicture.asset(
                  AppIcons.searchicon,
                  height: 24,
                  width: 24,
                ),
                text: "Chat With Seller",
                onPressed: () {},
              ),
            ],
          ),
        ),
      ),
    );
  }
}

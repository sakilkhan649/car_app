import 'package:car_app/views/home_screens/home_screen/widget/Custom_container.dart';
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

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  final searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
        statusBarColor: Colors.white.withOpacity(0.25),
        statusBarIconBrightness: Brightness.light,
      ),
    );

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
            padding: EdgeInsets.fromLTRB(20.w, 24.w, 20.w, 20.w),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomSearchBar(
                  controller: searchController,
                  onChanged: (value) {},
                ),
                SizedBox(height: 24.h),

                // Main Container
                CustomCard(
                  child: Column(
                    children: [
                      // Top Row
                      Row(
                        children: [
                          Expanded(
                            flex: 3,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                // Premium Badge
                                CustomBadge(text: "Premium Product"),

                                SizedBox(height: 12),

                                // Title
                                CustomTextItalic(text: "Engine"),
                                SizedBox(height: 8),

                                // Description
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

                                // Slide Button
                                GetXSlideButton(
                                  onComplete: () {
                                    Get.toNamed(Routes.productsScreen);
                                  },
                                ),
                              ],
                            ),
                          ),

                          // Image
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

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CustomTextItalic(text: "All"),
                    CustomText(text: "See more", fontSize: 16),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

import 'package:car_app/utils/app_icons/app_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import '../../../../../common_widgets/Custom_button.dart';
import '../../../../../common_widgets/Custom_text.dart';
import '../../../../../core/routs/routs.dart';
import '../../../../../utils/app_colors/app_colors.dart';
import '../../../../../utils/app_images/app_images.dart';
import '../../../products_screen/products_details_screen/widget/ratingdaialog.dart';
import 'widget/Custom_row_item.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    // Screen width
    final double drawerWidth = MediaQuery.of(context).size.width * 0.85;

    return SizedBox(
      width: drawerWidth,
      child: Drawer(
        backgroundColor: AppColors.black100,
        shape: const RoundedRectangleBorder(borderRadius: BorderRadius.zero),
        clipBehavior: Clip.none,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 34, vertical: 35),
          child: Wrap(
            runSpacing: 8,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CircleAvatar(
                        radius: 50.r,
                        backgroundImage: AssetImage(AppImages.profile_image),
                      ),
                      InkWell(
                        onTap: () {
                          Get.back();
                        },
                        child: SvgPicture.asset(AppIcons.drawericon),
                      ),
                    ],
                  ),
                  SizedBox(height: 12.h),
                  CustomText(
                    text: "Nickesha",
                    fontSize: 24,
                    fontWeight: FontWeight.w600,
                    fontStyle: FontStyle.italic,
                    color: Colors.white,
                  ),
                  CustomText(
                    text: "Nickesha@example.com",
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                  ),
                ],
              ),
              Divider(
                indent: 2,
                endIndent: 10,
                thickness: 1,
                color: Colors.white,
              ),
              DrawerMenuItem(
                iconPath: AppIcons.userprofileicon,
                title: "User Profile",
                subtitle: "Change profile image,name or password",
                onTap: () {
                  Get.toNamed(Routes.userProfileScreen);
                },
              ),
              DrawerMenuItem(
                iconPath: AppIcons.policyicon,
                title: "Privacy Policy",
                subtitle: "Manage your data and permissions.",
                onTap: () {
                  Get.toNamed(Routes.privacyPolicyScreen);
                },
              ),
              DrawerMenuItem(
                iconPath: AppIcons.termsicon,
                title: "Terms & Conditions",
                subtitle: "Read terms & conditions before use",
                onTap: () {
                  Get.toNamed(Routes.termsandconditionScreen);
                },
              ),
              DrawerMenuItem(
                iconPath: AppIcons.abouticon,
                title: "About",
                subtitle: "Learn more about our app and mission.",
                onTap: () {
                  Get.toNamed(Routes.aboutScreen);
                },
              ),
              DrawerMenuItem(
                iconPath: AppIcons.faqicon,
                title: "FAQ",
                subtitle: "Find answers to common questions.",
                onTap: () {
                  Get.toNamed(Routes.faqScreen);
                },
              ),
              DrawerMenuItem(
                iconPath: AppIcons.ratingicon,
                title: "Rating",
                subtitle: "Share your feedback and rate us.",
                onTap: () {
                  showDialog(
                    context: context,
                    builder: (_) => RatingDialogGetX(),
                  );
                },
              ),

              CustomButton(
                borderColor: Colors.white,
                textColor: Colors.white,
                backgroundColor: Colors.transparent,
                text: "Logout",
                icon: SvgPicture.asset(
                  AppIcons.logouticon,
                  height: 24,
                  width: 24,
                ),
                onPressed: () {
                  // Get.toNamed(Routes.loginScreen);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

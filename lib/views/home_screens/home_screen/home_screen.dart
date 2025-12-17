import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import '../../../common_widgets/Custom_text.dart';
import '../../../core/routs/routs.dart';
import '../../../utils/app_icons/app_icons.dart';
import '../../../utils/app_images/app_images.dart';
import '../main_home_screen/Drawer/drower_screens/Custom_drader.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Status bar color change
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
        body: Center(
          child: Text("home", style: TextStyle(color: Colors.white)),
        ),
      ),
    );
  }
}

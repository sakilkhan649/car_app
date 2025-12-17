
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../common_widgets/Custom_text.dart';
import '../../../../../utils/app_images/app_images.dart';
import '../../../../../widget/Custom_Back_button.dart';

class UserProfileScreen extends StatelessWidget {
  const UserProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: const CustomBackButton(),
        title: const CustomText(
          text: "User Profile",
          fontSize: 20,
          fontWeight: FontWeight.w600,
          fontStyle: FontStyle.italic,
          color: Colors.white,
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            Center(
              child: CircleAvatar(
                radius: 50.r,
                backgroundImage: AssetImage(AppImages.profile_image),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

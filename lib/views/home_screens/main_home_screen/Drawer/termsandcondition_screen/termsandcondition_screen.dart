import 'package:car_app/views/home_screens/main_home_screen/Drawer/termsandcondition_screen/widget/customrichtext.dart';
import 'package:car_app/widget/CustomTexth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../../../../common_widgets/Custom_text.dart';
import '../../../../../../widget/Custom_Back_button.dart';
import '../../../../../common_widgets/Custom_check_box.dart';

class TermsandconditionScreen extends StatelessWidget {
  TermsandconditionScreen({super.key});

  RxBool isChecked = false.obs;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: CustomBackButton(),
        title: CustomText(
          text: "Terms & Conditions",
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
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomRichTextBlock(
                normalText1:
                    'Please read these Terms and Conditions carefully before using our Auto Parts mobile application or website ',
                highlightedText: '(“the Platform”).\n',
                normalText2:
                    'By accessing or using the Platform, you agree to be bound by these terms.',
              ),
              SizedBox(height: 20.h),
              CustomTexth(
                text: "1. Acceptance of Terms",
                fontWeight: FontWeight.w500,
              ),
              SizedBox(height: 12.h),
              CustomRichTextBlock(
                normalText1: 'By creating an account and using the ',
                highlightedText: '[Your Auto Parts Brand Name]\n',
                highlightedColor: Colors.green,
                normalText2:
                    ' Platform, you acknowledge that you have read, understood, and agreed to these Terms and Conditions. If you do not agree, please do not use our services.',
              ),
              SizedBox(height: 20.h),
              CustomTexth(
                text: "2. User Accounts",
                fontWeight: FontWeight.w500,
              ),
              SizedBox(height: 12.h),
              CustomTexth(
                text:
                    "By creating an account, you agree to provide accurate, complete, and current information. You are solely responsible for safeguarding your account details and password, and you accept responsibility for all activities that occur under your account. If you suspect any unauthorized use, you must notify us immediately.",
              ),
              SizedBox(height: 20.h),
              CustomTexth(
                text: "3. Privacy Policy",
                fontWeight: FontWeight.w500,
              ),
              SizedBox(height: 12.h),
              CustomTexth(
                text:
                    "Your privacy is important to us. We collect and use personal information in accordance with our Privacy Policy, which explains how your data is handled, stored, and protected. By using the Platform, you consent to these data practices.",
              ),
              SizedBox(height: 20.h),
              CustomTexth(
                text: "4. Governing Law",
                fontWeight: FontWeight.w500,
              ),
              SizedBox(height: 12.h),
              CustomTexth(
                text:
                    "We reserve the right to update or modify these Terms and Conditions at any time. Continued use of the App after any changes means that you accept the revised terms. These Terms shall be governed by and construed under the laws of [Insert Country/Region].",
              ),
              SizedBox(height: 24.h),
              Row(
                children: [
                  CustomCheckbox(
                    isChecked: isChecked,
                    activeColor: Colors.orangeAccent,
                    borderColor: Colors.orangeAccent,
                    checkColor: Colors.black,
                  ),
                  CustomTexth(
                    text: "Accepted terms & conditions",
                    fontWeight: FontWeight.w500,
                  ),
                ],
              ),
              SizedBox(height: 24.h),
            ],
          ),
        ),
      ),
    );
  }
}

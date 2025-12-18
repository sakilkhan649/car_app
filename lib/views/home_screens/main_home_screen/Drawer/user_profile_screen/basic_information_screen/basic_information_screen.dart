import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../../../../common_widgets/Custom_button.dart';
import '../../../../../../common_widgets/Custom_text.dart';
import '../../../../../../common_widgets/Custom_textField.dart';
import '../../../../../../utils/app_const/app_const.dart';
import '../../../../../../utils/app_icons/app_icons.dart';
import '../../../../../../widget/Custom_Back_button.dart';
import '../../../../../../widget/Custom_card_circle.dart';

class BasicInformationScreen extends StatelessWidget {
  BasicInformationScreen({super.key});

  final _formkey = GlobalKey<FormState>();

  final isPasswordVisible = false.obs;
  final isComPasswordVisible = false.obs;

  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formkey,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          leading: CustomBackButton(),
          title: CustomText(
            text: "User Profile",
            fontSize: 20,
            fontWeight: FontWeight.w600,
            fontStyle: FontStyle.italic,
            color: Colors.white,
          ),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.fromLTRB(20, 68, 20, 199),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Centered Logo (fixed)
                Center(
                  child: CustomCircleIcon(iconPath: AppIcons.userprofileicon),
                ),
                SizedBox(height: 16.h),

                Center(
                  child: CustomText(
                    text: "Basic Information",
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                    fontStyle: FontStyle.italic,
                    color: Colors.white,
                  ),
                ),

                SizedBox(height: 32.h),
                CustomText(text: "Full Name", color: Colors.white),
                SizedBox(height: 8.h),
                Customtextfield(
                  controller: emailController,
                  hintText: "Please enter your full name",
                  obscureText: false,
                  textInputType: TextInputType.name,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Enter your Full Name";
                    }
                    if (!AppString.usernameRegexp.hasMatch(value)) {
                      return "Invalid Name";
                    }
                    return null;
                  },
                ),
                SizedBox(height: 12.h),
                CustomText(text: "Business Name", color: Colors.white),
                SizedBox(height: 8.h),
                Customtextfield(
                  controller: emailController,
                  hintText: "Please enter your Business Name",
                  obscureText: false,
                  textInputType: TextInputType.name,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Enter your Business Name";
                    }
                    if (!AppString.usernameRegexp.hasMatch(value)) {
                      return "Invalid Business Name";
                    }
                    return null;
                  },
                ),
                SizedBox(height: 12.h),
                CustomText(text: "Address", color: Colors.white),
                SizedBox(height: 8.h),
                Customtextfield(
                  controller: emailController,
                  hintText: "Please enter your Address",
                  obscureText: false,
                  textInputType: TextInputType.name,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Enter your Address";
                    }
                    if (!AppString.usernameRegexp.hasMatch(value)) {
                      return "Invalid Address";
                    }
                    return null;
                  },
                ),
                SizedBox(height: 12.h),
                CustomText(text: "WhatsApp Number", color: Colors.white),
                SizedBox(height: 8.h),
                Customtextfield(
                  controller: emailController,
                  hintText: "Please enter your whatsApp Number",
                  obscureText: false,
                  textInputType: TextInputType.number,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Enter WhatsApp Number";
                    }
                    if (!AppString.phoneRegexp.hasMatch(value)) {
                      return "Invalid WhatsApp Number";
                    }
                    return null;
                  },
                ),

                SizedBox(height: 48.h),

                CustomButton(
                  text: "Update",
                  onPressed: () {
                    // Get.toNamed(Routes.checkEmailScreen);
                    //if (_formkey.currentState!.validate()) {}
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

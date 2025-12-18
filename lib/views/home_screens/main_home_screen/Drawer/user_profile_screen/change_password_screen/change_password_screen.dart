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

class ChangePasswordScreen extends StatelessWidget {
  ChangePasswordScreen({super.key});

  final _formkey = GlobalKey<FormState>();

  final isCurrentPasswordVisible = false.obs;
  final isPasswordVisible = false.obs;
  final isComPasswordVisible = false.obs;

  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formkey,
      child: Scaffold(
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          leading: CustomBackButton(),
          title: CustomText(
            text: "Change Password",
            fontSize: 20,
            fontWeight: FontWeight.w600,
            fontStyle: FontStyle.italic,
            color: Colors.white,
          ),
        ),
        body: Center(
          child: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.fromLTRB(20, 68, 20, 199),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Centered Logo (fixed)
                  Center(
                    child: CustomCircleIcon(iconPath: AppIcons.contacticon),
                  ),
                  SizedBox(height: 16.h),

                  Center(
                    child: CustomText(
                      text: "Change Password",
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                      fontStyle: FontStyle.italic,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(height: 32.h),
                  CustomText(
                    text: "Enter Current Password",
                    color: Colors.white,
                  ),
                  SizedBox(height: 8.h),

                  Obx(
                    () => Customtextfield(
                      suffixIcon: IconButton(
                        icon: Icon(
                          isCurrentPasswordVisible.value
                              ? Icons.visibility_outlined
                              : Icons.visibility_off_outlined,
                          color: Colors.white70,
                        ),
                        onPressed: () {
                          isCurrentPasswordVisible.value =
                              !isCurrentPasswordVisible.value;
                        },
                      ),
                      controller: passwordController,
                      hintText: "Please Enter Current Password",
                      obscureText: !isCurrentPasswordVisible.value,
                      textInputType: TextInputType.visiblePassword,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Enter Current Password";
                        }
                        if (!AppString.passRegexp.hasMatch(value)) {
                          return "Invalid password";
                        }
                        return null;
                      },
                    ),
                  ),
                  SizedBox(height: 12.h),
                  CustomText(text: "Enter New Password", color: Colors.white),
                  SizedBox(height: 8.h),

                  Obx(
                    () => Customtextfield(
                      suffixIcon: IconButton(
                        icon: Icon(
                          isPasswordVisible.value
                              ? Icons.visibility_outlined
                              : Icons.visibility_off_outlined,
                          color: Colors.white70,
                        ),
                        onPressed: () {
                          isPasswordVisible.value = !isPasswordVisible.value;
                        },
                      ),
                      controller: passwordController,
                      hintText: "Please enter your New Password",
                      obscureText: !isPasswordVisible.value,
                      textInputType: TextInputType.visiblePassword,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Enter your New Password";
                        }
                        if (!AppString.passRegexp.hasMatch(value)) {
                          return "Invalid New Password";
                        }
                        return null;
                      },
                    ),
                  ),
                  SizedBox(height: 12.h),
                  CustomText(text: "Confirm New Password", color: Colors.white),
                  SizedBox(height: 8.h),

                  Obx(
                    () => Customtextfield(
                      suffixIcon: IconButton(
                        icon: Icon(
                          isComPasswordVisible.value
                              ? Icons.visibility_outlined
                              : Icons.visibility_off_outlined,
                          color: Colors.white70,
                        ),
                        onPressed: () {
                          isComPasswordVisible.value =
                              !isComPasswordVisible.value;
                        },
                      ),
                      controller: passwordController,
                      hintText: "Please Confirm Your New Password",
                      obscureText: !isComPasswordVisible.value,
                      textInputType: TextInputType.visiblePassword,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Enter Confirm Your New Password";
                        }
                        if (!AppString.passRegexp.hasMatch(value)) {
                          return "Invalid New Password";
                        }
                        return null;
                      },
                    ),
                  ),

                  SizedBox(height: 48.h),

                  CustomButton(
                    text: "Update",
                    onPressed: () {
                      //Get.toNamed(Routes.checkEmailScreen);
                      //if (_formkey.currentState!.validate()) {}
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../common_widgets/Custom_button.dart';
import '../../common_widgets/Custom_check_box.dart';
import '../../common_widgets/Custom_text.dart';
import '../../common_widgets/Custom_textField.dart';
import '../../core/routs/routs.dart';
import '../../utils/app_colors/app_colors.dart';
import '../../utils/app_const/app_const.dart';
import '../../utils/app_images/app_images.dart';

class RegisterScreen extends StatelessWidget {
  RegisterScreen({super.key});

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
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          backgroundColor: Colors.white.withOpacity(0.25),
          elevation: 0,
          toolbarHeight: 0,
          systemOverlayStyle: SystemUiOverlayStyle.light,
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.fromLTRB(20, 68, 20, 199),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 20.h),
                // Centered Logo (fixed)
                Center(
                  child: Container(
                    height: 238.h,
                    width: 238.w,
                    decoration: const BoxDecoration(shape: BoxShape.circle),
                    child: Image.asset(AppImages.app_logo),
                  ),
                ),
                SizedBox(height: 24.h),
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
                CustomText(text: "Email", color: Colors.white),
                SizedBox(height: 8.h),
                Customtextfield(
                  controller: emailController,
                  hintText: "Please enter your email address",
                  obscureText: false,
                  textInputType: TextInputType.emailAddress,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Enter your Email";
                    }
                    if (!AppString.emailRegexp.hasMatch(value)) {
                      return "Invalid Email";
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
                SizedBox(height: 12.h),
                CustomText(text: "Password", color: Colors.white),
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
                    hintText: "Please enter your password",
                    obscureText: !isPasswordVisible.value,
                    textInputType: TextInputType.visiblePassword,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Enter your Password";
                      }
                      if (!AppString.passRegexp.hasMatch(value)) {
                        return "Invalid password";
                      }
                      return null;
                    },
                  ),
                ),
                SizedBox(height: 12.h),
                CustomText(text: "Confirm Password", color: Colors.white),
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
                    hintText: "Please enter your Confirm Password",
                    obscureText: !isComPasswordVisible.value,
                    textInputType: TextInputType.visiblePassword,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Enter your Confirm Password";
                      }
                      if (!AppString.passRegexp.hasMatch(value)) {
                        return "Invalid Confirm Password";
                      }
                      return null;
                    },
                  ),
                ),

                SizedBox(height: 48.h),

                CustomButton(
                  text: "Sign Up",
                  onPressed: () {
                    Get.toNamed(Routes.checkEmailScreen);
                    //if (_formkey.currentState!.validate()) {}
                  },
                ),
                SizedBox(height: 16.h),
                Row(
                  children: [
                    CustomCheckbox(isChecked: true.obs),
                    Column(
                      children: [
                        CustomText(
                          text:
                              "By creating an account or signing you agree to our\nTerms and Conditions",
                          color: Colors.white,
                        ),
                      ],
                    ),
                  ],
                ),
                SizedBox(height: 32.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CustomText(
                      text: "Already have an account?",
                      color: Colors.white,
                      fontSize: 16,
                    ),
                    GestureDetector(
                      onTap: () {
                        Get.toNamed(Routes.loginScreen);
                      },
                      child: CustomText(
                        text: " Login",
                        color: AppColors.green100,
                        fontSize: 16,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
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

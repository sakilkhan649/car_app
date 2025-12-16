import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../common_widgets/Custom_button.dart';
import '../../common_widgets/Custom_check_box.dart';
import '../../common_widgets/Custom_text.dart';
import '../../common_widgets/Custom_textField.dart';
import '../../common_widgets/Custom_text_button.dart';
import '../../core/routs/routs.dart';
import '../../utils/app_colors/app_colors.dart';
import '../../utils/app_const/app_const.dart';
import '../../utils/app_images/app_images.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});

  final _formkey = GlobalKey<FormState>();

  final isPasswordVisible = false.obs;

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

                SizedBox(height: 20.h),

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        CustomCheckbox(isChecked: true.obs),
                        CustomText(text: "Remember Me ", color: Colors.white),
                      ],
                    ),
                    CustomTextButton(
                      buttonName: "Forget Password?",
                      onPressed: () {
                        Get.toNamed(Routes.forgetPasswordScreen);
                      },
                      color: AppColors.green100,
                    ),
                  ],
                ),

                SizedBox(height: 48.h),

                CustomButton(
                  text: "Log in",
                  onPressed: () {
                    Get.toNamed(Routes.mainHomeScreen);
                    //if (_formkey.currentState!.validate()) {}
                  },
                ),
                SizedBox(height: 24.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CustomText(
                      text: "Don't have an account?",
                      color: Colors.white,
                      fontSize: 16,
                    ),
                    InkWell(
                      onTap: () {
                        Get.toNamed(Routes.registerScreen);
                      },
                      child: CustomText(
                        text: " Register",
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

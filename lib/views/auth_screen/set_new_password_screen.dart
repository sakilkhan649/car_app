import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import '../../common_widgets/Custom_button.dart';
import '../../common_widgets/Custom_text.dart';
import '../../common_widgets/Custom_textField.dart';
import '../../core/routs/routs.dart';
import '../../utils/app_const/app_const.dart';
import '../../utils/app_icons/app_icons.dart';
import '../../widget/Custom_card_circle.dart';

class SetNewPasswordScreen extends StatelessWidget {
  SetNewPasswordScreen({super.key});

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
                SizedBox(height: 56.h),
                Center(child: CustomCircleIcon(iconPath: AppIcons.lockicon)),
                SizedBox(height: 16.h),

                Center(
                  child: CustomText(
                    text: "Set new password",
                    fontSize: 20,
                    fontWeight: FontWeight.w700,
                    fontStyle: FontStyle.italic,
                    color: Colors.white,
                  ),
                ),
                SizedBox(height: 24.h),
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

                SizedBox(height: 10.h),

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        SvgPicture.asset(
                          AppIcons.excalametoryicon,
                          height: 24,
                          width: 24,
                        ),
                        SizedBox(width: 8.w),
                        Column(
                          children: [
                            CustomText(
                              text:
                                  "Your password must be at least 8 characters.\n Include multiple words to make it more secure.",
                              color: Colors.white,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),

                SizedBox(height: 32.h),

                CustomButton(
                  text: "Continue",
                  onPressed: () {
                    Get.toNamed(Routes.mainHomeScreen);
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

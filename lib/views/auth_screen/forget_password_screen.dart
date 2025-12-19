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
import '../../widget/Custom_Back_button.dart';
import '../../widget/Custom_card_circle.dart';

class ForgetPasswordScreen extends StatelessWidget {
  ForgetPasswordScreen({super.key});

  final _formkey = GlobalKey<FormState>();

  final isPasswordVisible = false.obs;

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
            text: "Forget Password",
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
                SizedBox(height: 56.h),
                Center(child: CustomCircleIcon(iconPath: AppIcons.lockicon)),
                SizedBox(height: 16.h),
                Center(
                  child: CustomText(
                    text: "Forget password",
                    fontSize: 20,
                    fontWeight: FontWeight.w700,
                    fontStyle: FontStyle.italic,
                    color: Colors.white,
                  ),
                ),
                SizedBox(height: 24.h),
                CustomText(text: "Email", color: Colors.white),
                SizedBox(height: 8.h),
                Customtextfield(
                  controller: emailController,
                  hintText: "Enter Email Address",
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
                                  "You may receive notifications via email from us for\n security and login purposes. ",
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
                    Get.toNamed(Routes.forgetOtpScreen);
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

import 'package:car_app/utils/app_colors/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:pinput/pinput.dart';
import '../../common_widgets/Custom_button.dart';
import '../../common_widgets/Custom_text.dart';
import '../../core/routs/routs.dart';

class CheckEmailScreen extends StatelessWidget {
  CheckEmailScreen({super.key});

  final pinController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final defaultPinTheme = PinTheme(
      width: 40.w,
      height: 40.h,
      textStyle: TextStyle(fontSize: 22, color: Colors.black),
      decoration: BoxDecoration(
        color: AppColors.black100,
        borderRadius: BorderRadius.circular(4),
        border: Border.all(color: Colors.white),
      ),
    );

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white.withOpacity(0.25),
        elevation: 0,
        toolbarHeight: 0,
        systemOverlayStyle: SystemUiOverlayStyle.light,
      ),
      body: Center(
        child: SingleChildScrollView(
          padding: EdgeInsets.fromLTRB(22, 68, 22, 199),
          child: Form(
            key: _formKey,
            child: Container(
              margin: EdgeInsets.only(top: 40),
              width: double.infinity,
              child: Column(
                children: [
                  CustomText(
                    text: "Please check your email",
                    fontSize: 20,
                    fontWeight: FontWeight.w700,
                    fontStyle: FontStyle.italic,

                    color: Colors.white,
                  ),
                  SizedBox(height: 8.h),

                  CustomText(
                    text: "A six digits code has sanded to your email",
                  ),
                  SizedBox(height: 56.h),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: CustomText(
                      text: "Enter six digit code",
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(height: 12.h),

                  Pinput(
                    length: 6,
                    controller: pinController,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    defaultPinTheme: defaultPinTheme,
                    focusedPinTheme: defaultPinTheme.copyWith(
                      decoration: defaultPinTheme.decoration!.copyWith(
                        border: Border.all(color: Colors.white, width: 1),
                      ),
                    ),
                    submittedPinTheme: defaultPinTheme.copyWith(
                      decoration: defaultPinTheme.decoration!.copyWith(
                        color: AppColors.black100,
                        border: Border.all(color: Colors.white),
                      ),
                    ),
                    onCompleted: (pin) => debugPrint(pin),
                    validator: (value) {
                      // Null check
                      if (value == null || value.isEmpty) {
                        return 'Enter OTP';
                      }
                      // 6 digit check
                      if (value.length < 6) {
                        return 'Enter 6 digit OTP';
                      }
                      // Only number check
                      if (!RegExp(r'^[0-9]+$').hasMatch(value)) {
                        return 'Enter Only number';
                      }
                      return null;
                    },
                    // all field validation
                    forceErrorState: true,
                    errorTextStyle: TextStyle(color: Colors.red, fontSize: 14),
                  ),
                  SizedBox(height: 20.h),

                  CustomText(
                    text: "Code expires in: 02:59",
                    color: Colors.white,
                    fontSize: 16,
                  ),

                  SizedBox(height: 24.h),

                  CustomButton(
                    text: "Sign Up",
                    onPressed: () {
                      Get.toNamed(Routes.mainHomeScreen);
                      // if (_formKey.currentState!.validate()) {
                      //         // OTP Right
                      //         ScaffoldMessenger.of(context).showSnackBar(
                      //           SnackBar(
                      //             content: Text('OTP is Right! ✓'),
                      //             backgroundColor: Colors.green,
                      //             duration: Duration(seconds: 2),
                      //           ),
                      //         );
                      //         // Navigator.push(context, MaterialPageRoute(builder: (_) => NextPage()));
                      //       } else {
                      //         // OTP error message
                      //         ScaffoldMessenger.of(context).showSnackBar(
                      //           SnackBar(
                      //             content: Text('Please field all Text Fielded'),
                      //             backgroundColor: Colors.red,
                      //             duration: Duration(seconds: 2),
                      //           ),
                      //         );
                      //       }
                      //     }
                      // }
                    },
                  ),

                  SizedBox(height: 24.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CustomText(
                        text: "Don’t receive any code?",
                        color: Colors.white,
                        fontSize: 16,
                      ),
                      InkWell(
                        onTap: () {
                          Get.toNamed(Routes.registerScreen);
                        },
                        child: CustomText(
                          text: " Resend",
                          color: Colors.white,
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
      ),
    );
  }
}

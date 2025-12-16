import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../utils/app_colors/app_colors.dart';

class Customtextfield extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final bool obscureText;
  final TextInputType textInputType;
  final InputBorder? inputBorder;
  final String? Function(String?)? validator;
  final TextStyle? inputTextStyle;
  final EdgeInsetsGeometry? contentPadding;

  Customtextfield({
    super.key,
    this.inputTextStyle,
    this.inputBorder,
    required this.controller,
    required this.hintText,
    this.suffixIcon,
    required this.obscureText,
    required this.textInputType,
    this.validator,
    this.prefixIcon,
    this.contentPadding,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      style: inputTextStyle ?? TextStyle(color: Colors.white),
      cursorColor: Colors.white,
      validator: validator,
      controller: controller,
      keyboardType: textInputType,
      obscureText: obscureText,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.white, width: 1.5),
          borderRadius: BorderRadius.all(Radius.circular(12.r)),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.white, width: 1.5),
          borderRadius: BorderRadius.all(Radius.circular(12.r)),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.white, width: 2),
          borderRadius: BorderRadius.all(Radius.circular(12.r)),
        ),
        errorBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.red, width: 1.5),
          borderRadius: BorderRadius.all(Radius.circular(12.r)),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.red, width: 2),
          borderRadius: BorderRadius.all(Radius.circular(12.r)),
        ),
        hintText: hintText,
        filled: true,
        fillColor: AppColors.black200,
        hintStyle: TextStyle(color: Colors.grey),
        suffixIcon: suffixIcon,
        prefixIcon: prefixIcon,
        errorStyle: TextStyle(color: Colors.red, fontSize: 12.sp),
        contentPadding:
            contentPadding ??
            EdgeInsets.symmetric(horizontal: 10.w, vertical: 15.h),
      ),
    );
  }
}

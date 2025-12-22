import 'package:car_app/common_widgets/Custom_textField.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../../widget/CustomTexth.dart';
import 'controller/stepercontroller.dart';

class UplodeScreen extends StatelessWidget {
  UplodeScreen({super.key});

  final StepController c = Get.find<StepController>();

  final TextEditingController controllerOne = TextEditingController();
  final bool _inisialColor = true;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.fromLTRB(20.w, 24.w, 20.w, 50.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            /// Product Name
            CustomTexth(text: "Product Name"),
            SizedBox(height: 8.h),
            Customtextfield(
              controller: controllerOne,
              hintText: "Please enter product name",
              obscureText: false,
              textInputType: TextInputType.name,
            ),

            SizedBox(height: 12.h),

            /// Category
            CustomTexth(text: "Category"),
            SizedBox(height: 8.h),
            Customtextfield(
              controller: controllerOne,
              hintText: "Select product category",
              obscureText: false,
              textInputType: TextInputType.name,
              suffixIcon: const Icon(
                Icons.arrow_downward_outlined,
                color: Colors.white,
              ),
            ),

            SizedBox(height: 12.h),

            /// Brand
            CustomTexth(text: "Brand"),
            SizedBox(height: 8.h),
            Customtextfield(
              controller: controllerOne,
              hintText: "Please enter Brand",
              obscureText: false,
              textInputType: TextInputType.name,
            ),

            SizedBox(height: 12.h),

            /// Chassis Number
            CustomTexth(text: "Chassis Number"),
            SizedBox(height: 8.h),
            Customtextfield(
              controller: controllerOne,
              hintText: "Please enter Chassis Number",
              obscureText: false,
              textInputType: TextInputType.name,
            ),

            SizedBox(height: 12.h),

            /// Price
            CustomTexth(text: "Price"),
            SizedBox(height: 8.h),
            Customtextfield(
              controller: controllerOne,
              hintText: "Please enter Price",
              obscureText: false,
              textInputType: TextInputType.number,
            ),

            SizedBox(height: 12.h),

            /// Product Condition
            CustomTexth(text: "Product Condition"),
            SizedBox(height: 8.h),
            Customtextfield(
              controller: controllerOne,
              hintText: "Enter Product Condition",
              obscureText: false,
              textInputType: TextInputType.name,
            ),

            SizedBox(height: 24.h),

            /// Back / Continue Buttons
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                InkWell(
                  onTap: () {
                    c.prevStep(); // ✅ stepper back
                  },
                  child: Row(
                    children: [
                      Icon(
                        Icons.arrow_back_ios,
                        color: _inisialColor ? Colors.white : Colors.white70,
                        size: 16,
                      ),
                      CustomTexth(
                        text: "Back",
                        color: _inisialColor ? Colors.white : Colors.white70,
                      ),
                    ],
                  ),
                ),
                InkWell(
                  onTap: () {
                    c.nextStep(); // ✅ stepper next
                  },
                  child: Row(
                    children: [
                      CustomTexth(text: "Continue"),
                      const SizedBox(width: 4),
                      const Icon(
                        Icons.arrow_forward_ios,
                        color: Colors.white,
                        size: 16,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../../../common_widgets/Custom_button.dart';
import '../../../../../utils/app_icons/app_icons.dart';
import '../../../../../widget/CustomTexth.dart';
import '../controller/stepercontroller.dart';
import 'add_new_category/add_new_category.dart';
import 'widget/uplodebox.dart';

class MyProductScreen extends StatelessWidget {
  MyProductScreen({super.key});

  final StepController c = Get.find<StepController>();
  final _inisialColor = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.fromLTRB(20.w, 24.w, 20.w, 50.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 20.h),
            CustomTexth(text: "Main Picture Upload"),
            SizedBox(height: 8.h),

            /// Upload box for main picture
            UploadBox(
              iconPath: AppIcons.magnifyingGlass,
              highlightText: "Click here",
              normalText: " to upload or drop media here",
              onTap: () {
                print("Main Upload tapped");
              },
            ),

            SizedBox(height: 32.h),
            CustomTexth(text: "Sub Picture Upload"),
            SizedBox(height: 8.h),

            /// Upload box for sub picture
            UploadBox(
              iconPath: AppIcons.magnifyingGlass,
              highlightText: "Click here",
              normalText: " to upload or drop media here",
              onTap: () {
                print("Sub Upload tapped");
              },
            ),

            SizedBox(height: 20.h),

            /// Back and Finish Buttons
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                InkWell(
                  onTap: () {
                    c.prevStep(); // ✅ Go to previous step
                  },
                  child: Row(
                    children: [
                      Icon(
                        Icons.arrow_back_ios,
                        color: _inisialColor ? Colors.white : Colors.white70,
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
                    Get.snackbar("Success", "Product Uploaded Successfully ✅");
                  },
                  child: Row(
                    children: const [
                      CustomTexth(text: "Finish"),
                      SizedBox(width: 4),
                      Icon(Icons.check, color: Colors.white),
                    ],
                  ),
                ),
              ],
            ),

            SizedBox(height: 32.h),

            /// Optional update button
            CustomButton(
              text: "Update",
              onPressed: () {
                Get.to(() => AddNewCategory());
              },
            ),
          ],
        ),
      ),
    );
  }
}

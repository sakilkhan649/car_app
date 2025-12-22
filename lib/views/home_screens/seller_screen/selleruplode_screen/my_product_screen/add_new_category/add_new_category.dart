import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../../common_widgets/Custom_button.dart';
import '../../../../../../common_widgets/Custom_text.dart';
import '../../../../../../common_widgets/Custom_textField.dart';
import '../../../../../../widget/CustomTexth.dart';
import '../../../../../../widget/Custom_Back_button.dart';


class AddNewCategory extends StatelessWidget {
  AddNewCategory({super.key});

  final TextEditingController controllerOne = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: CustomBackButton(),
        title: CustomText(
          text: "Add New Category",
          fontSize: 20,
          fontWeight: FontWeight.w600,
          fontStyle: FontStyle.italic,
          color: Colors.white,
        ),
      ),
      body: Padding(
        padding: EdgeInsets.fromLTRB(20.w, 24.w, 20.w, 50.w),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomTexth(text: "Category Name "),
            SizedBox(height: 8.h),
            Customtextfield(
              controller: controllerOne,
              hintText: "Please enter Category Name ",
              obscureText: false,
              textInputType: TextInputType.name,
            ),
            SizedBox(height: 12.h),
            CustomTexth(text: "Reason"),
            SizedBox(height: 8.h),
            Customtextfield(
              controller: controllerOne,
              hintText: "Please enter Reason",
              obscureText: false,
              textInputType: TextInputType.name,
            ),
            SizedBox(height: 32.h),
            CustomButton(
              text: "Submit",
              onPressed: () {
                // Get.toNamed(Routes.addNewCategory);
              },
            ),
          ],
        ),
      ),
    );
  }
}

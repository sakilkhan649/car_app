import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../../../widget/CustomTexth.dart';
import '../controller/stepercontroller.dart';


class AddCategoryScreen extends StatelessWidget {
  AddCategoryScreen({super.key});

  final TextEditingController controllerOne = TextEditingController();
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

            /// Title
            CustomTexth(text: "Product Description"),
            SizedBox(height: 8.h),

            /// Description Field
            TextField(
              controller: controllerOne,
              maxLines: 5,
              style: const TextStyle(color: Colors.white),
              decoration: InputDecoration(
                hintText: 'Enter product description',
                hintStyle: TextStyle(color: Colors.grey.shade400),
                filled: true,
                fillColor: const Color(0xFF2A2A2A), // dark background
                contentPadding: const EdgeInsets.all(12),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: const BorderSide(color: Colors.white70),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: const BorderSide(color: Colors.white),
                ),
              ),
            ),

            SizedBox(height: 20.h),

            /// Back & Continue Buttons (Stepper functional)
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
                    c.nextStep(); // ✅ Go to next step
                  },
                  child: Row(
                    children: const [
                      CustomTexth(text: "Continue"),
                      SizedBox(width: 4),
                      Icon(Icons.arrow_forward_ios, color: Colors.white, size: 16),
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

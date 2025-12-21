import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../common_widgets/Custom_text.dart';
import '../../../../../widget/Custom_Back_button.dart';
import '../../my_product_screen/my_product_screen.dart';
import '../controller/stepercontroller.dart';
import 'package:car_app/views/home_screens/seller_screen/add_category_screen/add_category_screen.dart';
import 'package:car_app/views/home_screens/seller_screen/uplode_screen/uplode_screen.dart';

class MainuplodeScreen extends StatelessWidget {
  MainuplodeScreen({super.key});

  final StepController c = Get.put(StepController());

  final List<Widget> steps = const [
    UplodeScreen(),
    AddCategoryScreen(),
    MyProductScreen(),
  ];

  final List<String> titles = const [
    "Product Details",
    "Product Description",
    "Upload Picture",
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          leading: CustomBackButton(),
          title: CustomText(
            text: "Upload Product",
            fontSize: 20,
            fontWeight: FontWeight.w600,
            fontStyle: FontStyle.italic,
            color: Colors.white,
          ),
        ),
        backgroundColor: const Color(0xFF121212),
        body: Obx(
              () => Column(
            children: [
              const SizedBox(height: 24),
              _buildStepper(c.currentStep.value),
              Expanded(child: steps[c.currentStep.value]),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildStepper(int currentStep) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Stack(
        alignment: Alignment.center,
        children: [
          // Full gray line (behind)
          Positioned(
            left: 1,
            right: 1,
            top: 16,
            child: Container(
              height: 3,
              color: Colors.grey.shade700, // ✅ Updated gray
            ),
          ),
          // Green progress line (only till current step)
          Positioned(
            left: 2,
            right: 1 + (110.0 * (titles.length - currentStep - 0)),
            top: 16,
            child: Container(
              height: 3,
              color: const Color(0xFF4CAF50), // ✅ Updated green
            ),
          ),
          // Step circles and labels
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: List.generate(titles.length, (index) {
              final isActive = index <= currentStep;
              return Column(
                children: [
                  CircleAvatar(
                    radius: 16,
                    backgroundColor: isActive
                        ? const Color(0xFF4CAF50)
                        : Colors.grey,
                    child: Text(
                      '${index + 1}',
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  const SizedBox(height: 4),
                  SizedBox(
                    width: 80,
                    child: Text(
                      titles[index],
                      style: TextStyle(
                        fontSize: 11,
                        fontWeight: FontWeight.w600,
                        color: isActive
                            ? const Color(0xFF4CAF50)
                            : Colors.white,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ],
              );
            }),
          ),
        ],
      ),
    );
  }
}
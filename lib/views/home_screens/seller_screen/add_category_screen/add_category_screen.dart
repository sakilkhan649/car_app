import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../uplode_screen/controller/stepercontroller.dart';

class AddCategoryScreen extends StatelessWidget {
  const AddCategoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final StepController controller = Get.find();

    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          TextField(
            decoration: const InputDecoration(
              hintText: "Enter category name",
              filled: true,
              fillColor: Color(0xFF1E1E1E),
              border: OutlineInputBorder(),
            ),
          ),
          const SizedBox(height: 12),
          TextField(
            decoration: const InputDecoration(
              hintText: "Enter reason",
              filled: true,
              fillColor: Color(0xFF1E1E1E),
              border: OutlineInputBorder(),
            ),
          ),
          const Spacer(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              TextButton(
                onPressed: controller.prevStep,
                child: const Text("< Back"),
              ),
              ElevatedButton(
                onPressed: controller.nextStep,
                child: const Text("Continue >"),
              ),
            ],
          )
        ],
      ),
    );
  }
}

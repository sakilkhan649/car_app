import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'controller/stepercontroller.dart';

class UplodeScreen extends StatelessWidget {
  const UplodeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final StepController controller = Get.find();

    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          _input("Product Name"),
          _input("Category"),
          _input("Brand"),
          _input("Chassis Number"),
          _input("Price"),
          _input("Product Condition"),
          const Spacer(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const SizedBox(), // No back on first screen
              ElevatedButton(
                onPressed: controller.nextStep,
                child: const Text("Continue >"),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _input(String label) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label),
        const SizedBox(height: 4),
        TextField(
          decoration: InputDecoration(
            hintText: "Enter $label",
            filled: true,
            fillColor: Colors.grey[900],
            border: const OutlineInputBorder(),
          ),
        ),
        const SizedBox(height: 12),
      ],
    );
  }
}

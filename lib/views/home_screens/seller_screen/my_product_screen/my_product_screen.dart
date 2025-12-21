import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../uplode_screen/controller/stepercontroller.dart';

class MyProductScreen extends StatelessWidget {
  const MyProductScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final StepController controller = Get.find();

    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          const Text(
            "Upload Complete!",
            style: TextStyle(fontSize: 18, color: Colors.white),
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
                onPressed: () {
                  Get.snackbar("Done", "Product uploaded successfully!");
                  // Optionally reset:
                  controller.goToStep(0);
                },
                child: const Text("Finish"),
              ),
            ],
          )
        ],
      ),
    );
  }
}

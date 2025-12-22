import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomCheckbox extends StatelessWidget {
  final RxBool isChecked;
  final Color borderColor;
  final Color activeColor;
  final Color checkColor;
  final double borderWidth;
  final Function(bool)? onChanged;

  const CustomCheckbox({
    Key? key,
    required this.isChecked,
    this.borderColor = Colors.orangeAccent,
    this.activeColor = Colors.orangeAccent,
    this.checkColor = Colors.black,
    this.borderWidth = 1.0,
    this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(
          () => Checkbox(
        value: isChecked.value,
        onChanged: (bool? value) {
          if (value != null) {
            isChecked.value = value;
            onChanged?.call(value);
          }
        },
        side: BorderSide(color: borderColor, width: borderWidth),
        activeColor: activeColor,
        checkColor: checkColor,
      ),
    );
  }
}
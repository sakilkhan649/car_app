import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CategoryChip extends StatelessWidget {
  final String label;
  final bool isselected;


  const CategoryChip({super.key, required this.label, required this.isselected});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(4),
      padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20.r),
        color: isselected ? Color(0xFFFE9100) : Colors.transparent,
        border: isselected
            ? Border.all(color: const Color(0xFFFFFFFF), width: 1)
            : null,
        boxShadow: [
          BoxShadow(
            blurRadius: 0,
            offset: const Offset(-1, 0),
            spreadRadius: 0,
            color: Colors.white54,
          ),
          BoxShadow(
            blurRadius: 2,
            offset: const Offset(1, 1),
            spreadRadius: 0,
            color: const Color(0xFF5B5B5B),
          ),
          BoxShadow(
            blurRadius: 0,
            offset: const Offset(2, 2),
            spreadRadius: 0,
            color: const Color(0xFF5B5B5B),
          ),
        ],
      ),
      alignment: Alignment.center,
      child: Text(
        label,
        style: TextStyle(
          color: isselected ? Colors.black : Colors.white,
          fontWeight: FontWeight.w500,
          fontSize: 14,
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../utils/app_icons/app_icons.dart';

class BottomNavBarwidget extends StatelessWidget {
  const BottomNavBarwidget({super.key, required this.screenWidth});

  final double screenWidth;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: 0,
      right: 0,
      bottom: 20.h, // slightly above bottom edge (floating look)
      child: Center(

      ),
    );
  }
}

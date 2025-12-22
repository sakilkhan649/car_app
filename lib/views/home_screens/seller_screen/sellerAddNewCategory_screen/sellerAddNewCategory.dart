import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../common_widgets/Custom_text.dart';
import '../../../../widget/Custom_Back_button.dart';

class Selleraddnewcategory extends StatelessWidget {
  const Selleraddnewcategory({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: CustomBackButton(),
        title: CustomText(
          text: "Product Details",
          fontSize: 20,
          fontWeight: FontWeight.w600,
          fontStyle: FontStyle.italic,
          color: Colors.white,
        ),
      ),
      body: Padding(
        padding: EdgeInsets.fromLTRB(20.w, 24.w, 20.w, 50.w),
        child: Column(
          children: [

          ],
        ),
      ),
    );
  }
}

import 'package:car_app/views/home_screens/products_screen/widget/searchbarwithfilter.dart';
import 'package:car_app/widget/Custom_text_italic.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../utils/app_icons/app_icons.dart';

class ProductsScreen extends StatelessWidget {
  ProductsScreen({super.key});

  final searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: CustomTextItalic(text: "Products"),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.fromLTRB(20.w, 24.w, 20.w, 50.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SearchBarWithFilter(
                controller: searchController,
                filterIconPath: AppIcons.filtericon,
                onFilterTap: () {
                  // TODO: Add filter modal or navigation
                },
              ),

              SizedBox(height: 20.h),

            ],
          ),
        ),
      ),
    );
  }
}

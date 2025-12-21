import 'package:car_app/common_widgets/Custom_text.dart';
import 'package:car_app/utils/app_icons/app_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../widget/Custom_searchbar.dart';
import '../../../widget/Custom_text_italic.dart';
import 'model/categorimodel.dart';

class CategoryScreen extends StatefulWidget {
  CategoryScreen({super.key});

  @override
  State<CategoryScreen> createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen> {
  final searchController = TextEditingController();

  List<CategoryItem> categories = [
    CategoryItem(title: "Engine Parts", icon: Icons.settings),
    CategoryItem(title: "Break", icon: Icons.shield),
    CategoryItem(title: "Electric", icon: Icons.flash_on),
    CategoryItem(title: "Suspension", icon: Icons.directions_car),
    CategoryItem(title: "Transmission", icon: Icons.sync_alt),
    CategoryItem(title: "Fuel System", icon: Icons.local_gas_station),
    CategoryItem(title: "Engine Parts", icon: Icons.settings),
    CategoryItem(title: "Break", icon: Icons.shield),
    CategoryItem(title: "Electric", icon: Icons.flash_on),
    CategoryItem(title: "Suspension", icon: Icons.directions_car),
    CategoryItem(title: "Transmission", icon: Icons.sync_alt),
    CategoryItem(title: "Fuel System", icon: Icons.local_gas_station),
  ];

  // store selected indices
  List<int> selectedIndices = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: CustomTextItalic(text: "Categories"),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.fromLTRB(20.w, 24.w, 20.w, 50.w),
          child: Column(
            children: [
              CustomSearchBar(
                controller: searchController,
                onChanged: (value) {},
              ),
              SizedBox(height: 24.h),
              GridView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: categories.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 13.h,
                  crossAxisSpacing: 13.w,
                  childAspectRatio: 1.6,
                ),
                itemBuilder: (context, index) {
                  final category = categories[index];
                  return GestureDetector(
                    onTap: () {},
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.grey.shade700,
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(color: Color(0xFFE7BE00), width: 1),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            padding: EdgeInsets.all(9),
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border: Border.all(
                                color: Color(0xFFB4DCAB),
                                width: 1,
                              ),
                            ),
                            child: Icon(
                              category.icon,
                              size: 36,
                              color: Color(0xFF5BB349),
                            ),
                          ),
                          SizedBox(height: 10.h),
                          Text(
                            category.title,
                            textAlign: TextAlign.center,
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

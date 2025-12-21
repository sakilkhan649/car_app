import 'package:car_app/common_widgets/Custom_text.dart';
import 'package:car_app/utils/app_colors/app_colors.dart';
import 'package:car_app/widget/Custom_text_italic.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../controller/filtercontroller.dart';

class FilterDrawer extends StatelessWidget {
  FilterDrawer({super.key});

  final controller = Get.put(FilterController());

  @override
  Widget build(BuildContext context) {
    final double drawerWidth = MediaQuery.of(context).size.width * 0.85;
    return SizedBox(
      width: drawerWidth,
      child: Drawer(
        backgroundColor: AppColors.black100,
        shape: const RoundedRectangleBorder(borderRadius: BorderRadius.zero),
        clipBehavior: Clip.none,
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 34, vertical: 35),
            child: Column(
              children: [
                // Header
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CustomTextItalic(text: "Filter"),
                    IconButton(
                      icon: const Icon(Icons.close, color: Colors.white),
                      onPressed: () => Get.back(),
                    ),
                  ],
                ),

                SizedBox(height: 10.h),

                // Filter list
                Expanded(
                  child: ListView(
                    children: [
                      _buildExpandable("Category", controller.categories),
                      _buildPriceRange(),
                      _buildExpandable("Condition", controller.conditions),
                      _buildLocationSection(),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  /// Build checkbox section
  Widget _buildExpandable(String title, Map<String, RxBool> items) {
    return Obx(() {
      bool isExpanded = controller.expanded[title]!.value;

      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ExpansionTile(
            title: Text(
              title,
              style: const TextStyle(
                color: Colors.white,
                fontStyle: FontStyle.italic,
                fontWeight: FontWeight.w600,
                fontSize: 18,
              ),
            ),
            iconColor: Colors.white,
            collapsedIconColor: Colors.white,
            initiallyExpanded: isExpanded,

            onExpansionChanged: (val) =>
                controller.expanded[title]!.value = val,
            children: items.entries.map((e) {
              return CheckboxListTile(
                controlAffinity: ListTileControlAffinity.leading,
                title: Text(
                  e.key,
                  style: const TextStyle(color: Colors.white, fontSize: 16),
                ),
                side: const BorderSide(color: Colors.white),
                value: e.value.value,
                onChanged: (val) => e.value.value = val!,
                activeColor: Colors.white,
                checkColor: Colors.black,
              );
            }).toList(),
          ),
        ],
      );
    });
  }

  /// Build price range
  Widget _buildPriceRange() {
    return Obx(() {
      bool isExpanded = controller.expanded['Price Range']!.value;
      final range = controller.priceRange.value;

      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ExpansionTile(
            title: const Text(
              "Price Range",
              style: TextStyle(
                color: Colors.white,
                fontStyle: FontStyle.italic,
                fontWeight: FontWeight.w600,
                fontSize: 18,
              ),
            ),
            iconColor: Colors.white,
            collapsedIconColor: Colors.white,
            initiallyExpanded: isExpanded,
            onExpansionChanged: (val) =>
                controller.expanded['Price Range']!.value = val,
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 8.w),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "\$${range.start.toInt()}",
                      style: const TextStyle(color: Colors.white, fontSize: 16),
                    ),
                    Text(
                      "\$${range.end.toInt()}",
                      style: const TextStyle(color: Colors.white, fontSize: 16),
                    ),
                  ],
                ),
              ),
              SliderTheme(
                data: SliderThemeData(
                  trackHeight: 10.h,
                  inactiveTrackColor: const Color(0xFF0B0B1B), // dark base
                  activeTrackColor: const Color(0xFF0B0B1B), // dark base
                  thumbColor: Colors.white,
                  overlayColor: Colors.white.withOpacity(0.1),
                  rangeThumbShape: const RoundRangeSliderThumbShape(
                    enabledThumbRadius: 12,
                  ),
                  overlayShape: const RoundSliderOverlayShape(
                    overlayRadius: 20,
                  ),
                  trackShape: const RoundedRectSliderTrackShape(),
                ),
                child: RangeSlider(
                  values: range,
                  min: 50,
                  max: 100000,
                  divisions: 100,
                  onChanged: (val) => controller.priceRange.value = val,
                ),
              ),
            ],
          ),
        ],
      );
    });
  }

  /// Build location section
  Widget _buildLocationSection() {
    return Obx(() {
      bool isExpanded = controller.expanded['Location']!.value;

      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ExpansionTile(
            title: const Text(
              "Location",
              style: TextStyle(
                color: Colors.white,
                fontStyle: FontStyle.italic,
                fontWeight: FontWeight.w600,
                fontSize: 18,
              ),
            ),
            iconColor: Colors.white,
            collapsedIconColor: Colors.white,
            initiallyExpanded: isExpanded,
            onExpansionChanged: (val) =>
                controller.expanded['Location']!.value = val,
            children: [
              CheckboxListTile(
                controlAffinity: ListTileControlAffinity.leading,
                title: const Text(
                  "Filter By Location",
                  style: TextStyle(color: Colors.white, fontSize: 16),
                ),
                value: controller.useLocation.value,
                onChanged: (val) => controller.useLocation.value = val!,
                activeColor: Colors.white,
                checkColor: Colors.black,
              ),

              SizedBox(height: 10.h),
              _buildInput(
                initial: controller.locationText.value,
                hint: "Location Set",
                icon: Icons.location_on,
                onChanged: (val) => controller.locationText.value = val,
              ),
              SizedBox(height: 10.h),
              Align(
                alignment: Alignment.centerLeft,
                child: CustomText(text: "Distance (Km)", color: Colors.white),
              ),
              SizedBox(height: 8),
              _buildInput(
                initial: controller.distanceKm.value,
                hint: "Distance (Km)",
                keyboard: TextInputType.number,
                onChanged: (val) => controller.distanceKm.value = val,
              ),
              SizedBox(height: 50),
            ],
          ),
        ],
      );
    });
  }

  /// Build input field
  Widget _buildInput({
    required String initial,
    required String hint,
    IconData? icon,
    TextInputType keyboard = TextInputType.text,
    required Function(String) onChanged,
  }) {
    final controller = TextEditingController(text: initial);
    return TextField(
      controller: controller,
      onChanged: onChanged,
      keyboardType: keyboard,
      style: const TextStyle(color: Colors.white),
      decoration: InputDecoration(
        hintText: hint,
        hintStyle: const TextStyle(color: Colors.white),
        prefixIcon: icon != null ? Icon(icon, color: Colors.white) : null,
        filled: true,
        fillColor: Colors.grey.shade900,
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(12.r)),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.white),
          borderRadius: BorderRadius.circular(12.r),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.white),
          borderRadius: BorderRadius.circular(12.r),
        ),
      ),
    );
  }
}

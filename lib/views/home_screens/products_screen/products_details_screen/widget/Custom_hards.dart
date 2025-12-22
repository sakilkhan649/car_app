import 'package:car_app/views/home_screens/products_screen/products_details_screen/widget/ratingdaialog.dart';
import 'package:car_app/views/home_screens/products_screen/products_details_screen/widget/reportdailog.dart';
import 'package:flutter/material.dart';

class IconBoxRow extends StatelessWidget {
  const IconBoxRow({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        _buildIconBox(
          icon: Icons.report_outlined, // exclamation/stop
          borderColor: Colors.red,
          iconColor: Colors.red,
          onTap: () {
            showDialog(
              context: context,
              builder: (_) => const SimpleReportDialog(),
            );
          },
        ),
        const SizedBox(width: 16),
        _buildIconBox(
          icon: Icons.star_border,
          borderColor: Colors.yellow,
          iconColor: Colors.yellow,
          onTap: () {
            showDialog(context: context, builder: (_) => RatingDialogGetX());
          },
        ),
        const SizedBox(width: 16),
        _buildIconBox(
          icon: Icons.favorite_border,
          borderColor: Colors.green,
          iconColor: Colors.green,
          onTap: () {
            // Get.toNamed(Routes.sellerScreen);
          },
        ),
      ],
    );
  }

  Widget _buildIconBox({
    required IconData icon,
    required Color borderColor,
    required Color iconColor,
    required VoidCallback onTap,
  }) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          border: Border.all(color: borderColor, width: 2),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Icon(icon, color: iconColor),
      ),
    );
  }
}

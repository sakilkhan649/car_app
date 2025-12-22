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
        ),
        const SizedBox(width: 16),
        _buildIconBox(
          icon: Icons.star_border,
          borderColor: Colors.yellow,
          iconColor: Colors.yellow,
        ),
        const SizedBox(width: 16),
        _buildIconBox(
          icon: Icons.favorite_border,
          borderColor: Colors.green,
          iconColor: Colors.green,
        ),
      ],
    );
  }

  Widget _buildIconBox({
    required IconData icon,
    required Color borderColor,
    required Color iconColor,
  }) {
    return Container(
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        border: Border.all(color: borderColor, width: 2),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Icon(icon, color: iconColor),
    );
  }
}

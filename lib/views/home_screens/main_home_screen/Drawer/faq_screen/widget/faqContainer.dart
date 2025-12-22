import 'package:flutter/material.dart';

import '../../../../../../common_widgets/Custom_text.dart';
import '../../../../../../widget/CustomTexth.dart';

class FAQItem extends StatelessWidget {
  final String question;
  final Widget icon; // ✅ Now accepts any widget

  const FAQItem({
    super.key,
    required this.question,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80,
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
      decoration: BoxDecoration(
        color: Color(0xFF212121),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(width: 1, color: Colors.grey),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Header Row
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CustomTexth(text: question),
              icon,
            ],
          ),


        ],
      ),
    );
  }
}

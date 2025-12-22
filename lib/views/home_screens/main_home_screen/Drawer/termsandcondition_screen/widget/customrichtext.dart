import 'package:flutter/material.dart';

class CustomRichTextBlock extends StatelessWidget {
  final String normalText1;
  final String highlightedText;
  final String normalText2;
  final Color highlightedColor; // ✅ dynamic color

  const CustomRichTextBlock({
    super.key,
    required this.normalText1,
    required this.highlightedText,
    required this.normalText2,
    this.highlightedColor = Colors.amber, // ✅ default fallback
  });

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        style: const TextStyle(
          color: Colors.white,
          fontSize: 14,
          height: 1.5,
        ),
        children: [
          TextSpan(text: normalText1),
          TextSpan(
            text: highlightedText,
            style: TextStyle(
              color: highlightedColor,
              fontWeight: FontWeight.bold,
            ),
          ),
          TextSpan(text: normalText2),
        ],
      ),
    );
  }
}

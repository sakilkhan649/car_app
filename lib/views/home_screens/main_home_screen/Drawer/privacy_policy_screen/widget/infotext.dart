import 'package:flutter/material.dart';

class InfoBlock extends StatelessWidget {
  final String content;
  final EdgeInsetsGeometry padding;
  final TextStyle? textStyle;

  const InfoBlock({
    super.key,
    required this.content,
    this.padding = const EdgeInsets.all(16),
    this.textStyle,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: padding,
      child: Text(
        content,
        style:
            textStyle ??
            const TextStyle(color: Colors.white70, fontSize: 14, height: 1.6),
      ),
    );
  }
}

import 'package:flutter/material.dart';

class DoubleBorderCircleButton extends StatelessWidget {
  final VoidCallback onTap;
  final IconData icon;
  final Color borderColor;
  final Color innerColor;
  final double size;
  final double innerSize;
  final double offset;

  const DoubleBorderCircleButton({
    super.key,
    required this.onTap,
    this.icon = Icons.arrow_back_ios_new,
    this.borderColor = const Color(0xFF5BB349),
    this.innerColor = const Color(0x55000000),
    this.size = 57,
    this.innerSize = 48,
    this.offset = 5,
  });

  @override
  Widget build(BuildContext context) {
    Widget circle({
      required double size,
      required double left,
      required double right,
      Color? color,
      Widget? child,
    }) {
      return Positioned(
        top: 0,
        bottom: 0,
        left: left,
        right: right,
        child: Container(
          height: size,
          width: size,
          decoration: BoxDecoration(
            color: color,
            shape: BoxShape.circle,
            border: Border.all(color: borderColor, width: 1),
          ),
          child: child,
        ),
      );
    }

    return SizedBox(
      height: size,
      width: size,
      child: Stack(
        alignment: Alignment.center,
        children: [
          circle(size: size, left: offset, right: 0),
          circle(
            size: innerSize,
            left: 0,
            right: offset,
            color: innerColor,
            child: IconButton(
              icon: Icon(icon, size: 18, color: borderColor),
              onPressed: onTap,
            ),
          ),
        ],
      ),
    );
  }
}

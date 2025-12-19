import 'package:flutter/material.dart';

class Itemicon extends StatelessWidget {
  Itemicon({super.key});

  static const LinearGradient greenGradient = LinearGradient(
    colors: [Color(0xFF5BB349), Color(0xFF5BB349), Color(0xFFB2FFA2)],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 34,
      height: 34,
      padding: const EdgeInsets.all(1.5), // border thickness
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(
          width: 1,
          color: Color(0xFF5BB349),
        ), // simulate gradient border
      ),
      child: Container(
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: Colors.black.withOpacity(0.25), // glass-like fill
        ),
        child: Center(
          child: ShaderMask(
            shaderCallback: (bounds) => greenGradient.createShader(bounds),
            child: const Icon(
              Icons.arrow_outward,
              size: 18,
              color: Colors.white, // masked by ShaderMask
            ),
          ),
        ),
      ),
    );
  }
}

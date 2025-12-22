import 'package:flutter/material.dart';

class ProductItemCard extends StatelessWidget {
  final String title;
  final String status;
  final String price;
  final String imagePath;
  final VoidCallback onTap;

  final Color? titleColor;
  final List<Color>? statusGradientColors;
  final List<Color>? priceGradientColors;

  const ProductItemCard({
    super.key,
    required this.title,
    required this.status,
    required this.price,
    required this.imagePath,
    required this.onTap,
    this.titleColor,
    this.statusGradientColors,
    this.priceGradientColors,
  });

  @override
  Widget build(BuildContext context) {
    final List<Color> defaultStatusGradient = [
      const Color(0xFFFF0000),
      const Color(0xFFFF0000),
      const Color(0xFFFFB5B5),
    ];

    final List<Color> defaultPriceGradient = [
      const Color(0xFF5BB349),
      const Color(0xFF5BB349),
      const Color(0xFFB2FFA2),
    ];

    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 270,
        width: 195,
        padding: const EdgeInsets.all(14),
        decoration: BoxDecoration(
          color: const Color(0xFF212121),
          borderRadius: BorderRadius.circular(24),
          border: Border.all(color: Colors.white70),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            /// Title
            Text(
              title,
              style: TextStyle(
                color: titleColor ?? Colors.white70,
                fontSize: 10,
                fontWeight: FontWeight.w500,
              ),
            ),

            /// Status with gradient
            ShaderMask(
              shaderCallback: (bounds) => LinearGradient(
                colors: statusGradientColors ?? defaultStatusGradient,
              ).createShader(Rect.fromLTWH(0, 0, bounds.width, bounds.height)),
              child: Text(
                status,
                style: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  color: Colors.white,
                ),
              ),
            ),

            /// Image
            const SizedBox(height: 8),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Colors.black.withOpacity(0.4),
                border: Border.all(color: Colors.black.withOpacity(0.5)),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Image.asset(
                  imagePath,
                  fit: BoxFit.contain,
                  width: double.infinity,
                ),
              ),
            ),

            const SizedBox(height: 10),

            /// Price + Icon
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                /// Price Section
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "Price",
                      style: TextStyle(
                        color: Colors.white70,
                        fontSize: 10,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    ShaderMask(
                      shaderCallback: (bounds) =>
                          LinearGradient(
                            colors: priceGradientColors ?? defaultPriceGradient,
                          ).createShader(
                            Rect.fromLTWH(0, 0, bounds.width, bounds.height),
                          ),
                      child: Text(
                        price,
                        style: const TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ],
                ),

                /// Arrow Icon
                Container(
                  width: 34,
                  height: 34,
                  padding: const EdgeInsets.all(1.5),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(
                      width: 1,
                      color: (priceGradientColors ?? defaultPriceGradient)[0],
                    ),
                  ),
                  child: Container(
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.black.withOpacity(0.25),
                    ),
                    child: Center(
                      child: ShaderMask(
                        shaderCallback: (bounds) =>
                            LinearGradient(
                              colors:
                                  priceGradientColors ?? defaultPriceGradient,
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight,
                            ).createShader(
                              Rect.fromLTWH(0, 0, bounds.width, bounds.height),
                            ),
                        child: const Icon(
                          Icons.arrow_outward,
                          size: 18,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

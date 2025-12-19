import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../controller/homeSlaiderController.dart';

class GetXSlideButton extends StatelessWidget {
  final VoidCallback onComplete;
  final String text;
  final Color color;

  GetXSlideButton({
    super.key,
    required this.onComplete,
    this.text = "Slide to continue",
    this.color = const Color(0xFF878787),
  });

  final SlideController controller = Get.put(SlideController());

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        const circleSize = 50.0;
        const maxWidth = 170.0;
        const horizontalPadding = 2.0;
        final maxDrag = maxWidth - circleSize - (horizontalPadding * 2);

        return Obx(
          () => Container(
            alignment: Alignment.center,
            height: 70,
            width: maxWidth,
            padding: EdgeInsets.symmetric(horizontal: horizontalPadding),
            decoration: BoxDecoration(
              color: color,
              borderRadius: BorderRadius.circular(50.r),
              border: Border.all(color: Colors.white, width: 1.5),
            ),
            child: Stack(
              clipBehavior: Clip.none,
              children: [
                // Right Circle Indicator (Black) - নিচে থাকবে
                Positioned(
                  right: horizontalPadding,
                  top: (70 - 50) / 2,
                  child: Container(
                    height: 50,
                    width: 50,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Color(0xFF3B3B3B),
                      border: Border.all(color: Color(0xFFB3B3B3), width: 2),
                    ),
                    child: Icon(Icons.check, color: Colors.white, size: 24),
                  ),
                ),

                // Center Arrows
                Positioned.fill(
                  child: Center(
                    child: Opacity(
                      opacity: 1 - (controller.dragPosition.value / maxDrag),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.chevron_right,
                            color: Colors.grey,
                            size: 28,
                          ),
                          Icon(
                            Icons.chevron_right,
                            color: Colors.white,
                            size: 28,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),

                // Draggable Circle
                AnimatedPositioned(
                  duration: Duration(milliseconds: 200),
                  left: controller.dragPosition.value + horizontalPadding,
                  top: 10.h,
                  child: GestureDetector(
                    onHorizontalDragUpdate: (details) {
                      controller.updateDrag(details.delta.dx, maxDrag);
                    },
                    onHorizontalDragEnd: (_) {
                      if (controller.dragPosition.value >= maxDrag * 0.85) {
                        controller.complete();
                        Future.delayed(Duration(milliseconds: 300), () {
                          onComplete();
                          controller.reset();
                        });
                      } else {
                        controller.reset();
                      }
                    },
                    child: AnimatedContainer(
                      duration: Duration(milliseconds: 200),
                      height: circleSize,
                      width: circleSize,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        gradient: LinearGradient(
                          colors: controller.isCompleted.value
                              ? [Colors.green.shade600, Colors.green.shade800]
                              : [Colors.white, Colors.grey.shade300],
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                        ),
                        border: Border.all(
                          color: controller.isCompleted.value
                              ? Colors.green.shade400
                              : Colors.amber,
                          width: 3.w,
                        ),
                      ),
                      child: Icon(
                        Icons.check,
                        color: controller.isCompleted.value
                            ? Colors.white
                            : Colors.black87,
                        size: 28.sp,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

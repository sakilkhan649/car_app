import 'package:car_app/common_widgets/Custom_text.dart';
import 'package:car_app/widget/Custom_Back_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import '../../../../utils/app_icons/app_icons.dart';
import 'controller/notification_controller.dart';
import 'widget/notification_card.dart';

class NotificationsScreen extends StatelessWidget {
  NotificationsScreen({super.key});

  final NotificationController controller = Get.put(NotificationController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: const CustomBackButton(),
        title: const CustomText(
          text: "Notification",
          fontSize: 20,
          fontWeight: FontWeight.w600,
          fontStyle: FontStyle.italic,
          color: Colors.white,
        ),
        actions: [
          Obx(() {
            if (controller.notifications.isNotEmpty) {
              return Padding(
                padding: const EdgeInsets.only(right: 20),
                child: TextButton(
                  onPressed: controller.clearAll,
                  child: const Text(
                    "Clear all",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              );
            } else {
              return const SizedBox();
            }
          }),
        ],
      ),
      body: Obx(() {
        if (controller.notifications.isNotEmpty) {
          return ListView.separated(
            padding: const EdgeInsets.all(16),
            itemCount: controller.notifications.length,
            separatorBuilder: (_, __) => const SizedBox(height: 12),
            itemBuilder: (context, index) {
              final notification = controller.notifications[index];
              return NotificationCard(
                title: notification["title"]!,
                description: notification["description"]!,
                time: notification["time"]!,
              );
            },
          );
        } else {
          return const _EmptyNotification();
        }
      }),
    );
  }
}

class _EmptyNotification extends StatelessWidget {
  const _EmptyNotification();

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SvgPicture.asset(AppIcons.nonotificationicon),
          SizedBox(height: 16),
          Text(
            "No Notifications",
            style: TextStyle(
              color: Colors.white,
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 6),
          Text(
            "We'll let you know when there will be\nsomething to update you.",
            textAlign: TextAlign.center,
            style: TextStyle(color: Colors.white54, fontSize: 16),
          ),
        ],
      ),
    );
  }
}

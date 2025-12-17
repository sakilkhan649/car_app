
import 'package:get/get.dart';

class NotificationController extends GetxController {
  // নোটিফিকেশন লিস্ট
  var notifications = <Map<String, String>>[
    {
      "title": "Security alert",
      "description":
      "We noticed a new login from a different device. If this wasn't you, please secure your account.",
      "time": "2 days ago",
    },
    {
      "title": "Security alert",
      "description":
      "We noticed a new login from a different device. If this wasn't you, please secure your account.",
      "time": "2 days ago",
    },
    {
      "title": "Security alert",
      "description":
      "We noticed a new login from a different device. If this wasn't you, please secure your account.",
      "time": "2 days ago",
    },
    {
      "title": "Security alert",
      "description":
      "We noticed a new login from a different device. If this wasn't you, please secure your account.",
      "time": "2 days ago",
    },
  ].obs;

  // সব মুছে ফেলার ফাংশন
  void clearAll() {
    notifications.clear();
  }
}
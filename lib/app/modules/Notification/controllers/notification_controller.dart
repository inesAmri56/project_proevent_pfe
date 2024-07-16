
import 'dart:ui';
import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:get/get.dart';

class NotificationController extends GetxController {
  @override
  void onInit() {
    super.onInit();
    initializeNotifications();
  }

  void initializeNotifications() {
    AwesomeNotifications().initialize(
      'Ressource://drawable/icon.png', // Ensure this icon exists
      [
        NotificationChannel(
          channelKey: 'basic_channel',
          channelName: 'Basic notifications',
          channelDescription: 'Notification channel for basic tests',
          defaultColor: Color(0xFF9D50DD),
          ledColor: Color(0xFF9D50DD),
          importance: NotificationImportance.High,
        ),
      ],
    );
  }

  void showNotification() {
    AwesomeNotifications().createNotification(
      content: NotificationContent(
        id: 10,
        channelKey: 'basic_channel',
        title: 'Hello from Awesome Notifications!',
        body: 'This is a simple notification.',
        notificationLayout: NotificationLayout.Default,
        // No need to specify smallIcon here as it's managed by Awesome Notifications
      ),
    );
  }
}

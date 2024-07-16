// lib/app/views/notification_screen.dart
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/notification_controller.dart';

class NotificationView extends StatelessWidget {
  final NotificationController notificationController = Get.put(NotificationController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Notification Screen'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            notificationController.showNotification();
          },
          child: Text('Show Notification'),
        ),
      ),
    );
  }
}

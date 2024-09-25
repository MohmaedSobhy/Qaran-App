import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class LocalNotification {
  static FlutterLocalNotificationsPlugin localnotification =
      FlutterLocalNotificationsPlugin();

  static Future<void> initNotification() async {
    InitializationSettings setting = const InitializationSettings(
      android: AndroidInitializationSettings("@mipmap/launcher_icon"),
      iOS: DarwinInitializationSettings(),
    );
    localnotification.initialize(
      setting,
      onDidReceiveBackgroundNotificationResponse: onNotificationResponse,
      onDidReceiveNotificationResponse: onNotificationResponse,
    );
  }

  static onNotificationResponse(NotificationResponse notifyResponse) {}

  static void showBasicNotification() async {
    NotificationDetails details = const NotificationDetails(
      android: AndroidNotificationDetails(
        'Id 1',
        'Basic Notification',
        importance: Importance.max,
        priority: Priority.high,
        color: Colors.green,
        playSound: true,
        autoCancel: false,
        ongoing: true,
      ),
    );
    await localnotification.show(
      1,
      'Basic',
      'Learn Basic Notification',
      details,
    );
  }
}

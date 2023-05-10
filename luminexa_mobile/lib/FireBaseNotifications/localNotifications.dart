import "package:firebase_messaging/firebase_messaging.dart";
import "package:flutter_local_notifications/flutter_local_notifications.dart";

class LocalNotificationService {
  static final FlutterLocalNotificationsPlugin _notificationSettings =
      FlutterLocalNotificationsPlugin();

  static void initialize() {
    final InitializationSettings initializationSettings =
        InitializationSettings(
      android: AndroidInitializationSettings("@mipmap/ic_launcher"),
    );
    _notificationSettings.initialize(initializationSettings);
  }

  static void showMessageOnForeground(RemoteMessage message) {
    final notificationDetails = NotificationDetails(
      android: AndroidNotificationDetails("luminexaId", "luminexa",
          importance: Importance.max, priority: Priority.high),
    );
    _notificationSettings.show(
        DateTime.now().microsecond,
        message.notification!.title,
        message.notification!.body,
        notificationDetails);
  }
}

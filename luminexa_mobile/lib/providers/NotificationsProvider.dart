import 'package:flutter/material.dart';
import 'package:luminexa_mobile/APIs/NotificationsAPI.dart';
import 'package:luminexa_mobile/models/notificationModel.dart';

class NotificationsProvider extends ChangeNotifier {
  List<Notifications> notifications = [];

  NotificationsProvider({
    required this.notifications,
  });

  Future getSystemNotitifications(systemId) async {
    final response = await NotificationsAPIs.getSystemNotitifications(systemId);

    List<Notifications> _notifications = [];

    response.data.forEach((map) {
      final Notifications notification = fromJSON(map);
      _notifications.add(notification);
    });

    notifications = _notifications;

    notifyListeners();
  }

  Future createNotifications(
      DateTime time, String systemId, String description) async {
    final response = await NotificationsAPIs.createNotifications(
        time, systemId, description);
    return response;
  }

  Future getNotifications() async {
    final response = await NotificationsAPIs.getNotifications();

    return response;
  }

  Notifications fromJSON(Map json) {
    final newNotification = Notifications(
        id: json['_id'],
        time: DateTime.parse(json["time"]),
        system: json['system'],
        description: json['description']);
    return newNotification;
  }
}

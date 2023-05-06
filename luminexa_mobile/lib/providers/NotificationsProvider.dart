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

  Future createNotifications(time, systemId, description) async {
    final response = await NotificationsAPIs.createNotifications(
        time, systemId, description);
    return response;
  }

  Notifications fromJSON(Map json) {
    final newNotification = Notifications(
        id: json['_id'],
        time: json['time'],
        systemId: json['systemId'],
        description: json['description']);
    return newNotification;
  }
}

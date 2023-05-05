import 'package:flutter/material.dart';
import 'package:luminexa_mobile/APIs/NotificationsAPI.dart';

class NotificationsProvider extends ChangeNotifier {
  static Future getSystemNotitifications(systemId) async {
    final Response = await NotificationsAPIs.getSystemNotitifications(systemId);
    return Response;
  }
}

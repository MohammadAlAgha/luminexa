import 'package:luminexa_mobile/configs/remoteConfig.dart';
import 'package:luminexa_mobile/enums/requestMethods.dart';

class NotificationsAPIs {
  static Future getSystemNotitifications(systemId) async {
    final body = {"systemId": systemId};
    try {
      final response = await sendRequest(
          route: "/schedules/getSchedules",
          method: RequestMethods.GET,
          load: body);
      return response;
    } catch (e) {
      rethrow;
    }
  }

  static Future createNotifications(time, systemId, description) async {
    final body = {
      "systemId": systemId,
      "time": time,
      "description": description
    };
    try {
      final response = await sendRequest(
          route: "/schedules/createNotifications",
          method: RequestMethods.POST,
          load: body);
      return response;
    } catch (e) {
      rethrow;
    }
  }
}

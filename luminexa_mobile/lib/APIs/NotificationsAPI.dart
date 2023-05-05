import 'package:luminexa_mobile/configs/remoteConfig.dart';

class NotificationsAPIs {
  static Future getSystemNotitifications(systemId) async {
    final body = {"systemId": systemId};
    try {
      final Response = await dioClient
          .post("/notifications/getSystemNotitifications", data: body);
      return Response;
    } catch (e) {
      rethrow;
    }
  }
}

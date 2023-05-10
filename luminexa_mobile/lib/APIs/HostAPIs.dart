import 'package:luminexa_mobile/configs/remoteConfig.dart';
import 'package:luminexa_mobile/enums/requestMethods.dart';

class HostAPIs {
  static Future getSystemUsers(systemId) async {
    final body = {"systemId": systemId};
    try {
      final response = await sendRequest(
          route: "/host/getSystemUsers",
          method: RequestMethods.GET,
          load: body);
      return response.data;
    } catch (e) {
      rethrow;
    }
  }

  static Future deleteUser(systemId, userEmail) async {
    final body = {"systemId": systemId, "email": userEmail};
    try {
      final response = await sendRequest(
          route: "/host/deleteUser", method: RequestMethods.DELETE, load: body);
      return response.data;
    } catch (e) {
      rethrow;
    }
  }
}

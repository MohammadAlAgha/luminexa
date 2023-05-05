import 'package:luminexa_mobile/configs/remoteConfig.dart';
import 'package:luminexa_mobile/enums/requestMethods.dart';

class ModeAPIs {
  static Future getModes(systemId) async {
    final body = {"systemId": systemId};
    try {
      final response = await sendRequest(
          route: "/mode/getModes", method: RequestMethods.GET, load: body);
      return response;
    } catch (e) {
      rethrow;
    }
  }

  static Future addMode(systemId, modeName) async {
    final body = {"systemId": systemId, "modeName": modeName};
    try {
      final response = await sendRequest(
          route: "/mode/addMode", method: RequestMethods.POST, load: body);
      return response;
    } catch (e) {
      rethrow;
    }
  }
}

import 'package:luminexa_mobile/configs/remoteConfig.dart';
import 'package:luminexa_mobile/enums/requestMethods.dart';

class ModeAPIs {
  static Future getModes(systemId) async {
    final body = {"systemId": systemId};
    try {
      final response = await sendRequest(
          route: "/modes/getModes", method: RequestMethods.GET, load: body);
      return response;
    } catch (e) {
      rethrow;
    }
  }

  static Future addMode(systemId, modeName) async {
    final body = {"systemId": systemId, "modeName": modeName};
    try {
      final response = await sendRequest(
          route: "/modes/addMode", method: RequestMethods.POST, load: body);
      return response;
    } catch (e) {
      rethrow;
    }
  }

  static Future toggleMode(systemId, modeId) async {
    final body = {"systemId": systemId, "modeId": modeId};
    try {
      final response = await sendRequest(
          route: "/modes/toggleMode", method: RequestMethods.PUT, load: body);
      return response;
    } catch (e) {
      rethrow;
    }
  }

  static Future updateMode(systemId, modeId, modeName) async {
    final body = {"systemId": systemId, "modeId": modeId, "modeName": modeName};
    try {
      final response = await sendRequest(
          route: "/modes/updateMode", method: RequestMethods.PUT, load: body);
      return response;
    } catch (e) {
      rethrow;
    }
  }

  static Future deleteMode(systemId, modeId) async {
    final body = {"systemId": systemId, "modeId": modeId};
    try {
      final response = await sendRequest(
          route: "/modes/deleteMode",
          method: RequestMethods.DELETE,
          load: body);
      return response;
    } catch (e) {
      rethrow;
    }
  }
}

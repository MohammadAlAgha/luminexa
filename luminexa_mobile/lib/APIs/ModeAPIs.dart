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
}

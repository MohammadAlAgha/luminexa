import 'package:luminexa_mobile/configs/remoteConfig.dart';
import 'package:luminexa_mobile/enums/requestMethods.dart';

class LedsAPIs {
  static Future getLeds(systemId) async {
    final body = {"systemId": systemId};
    try {
      final response = await sendRequest(
          route: "/leds/getLeds", method: RequestMethods.GET, load: body);
      return response;
    } catch (e) {
      rethrow;
    }
  }

  static Future addLed(systemId, ledName) async {
    final body = {"systemId": systemId, "ledName": ledName};
    try {
      final response = await sendRequest(
          route: "/leds/addLed", method: RequestMethods.POST, load: body);
      return response;
    } catch (e) {
      rethrow;
    }
  }
}

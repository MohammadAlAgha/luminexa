import 'package:luminexa_mobile/configs/remoteConfig.dart';

class LedsAPIs {
  static Future getLeds(systemId) async {
    final body = {"systemId": systemId};
    try {
      final response = await dioClient.post("/leds/getLeds", data: body);
      return response;
    } catch (e) {
      rethrow;
    }
  }
}

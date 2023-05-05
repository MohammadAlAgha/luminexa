import 'package:luminexa_mobile/configs/remoteConfig.dart';

class ModeAPIs {
  static Future getModes(systemId) async {
    final body = {"systemId": systemId};
    try {
      final Response = await dioClient.post("/mode/getModes", data: body);
      return Response;
    } catch (e) {
      rethrow;
    }
  }
}

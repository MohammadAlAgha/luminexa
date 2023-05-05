import 'package:luminexa_mobile/configs/remoteConfig.dart';

class ScheduleAPIs {
  static Future getSchedules(systemId) async {
    final body = {"systemId": systemId};
    try {
      final Response =
          await dioClient.post("/schedules/getSchedules", data: body);
      return Response;
    } catch (e) {
      rethrow;
    }
  }
}

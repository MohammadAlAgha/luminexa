import 'package:luminexa_mobile/configs/remoteConfig.dart';
import 'package:luminexa_mobile/enums/requestMethods.dart';

class ScheduleAPIs {
  static Future getSchedules(systemId) async {
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

  static Future addSchedule(systemId, scheduleTitle, time, repeat) async {
    try {
      final body = {
        "systemId": systemId,
        "scheduleTitle": scheduleTitle,
        "time": time,
        "repeat": repeat
      };
      final response = await sendRequest(
          route: "schedules/addSchedule",
          method: RequestMethods.POST,
          load: body);
      return response;
    } catch (e) {
      rethrow;
    }
  }

  static Future toggleSchedule(systemId, scheduleId) async {
    final body = {"systemId": systemId, "scheduleId": scheduleId};
    try {
      final response = await sendRequest(
          route: "schedules/toggleSchedule",
          method: RequestMethods.PUT,
          load: body);
      return response;
    } catch (e) {
      rethrow;
    }
  }

  static Future updateSchedule(
      systemId, scheduleId, scheduleTitle, time, repeat) async {
    final body = {
      "systemId": systemId,
      "scheduleId": scheduleId,
      "scheduleTitle": scheduleTitle,
      "time": time,
      "repeat": repeat
    };
    try {
      final response = await sendRequest(
          route: "schedules/updateSchedule",
          method: RequestMethods.PUT,
          load: body);
      return response;
    } catch (e) {
      rethrow;
    }
  }
}

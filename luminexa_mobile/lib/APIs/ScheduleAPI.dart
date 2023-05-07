import 'package:luminexa_mobile/configs/remoteConfig.dart';
import 'package:luminexa_mobile/enums/requestMethods.dart';
import 'package:luminexa_mobile/models/repeatModel.dart';

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

  static Future addSchedule(String systemId, String scheduleTitle,
      DateTime timeStart, DateTime timeEnd, List<String> repeat) async {
    try {
      final body = {
        "systemId": systemId,
        "scheduleTitle": scheduleTitle,
        "timeStart": timeStart.toIso8601String(),
        "timeEnd": timeEnd.toIso8601String(),
        "repeat": repeat
      };
      final response = await sendRequest(
        route: "/schedules/addSchedule",
        method: RequestMethods.POST,
        load: body,
      );
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
      systemId, scheduleId, scheduleTitle, timeStart, timeEnd, repeat) async {
    final body = {
      "systemId": systemId,
      "scheduleId": scheduleId,
      "scheduleTitle": scheduleTitle,
      "timeStart": timeStart,
      "timeEnd": timeEnd,
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

  static Future deleteSchedule(systemId, scheduleId) async {
    final body = {"systemId": systemId, "scheduleId": scheduleId};
    try {
      final response = await sendRequest(
          route: "schedules/deleteSchedule",
          method: RequestMethods.DELETE,
          load: body);
      return response;
    } catch (e) {
      rethrow;
    }
  }
}

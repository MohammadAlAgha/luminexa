import 'package:flutter/material.dart';
import 'package:luminexa_mobile/APIs/ScheduleAPI.dart';

class SchedulesProvider extends ChangeNotifier {
  static Future getSchedules(systemId) async {
    final Response = await ScheduleAPIs.getSchedules(systemId);
    return Response;
  }

  static Future addSchedule(
      systemId, scheduleTitle, timeStart, timeEnd, repeat) async {
    final Response = await ScheduleAPIs.addSchedule(
        systemId, scheduleTitle, timeStart, timeEnd, repeat);
    return Response;
  }

  static Future toggleSchedule(systemId, scheduleId) async {
    final Response = await ScheduleAPIs.toggleSchedule(systemId, scheduleId);
    return Response;
  }

  static Future updateSchedule(
      systemId, scheduleId, scheduleTitle, timeStart, timeEnd, repeat) async {
    final Response = await ScheduleAPIs.updateSchedule(
        systemId, scheduleId, scheduleTitle, timeStart, timeEnd, repeat);
    return Response;
  }

  static Future deleteSchedule(systemId, scheduleId) async {
    final Response = await ScheduleAPIs.deleteSchedule(systemId, scheduleId);
    return Response;
  }
}

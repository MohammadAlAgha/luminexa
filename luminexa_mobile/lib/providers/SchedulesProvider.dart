import 'package:flutter/material.dart';
import 'package:luminexa_mobile/APIs/ScheduleAPI.dart';
import 'package:luminexa_mobile/models/scheduleModel.dart';

class SchedulesProvider extends ChangeNotifier {
  List<Schedule> schedules = [];

  SchedulesProvider({
    required this.schedules,
  });

  Future getSchedules(systemId) async {
    final response = await ScheduleAPIs.getSchedules(systemId);
    return response;
  }

  Future addSchedule(
      systemId, scheduleTitle, timeStart, timeEnd, repeat) async {
    final response = await ScheduleAPIs.addSchedule(
        systemId, scheduleTitle, timeStart, timeEnd, repeat);
    return response;
  }

  Future toggleSchedule(systemId, scheduleId) async {
    final response = await ScheduleAPIs.toggleSchedule(systemId, scheduleId);
    return response;
  }

  Future updateSchedule(
      systemId, scheduleId, scheduleTitle, timeStart, timeEnd, repeat) async {
    final response = await ScheduleAPIs.updateSchedule(
        systemId, scheduleId, scheduleTitle, timeStart, timeEnd, repeat);
    return response;
  }

  Future deleteSchedule(systemId, scheduleId) async {
    final response = await ScheduleAPIs.deleteSchedule(systemId, scheduleId);
    return response;
  }

  Schedule fromJSON(Map josn) {
    final newSchedule = Schedule(
        id: josn["id"],
        scheduleTitle: josn["scheduleTitle"],
        timeStart: josn["timeStart"],
        timeEnd: josn["timeEnd"],
        repeat: josn["repeat"],
        leds: josn["leds"],
        scheduleStatus: josn["scheduleStatus"]);
    return newSchedule;
  }
}

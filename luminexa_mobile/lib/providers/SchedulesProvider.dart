import 'package:flutter/material.dart';
import 'package:luminexa_mobile/APIs/ScheduleAPI.dart';

class SchedulesProvider extends ChangeNotifier {
  static Future getSchedules(systemId) async {
    final Response = await ScheduleAPIs.getSchedules(systemId);
    return Response;
  }
}

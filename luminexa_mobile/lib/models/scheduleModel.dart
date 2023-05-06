import 'package:luminexa_mobile/models/ledModel.dart';

class Schedule {
  final String id;
  final String scheduleTitle;
  final String timeStart;
  final String timeEnd;
  final List<String> repeat;
  final List<Led> leds;
  final String scheduleStatus;

  Schedule({
    required this.id,
    required this.scheduleTitle,
    required this.timeStart,
    required this.timeEnd,
    required this.repeat,
    required this.leds,
    required this.scheduleStatus,
  });
}

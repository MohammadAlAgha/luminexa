import 'package:luminexa_mobile/models/ledModel.dart';

class Schedule {
  final int id;
  final String scheduleTitle;
  final DateTime timeStart;
  final DateTime timeEnd;
  final List<String> repeat;
  final List<Led> leds;
  final bool scheduleStatus;

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

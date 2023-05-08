import 'package:flutter/material.dart';
import 'package:luminexa_mobile/models/ledModel.dart';
import 'package:luminexa_mobile/models/repeatModel.dart';

class Schedule {
  final String id;
  final String scheduleTitle;
  final DateTime timeStart;
  final DateTime timeEnd;
  final List<dynamic> repeat;
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

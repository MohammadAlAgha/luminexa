import 'package:flutter/material.dart';

String getTimeFormat(DateTime time) {
  return "${time.hour}:${time.minute == 0 ? "00" : time.minute}";
}

String getStringTimeOfDay(TimeOfDay? time) {
  return "2023-09-08T${time?.hour}:${time?.minute == 0 ? "00" : time?.minute}:00.000+00:00";
}

import 'package:flutter/foundation.dart';

class LedConfig {
  int intensity;
  String ledStatus;
  String color;

  LedConfig({
    required this.intensity,
    required this.color,
    required this.ledStatus,
  });

  static LedConfig fromJSON(Map json) {
    return LedConfig(
        intensity: json["intensity"],
        color: json['color'],
        ledStatus: json['ledStatus']);
  }
}

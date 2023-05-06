import 'package:luminexa_mobile/models/ledModel.dart';

class Mode {
  final String id;
  final String modeName;
  final List<Led> leds;
  final String modeStatus;

  Mode({
    required this.id,
    required this.modeName,
    required this.leds,
    required this.modeStatus,
  });
}

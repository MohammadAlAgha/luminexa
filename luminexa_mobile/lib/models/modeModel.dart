import 'package:luminexa_mobile/models/ledModel.dart';

class Mode {
  final int id;
  final String modeName;
  final List<Led> leds;
  final bool modeStatus;

  Mode({
    required this.id,
    required this.modeName,
    required this.leds,
    required this.modeStatus,
  });
}

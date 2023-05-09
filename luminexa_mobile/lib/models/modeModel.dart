import 'package:luminexa_mobile/models/ledConfigs.dart';
import 'package:luminexa_mobile/models/ledModel.dart';

class Mode {
  final String id;
  final String modeName;
  final List<LedConfig> configs;
  final String modeStatus;

  Mode({
    required this.id,
    required this.modeName,
    required this.configs,
    required this.modeStatus,
  });
}

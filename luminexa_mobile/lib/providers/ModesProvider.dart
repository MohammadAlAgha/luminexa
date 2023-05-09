import 'package:flutter/material.dart';
import 'package:luminexa_mobile/APIs/ModeAPIs.dart';
import 'package:luminexa_mobile/models/ledConfigs.dart';
import 'package:luminexa_mobile/models/modeModel.dart';

class ModesProvider extends ChangeNotifier {
  List<Mode> modes = [];

  ModesProvider({
    required this.modes,
  });

  Future<void> getModes(systemId) async {
    final response = await ModeAPIs.getModes(systemId);

    List<Mode> _modes = [];

    response.data.forEach((map) {
      final Mode mode = fromJSON(map);
      _modes.add(mode);
    });

    modes = _modes;

    notifyListeners();
  }

  Future addMode(systemId, modeName) async {
    final response = await ModeAPIs.addMode(systemId, modeName);

    List<Mode> _modes = [];

    response.data["modes"].forEach((map) {
      final Mode mode = fromJSON(map);
      _modes.add(mode);
    });

    modes = _modes;

    notifyListeners();
  }

  Future toggleMode(systemId, modeId) async {
    final response = await ModeAPIs.toggleMode(systemId, modeId);

    List<Mode> _modes = [];

    response.data["modes"].forEach((map) {
      final Mode mode = fromJSON(map);
      _modes.add(mode);
    });

    modes = _modes;

    notifyListeners();
  }

  Future updateMode(systemId, modeId, modeName) async {
    final response = await ModeAPIs.updateMode(systemId, modeId, modeName);
    return response;
  }

  Future deleteMode(systemId, modeId) async {
    final response = await ModeAPIs.deleteMode(systemId, modeId);
    return response;
  }

  static Mode fromJSON(Map json) {
    List<LedConfig> parsedConfigs = [];
    json["leds"].forEach((mode) {
      parsedConfigs.add(LedConfig.fromJSON(mode));
    });
    final Mode newMode = Mode(
        id: json["_id"],
        modeName: json["modeName"],
        configs: parsedConfigs,
        modeStatus: json['modeStatus']);
    return newMode;
  }
}

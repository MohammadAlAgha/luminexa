import 'package:flutter/material.dart';
import 'package:luminexa_mobile/APIs/ModeAPIs.dart';
import 'package:luminexa_mobile/models/modeModel.dart';

class ModesProvider extends ChangeNotifier {
  List<Mode> modes = [];

  ModesProvider({
    required this.modes,
  });

  Future getModes(systemId) async {
    final response = await ModeAPIs.getModes(systemId);
    return response;
  }

  Future addMode(systemId, modeName) async {
    final response = await ModeAPIs.addMode(systemId, modeName);
    return response;
  }

  Future toggleMode(systemId, modeId) async {
    final response = await ModeAPIs.toggleMode(systemId, modeId);
    return response;
  }

  Future updateMode(systemId, modeId, modeName) async {
    final response = await ModeAPIs.updateMode(systemId, modeId, modeName);
    return response;
  }

  Future deleteMode(systemId, modeId) async {
    final response = await ModeAPIs.deleteMode(systemId, modeId);
    return response;
  }

  Mode fromJSON(Map json) {
    final Mode newMode = Mode(
        id: json["id"],
        modeName: json["modeName"],
        leds: json["leds"],
        modeStatus: json['modeStatus']);
    return newMode;
  }
}

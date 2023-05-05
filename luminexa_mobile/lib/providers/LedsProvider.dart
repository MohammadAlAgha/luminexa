import 'package:flutter/material.dart';
import 'package:luminexa_mobile/APIs/LedAPI.dart';
import 'package:luminexa_mobile/models/ledModel.dart';

class LedProvider extends ChangeNotifier {
  List<Led> leds = [];

  LedProvider({
    required this.leds,
  });

  Future getLeds(systemId) async {
    final response = await LedsAPIs.getLeds(systemId);
    return response;
  }

  Future addLed(systemId, ledName) async {
    final response = await LedsAPIs.addLed(systemId, ledName);
    return response;
  }

  Future editLed(systemId, ledId, ledStatus, intensity, color) async {
    final response =
        await LedsAPIs.editLed(systemId, ledId, ledStatus, intensity, color);
    return response;
  }

  Future editConfigs(systemId, ledId, ledStatus, intensity, color) async {
    final response = await LedsAPIs.editConfigs(
        systemId, ledId, ledStatus, intensity, color);
    return response;
  }

  Future getActiveLeds(systemId) async {
    final response = await LedsAPIs.getActiveLeds(systemId);
    return response;
  }

  Led fromJSON(Map json) {
    final Led newLed = Led(
        id: json["id"],
        ledName: json["ledName"],
        intensity: json["intensity"],
        ledStatus: json["ledStatus"],
        color: json["color"],
        histrory: json["histrory"]);

    return newLed;
  }
}

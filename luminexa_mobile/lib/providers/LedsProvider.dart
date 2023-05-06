import 'package:flutter/material.dart';
import 'package:luminexa_mobile/APIs/LedAPI.dart';
import 'package:luminexa_mobile/models/ledModel.dart';

class LedsProvider extends ChangeNotifier {
  List<Led> leds = [];

  LedsProvider({
    required this.leds,
  });

  Future<void> getLeds(systemId) async {
    print(systemId);
    final response = await LedsAPIs.getLeds(systemId);

    List<Led> _led = [];

    response.data.forEach((map) {
      final Led led = fromJSON(map);
      _led.add(led);
    });
    leds = _led;

    notifyListeners();
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
      id: json["_id"],
      ledName: json["ledName"],
      intensity: json["ledConfig"]["intensity"],
      ledStatus: json["ledConfig"]["ledStatus"],
      color: json["ledConfig"]["color"],
      histrory: [],
    );

    return newLed;
  }
}

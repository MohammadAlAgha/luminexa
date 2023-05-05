import 'package:flutter/material.dart';
import 'package:luminexa_mobile/APIs/LedAPI.dart';

class LedProvider extends ChangeNotifier {
  static Future getLeds(systemId) async {
    final Response = await LedsAPIs.getLeds(systemId);
    return Response;
  }

  static Future addLed(systemId, ledName) async {
    final Response = await LedsAPIs.addLed(systemId, ledName);
    return Response;
  }

  static Future editLed(systemId, ledId, ledStatus, intensity, color) async {
    final Response =
        await LedsAPIs.editLed(systemId, ledId, ledStatus, intensity, color);
    return Response;
  }

  static Future editConfigs(
      systemId, ledId, ledStatus, intensity, color) async {
    final Response = await LedsAPIs.editConfigs(
        systemId, ledId, ledStatus, intensity, color);
    return Response;
  }

  static Future getActiveLeds(systemId) async {
    final Response = await LedsAPIs.getActiveLeds(systemId);
    return Response;
  }
}

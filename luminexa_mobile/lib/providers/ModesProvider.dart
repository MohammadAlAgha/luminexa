import 'package:flutter/material.dart';
import 'package:luminexa_mobile/APIs/ModeAPIs.dart';

class ModesProvider extends ChangeNotifier {
  static Future getModes(systemId) async {
    final Response = await ModeAPIs.getModes(systemId);
    return Response;
  }

  static Future addMode(systemId, modeName) async {
    final Response = await ModeAPIs.addMode(systemId, modeName);
    return Response;
  }

  static Future toggleMode(systemId, modeId) async {
    final Response = await ModeAPIs.toggleMode(systemId, modeId);
    return Response;
  }

  static Future updateMode(systemId, modeId, modeName) async {
    final Response = await ModeAPIs.updateMode(systemId, modeId, modeName);
    return Response;
  }

  static Future deleteMode(systemId, modeId) async {
    final Response = await ModeAPIs.deleteMode(systemId, modeId);
    return Response;
  }
}

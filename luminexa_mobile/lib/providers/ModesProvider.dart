import 'package:flutter/material.dart';
import 'package:luminexa_mobile/APIs/ModeAPIs.dart';

class ModesProvider extends ChangeNotifier {
  static Future getModes(systemId) async {
    final Response = await ModeAPIs.getModes(systemId);
    return Response;
  }
}

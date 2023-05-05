import 'package:flutter/material.dart';
import 'package:luminexa_mobile/APIs/LedAPI.dart';

class LedProvider extends ChangeNotifier {
  static Future getLeds(systemId) async {
    final Response = await LedsAPIs.getLeds(systemId);
    return Response;
  }
}

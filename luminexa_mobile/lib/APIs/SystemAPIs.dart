import 'package:luminexa_mobile/configs/remoteConfig.dart';
import 'package:luminexa_mobile/enums/requetMethods.dart';

abstract class SystemAPIs {
  static Future getAllSystems() async {
    try {
      final response = await sendRequest(
        route: "/system/getSystems",
        method: RequestMethods.POST,
      );

      return response;
    } catch (e) {
      rethrow;
    }
  }

  static Future addSystem(serialNumber) async {
    final body = {"serialNumber": serialNumber};
    try {
      final response = await dioClient.post("/system/addSystem", data: body);
      return response;
    } catch (e) {
      rethrow;
    }
  }
}

import 'package:dio/dio.dart';
import 'package:luminexa_mobile/configs/remoteConfig.dart';

abstract class AuthDataSource {
  static Future login(email, password) async {
    final body = {"email": email, "password": password};
    try {
      final response = await dioClient.post("/auth/login", data: body);
      print(response);
    } catch (e) {
      rethrow;
    }
  }
}

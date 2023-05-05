import 'package:luminexa_mobile/configs/local_storage_config.dart';
import 'package:luminexa_mobile/configs/remoteConfig.dart';
import 'package:luminexa_mobile/enums/localTypes.dart';
import 'package:luminexa_mobile/enums/requetMethods.dart';

abstract class AuthDataSource {
  static Future login(email, password) async {
    final body = {"email": email, "password": password};
    try {
      final response = await sendRequest(
        route: "/auth/login",
        load: body,
        method: RequestMethods.POST,
      );

      await localSave(
        type: LocalTypes.String,
        key: "access_token",
        value: response.data["token"],
      );

      print("Token saved");
    } catch (e) {
      rethrow;
    }
  }

  static Future register(userName, email, password, confirmPassword) async {
    final body = {
      "userName": userName,
      "email": email,
      "password": password,
      "confirmPassword": confirmPassword
    };
    try {
      final response = await dioClient.post("/auth/register", data: body);
      print(response);
    } catch (e) {
      rethrow;
    }
  }
}

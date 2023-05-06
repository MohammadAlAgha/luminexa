import 'package:dio/dio.dart';
import 'package:luminexa_mobile/configs/local_storage_config.dart';
import 'package:luminexa_mobile/enums/localTypes.dart';
import 'package:luminexa_mobile/enums/requestMethods.dart';
import 'package:shared_preferences/shared_preferences.dart';

final options = BaseOptions(
  baseUrl: "http://192.168.0.102:8000",
  contentType: Headers.jsonContentType,
);

final dioClient = Dio(options);

Future sendRequest({
  required String route,
  RequestMethods method = RequestMethods.GET,
  Map? load,
}) async {
  final prefs = await SharedPreferences.getInstance();

  final String? token = prefs.getString(
      "access_token"); // await getLocal(type: LocalTypes.String, key: "access_token");

  if (token != null) {
    final BaseOptions authorizedOptions =
        dioClient.options.copyWith(headers: {"Authorization": "Bearer $token"});

    dioClient.options = authorizedOptions;
  }

  if (method == RequestMethods.GET) {
    final response = await dioClient.get(route, data: load);

    return response;
  } else if (method == RequestMethods.POST) {
    final response = await dioClient.post(route, data: load);

    return response;
  } else if (method == RequestMethods.PUT) {
    final response = await dioClient.put(route, data: load);

    return response;
  } else if (method == RequestMethods.DELETE) {
    final response = await dioClient.delete(route, data: load);

    return response;
  }

  return Future(() {
    return "Not a valid method";
  });
}

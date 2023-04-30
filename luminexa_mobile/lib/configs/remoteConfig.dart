import 'package:dio/dio.dart';

final options = BaseOptions(
  baseUrl: "http://192.168.0.104:8000",
  contentType: Headers.jsonContentType,
);

final dioClient = Dio(options);

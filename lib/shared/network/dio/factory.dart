import 'package:dio/dio.dart';

import 'request_interceptor.dart';

class DioFactory {
  static const String baseUrl = "https://refq-2021.herokuapp.com/";

  static Dio create() {
    final baseOptions = BaseOptions(
        baseUrl: baseUrl,
        sendTimeout: 30000,
        receiveTimeout: 30000,
        connectTimeout: 30000);
    final dio = Dio(baseOptions);
    dio.interceptors.addAll([
      RequestHeadersInterceptors(),
      LogInterceptor(
          requestBody: true, responseBody: true, request: true, error: true),
    ]);
    return dio;
  }
}

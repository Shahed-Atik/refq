import 'dart:io';

import 'package:dio/dio.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:refq_mongo/localizations/locale_keys.g.dart';
import 'package:refq_mongo/shared/network/exceptions/app_exception.dart';

class RequestHeadersInterceptors extends Interceptor {
  @override
  Future onRequest(
      RequestOptions options, RequestInterceptorHandler handler) async {
    super.onRequest(options, handler);
  }

  @override
  Future onError(DioError err, ErrorInterceptorHandler handler) async {
    super.onError(err, handler);
    if (err.error is SocketException) {
      err.error = AppException.known(LocaleKeys.message_noInternet.tr());
      handler.reject(err);
    } else if (err.type == DioErrorType.connectTimeout ||
        err.type == DioErrorType.sendTimeout ||
        err.type == DioErrorType.receiveTimeout) {
      err.error = AppException.known(LocaleKeys.message_timeOut.tr());
      handler.reject(err);
    } else if (err.type == DioErrorType.response) {
      err.error = AppException.known(err.response?.data);
      handler.reject(err);
    }
    err.error = AppException.unknown();
    handler.reject(err);
  }

  @override
  Future onResponse(
      Response response, ResponseInterceptorHandler handler) async {
    super.onResponse(response, handler);
  }
}

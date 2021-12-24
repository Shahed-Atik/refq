import 'package:easy_localization/easy_localization.dart';
import 'package:refq_mongo/localizations/locale_keys.g.dart';

class AppException implements Exception {
  final String message;

  final Exception innerException;

  AppException(this.message, this.innerException);

  factory AppException.unknown() => AppException(
      LocaleKeys.message_errorToastDefaultMessage.tr(), Exception());

  factory AppException.known(message) => AppException(message, Exception());
  //todo
  // AppException(
  // response["key"], Exception());

  @override
  String toString() => "message : $message, innerException: $innerException";
}

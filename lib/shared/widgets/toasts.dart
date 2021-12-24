import 'package:bot_toast/bot_toast.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:refq_mongo/localizations/locale_keys.g.dart';

void showSuccessToast({String? message}) => BotToast.showText(
    text: message ?? LocaleKeys.message_successToastDefaultMessage.tr(),
    textStyle: TextStyle(
      fontSize: 14.sp,
      color: Colors.white,
      fontFamily: "SF",
    ));

void showErrorToast({String? errorMessage}) => BotToast.showText(
    text: errorMessage ?? LocaleKeys.message_errorToastDefaultMessage.tr(),
    textStyle: TextStyle(
      fontSize: 14.sp,
      color: Colors.white,
      fontFamily: "SF",
    ));

void showWarningMessage({required String message}) => BotToast.showText(
    text: message,
    textStyle: TextStyle(
      fontSize: 14.sp,
      color: Colors.white,
      fontFamily: "SF",
    ));

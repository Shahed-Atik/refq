// DO NOT EDIT. This is code generated via package:easy_localization/generate.dart

// ignore_for_file: prefer_single_quotes

import 'dart:ui';

import 'package:easy_localization/easy_localization.dart' show AssetLoader;

class CodegenLoader extends AssetLoader{
  const CodegenLoader();

  @override
  Future<Map<String, dynamic>> load(String fullPath, Locale locale ) {
    return Future.value(mapLocales[locale.toString()]);
  }

  static const Map<String,dynamic> en = {
  "message": {
    "errorToastDefaultMessage": "Something went wrong",
    "successToastDefaultMessage": "Done Successfully",
    "emptyData": "Empty",
    "retry": "Retry",
    "noInternet": "No internet connection",
    "timeOut": "Server connection timed out"
  },
  "landing": {
    "getStarted": "GET STARTED"
  },
  "home": {
    "more": "more",
    "title": "Report an injury",
    "take_a_photo": "Take a photo",
    "enter_location": "Choose the location of injury"
  },
  "map": {
    "enter_location": "Choose the location"
  },
  "more": {
    "be_volunteer": "Be a volunteer!",
    "dont_be_volunteer": "Don't Be a volunteer!",
    "volunteer_desc": "Receive notification if there were homeless animals around you",
    "user_desc": "Don't Receive notification if there were homeless animals around you",
    "ok_button": "ok",
    "accepted_injuries_button": "Show accepted injuries"
  },
  "notification": {
    "notification": "Notification",
    "injury_reported": "Injury has been reported",
    "click_details": "Click to view details"
  },
  "injury_details": {
    "injury_details": "Injury Details",
    "injury_picture": "Injury picture",
    "injury_location": "Injury location",
    "accept_button": "Accept",
    "reject_button": "Reject"
  }
};
static const Map<String, Map<String,dynamic>> mapLocales = {"en": en};
}

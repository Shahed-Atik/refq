// import 'dart:convert';
//
// import 'package:blue_bits_app/app/shared/models/user.dart';
// import 'package:blue_bits_app/app/shared/utils/storage_keys.dart';
// import 'package:shared_preferences/shared_preferences.dart';
//
// class StorageService {
//   static final _userLocalData = StorageService._();
//   late final SharedPreferences _sharedInstance;
//   StorageService._();
//
//   factory StorageService() {
//     return _userLocalData;
//   }
//
//   Future<void> initInstance() async {
//     _sharedInstance = await SharedPreferences.getInstance();
//   }
//
//   ///*************** user ****************
//   Future<void> setUser(User value) async {
//     await _sharedInstance.setString(
//         AppKeys.kUserInfo, jsonEncode(value.toJson()));
//   }
//
//   bool isAuthenticated() {
//     final string = _sharedInstance.getString(AppKeys.kUserInfo);
//     return string != null;
//   }
//
//   User getUser() {
//     final string = _sharedInstance.getString(AppKeys.kUserInfo)!;
//     Map<String, dynamic> d = json.decode(string);
//     User user = User.fromJson(d);
//     return user;
//   }
//
//   removeUser() {
//     _sharedInstance.remove(AppKeys.kUserInfo);
//   }
//
//   User getDefaultUser() {
//     final user = User.fromJson({
//       "id": -1,
//       "firstName": "firstName",
//       "lastName": "lastName",
//       "email": "atikShahed@gmail.com",
//       "year": 1,
//       "universityIdentifier": "1",
//       "emailConfirmed": false,
//       "refreshToken": "refreshToken",
//       "accessToken": 'accessToken'
//     });
//     return user;
//   }
//
//   ///***************** intro **************
//   Future<void> setIntroFlag() async {
//     await _sharedInstance.setBool(AppKeys.kIntroFlagKey, true);
//   }
//
//   bool isFirstOpen() {
//     final flag = _sharedInstance.getBool(AppKeys.kIntroFlagKey);
//     return flag == null;
//   }
//
//   removeIntroFlag() {
//     _sharedInstance.remove(AppKeys.kIntroFlagKey);
//   }
// }

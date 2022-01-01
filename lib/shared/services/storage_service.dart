import 'package:shared_preferences/shared_preferences.dart';

class StorageService {
  static final _userLocalData = StorageService._();
  late final SharedPreferences _sharedInstance;
  StorageService._();

  factory StorageService() {
    return _userLocalData;
  }

  Future<void> initInstance() async {
    _sharedInstance = await SharedPreferences.getInstance();
  }

  ///*************** user ****************
  Future<void> setUserProfile(bool isVolunteer) async {
    await _sharedInstance.setBool("User_Profile", isVolunteer);
  }

  bool isVolunteer() {
    final flag = _sharedInstance.getBool("User_Profile");
    return flag ?? false;
  }
}

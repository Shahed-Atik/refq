import 'package:dio/dio.dart';
import 'package:geolocator/geolocator.dart';
import 'package:refq_mongo/shared/export_shared.dart';

class MoreRepository {
  final Dio _dio;
  MoreRepository(Dio dio) : _dio = dio;

  ///post: /volunteer
  Future<String> setVolunteer({required Position loc}) async {
    try {
      final Response response = await _dio.post("volunteer", data: {
        "fcm": firebaseToken,
        "lat": loc.latitude,
        "lon": loc.longitude
      });
      return response.data;
    } on DioError catch (e) {
      throw e.error;
    }
  }

  ///put:  /volunteer
  removeVolunteer() async {
    try {
      await _dio.put("volunteer", data: {"fcm": firebaseToken});
    } on DioError catch (e) {
      throw e.error;
    }
  }

  // ///post: api/User/ReSendToken
  // reSendVerifyToken({required String userId}) async {
  //   try {
  //     await _dio.get("/User/ReSendToken", queryParameters: {"id": userId});
  //   } on DioError catch (e) {
  //     throw e.error;
  //   }
  // }
}

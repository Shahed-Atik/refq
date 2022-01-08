import 'package:dio/dio.dart';
import 'package:geolocator/geolocator.dart';

class MoreRepository {
  final Dio _dio;
  MoreRepository(Dio dio) : _dio = dio;

  ///post: /volunteer
  Future<String> setVolunteer({required Position loc}) async {
    try {
      final Response response = await _dio.post("volunteer", data: {
        //todo add fcm
        "fcm": "1",
        "lat": loc.latitude,
        "lon": loc.latitude
      });
      return response.data;
    } on DioError catch (e) {
      throw e.error;
    }
  }

  ///put:  /volunteer
  removeVolunteer() async {
    //todo add fcm
    try {
      await _dio.put("volunteer", data: {"fcm": "1"});
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

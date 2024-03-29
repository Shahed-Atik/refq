import 'package:dio/dio.dart';
import 'package:refq_mongo/app/accepted_injury/repository/accepted_injury_repository.dart';
import 'package:refq_mongo/shared/services/storage_service.dart';

class InjuryDetailsRepository {
  final Dio _dio;
  InjuryDetailsRepository(Dio dio) : _dio = dio;

  ///POST: accept Injury
  // https://refq-2021.herokuapp.com/post/accept
  Future<String?> acceptInjury({required String postId}) async {
    try {
      final String userId = StorageService().getUserId();
      final Response response = await _dio
          .post("post/accept", data: {"postId": postId, "volunteerId": userId});
      return response.data;
    } on DioError catch (e) {
      throw e.error;
    }
  }

  ///POST: refuse Injury
  //https://refq-2021.herokuapp.com/post/refuse
  Future<String?> refuseInjury({required String postId}) async {
    try {
      final String userId = StorageService().getUserId();
      final Response response = await _dio
          .post("post/refuse", data: {"postId": postId, "volunteerId": userId});
      return response.data;
    } on DioError catch (e) {
      throw e.error;
    }
  }

  ///PUT: send Injury Details
  Future<String?> sendDetails(
      {required String postId,
      required String description,
      required String name,
      required List<Injury> list}) async {
    try {
      final Response response = await _dio.put("post", data: {
        "id": postId,
        "img": "null",
        "description": description,
        "name": name,
        "injuries": list.map((e) => e.toJson()).toList()
      });
      return response.data;
    } on DioError catch (e) {
      throw e.error;
    }
  }
}

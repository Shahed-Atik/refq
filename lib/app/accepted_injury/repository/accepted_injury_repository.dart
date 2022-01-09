import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:refq_mongo/shared/services/storage_service.dart';

class AcceptedInjuryRepository {
  final Dio _dio;
  AcceptedInjuryRepository(Dio dio) : _dio = dio;

  ///get: get all Injuries
  //https://refq-2021.herokuapp.com/post/temp/vid/61daeb67a05ee01b5d37327d
  Future<List<Case>?> getInjuries() async {
    try {
      final String userId = StorageService().getUserId();
      // final Response response = await _dio.get("post/temp/vid/$userId");
      //todo
      final Response response =
          await _dio.get("post/temp/vid/61daeb67a05ee01b5d37327d");
      return caseFromJson(response.data);
    } on DioError catch (e) {
      throw e.error;
    }
  }
}

///*************** models****************
List<Case> caseFromJson(List str) =>
    List<Case>.from(str.map((x) => Case.fromJson(x)));

String caseToJson(List<Case> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Case {
  Case({
    required this.post,
  });

  String post;

  factory Case.fromJson(Map<String, dynamic> json) => Case(
        post: json["post"],
      );

  Map<String, dynamic> toJson() => {
        "post": post,
      };
}

import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:refq_mongo/shared/services/storage_service.dart';

class NotificationRepository {
  final Dio _dio;
  NotificationRepository(Dio dio) : _dio = dio;

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

  ///get: get
  //https://refq-2021.herokuapp.com/post/id/61db00f5fd73e01e3338c529
  Future<InjuryWithData?> getInjury({required String injuryId}) async {
    try {
      final Response response = await _dio.get("post/id/$injuryId");
      return InjuryWithData.fromJson(response.data);
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

///*************************************

class InjuryWithData {
  InjuryWithData({
    required this.posts,
  });

  Posts posts;

  factory InjuryWithData.fromJson(Map<String, dynamic> json) => InjuryWithData(
        posts: Posts.fromJson(json["posts"]),
      );

  Map<String, dynamic> toJson() => {
        "posts": posts.toJson(),
      };
}

class Posts {
  Posts({
    required this.id,
    required this.location,
    required this.date,
    required this.imges,
  });

  String id;
  Location location;
  DateTime date;
  List<String> imges;

  factory Posts.fromJson(Map<String, dynamic> json) => Posts(
        id: json["_id"],
        location: Location.fromJson(json["location"]),
        date: DateTime.parse(json["date"]),
        imges: List<String>.from(json["imges"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "location": location.toJson(),
        "date": date.toIso8601String(),
        "imges": List<dynamic>.from(imges.map((x) => x)),
      };
}

class Location {
  Location({
    required this.lat,
    required this.lon,
  });

  double lat;
  double lon;

  factory Location.fromJson(Map<String, dynamic> json) => Location(
        lat: json["lat"].toDouble(),
        lon: json["lon"].toDouble(),
      );

  Map<String, dynamic> toJson() => {
        "lat": lat,
        "lon": lon,
      };
}

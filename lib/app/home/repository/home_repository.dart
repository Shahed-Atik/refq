import 'dart:io';

import 'package:dio/dio.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:refq_mongo/shared/export_shared.dart';

class HomeRepository {
  final Dio _dio;
  HomeRepository(Dio dio) : _dio = dio;

  ///post: post
  Future<String?> sendCase(
      {required File image, required LatLng location}) async {
    try {
      String? imageURL = await _uploadImage(image);
      if (imageURL != null) {
        final Response response = await _dio.post("post", data: {
          "lat": double.parse((location.latitude).toStringAsFixed(6)),
          "lon": double.parse((location.longitude).toStringAsFixed(6)),
          "fcm": firebaseToken,
          "img": imageURL
        });
        return response.data;
      }
    } on DioError catch (e) {
      throw e.error;
    }
  }

  Future<String?> _uploadImage(File file) async {
    FormData data = FormData.fromMap({
      "image": await MultipartFile.fromFile(file.path),
    });
    try {
      final Response? response =
          await _dio.post("upload/image?image", data: data);
      if (response != null &&
          (response.statusCode == 200 || response.statusCode == 201)) {
        print(response.data["imageUrl"]);
        return response.data["imageUrl"];
      }
    } on DioError catch (e) {
      throw e.error;
    }
  }
}

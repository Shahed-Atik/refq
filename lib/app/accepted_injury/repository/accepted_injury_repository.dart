import 'package:dio/dio.dart';
import 'package:refq_mongo/app/notification/repository/notification_repository.dart';
import 'package:refq_mongo/shared/services/storage_service.dart';

class AcceptedInjuryRepository {
  final Dio _dio;
  AcceptedInjuryRepository(Dio dio) : _dio = dio;

  ///get: get all accepted Injuries
  Future<List<AcceptedInjury>?> getAcceptedInjuries() async {
    try {
      final String userId = StorageService().getUserId();
      final Response response = await _dio.get("post/vid/$userId");
      //
      // final Response response =
      //     await _dio.get("post/vid/61daeb67a05ee01b5d37327d");
      return acceptedInjuryFromJson(response.data);
    } on DioError catch (e) {
      throw e.error;
    }
  }
}

///*************** models****************

List<AcceptedInjury> acceptedInjuryFromJson(List str) =>
    List<AcceptedInjury>.from(str.map((x) => AcceptedInjury.fromJson(x)));

class AcceptedInjury {
  AcceptedInjury({
    required this.description,
    required this.id,
    required this.location,
    required this.date,
    required this.imges,
    required this.injuries,
  });

  String description;
  String id;
  Location location;
  DateTime date;
  List<String> imges;
  List<Injury> injuries;

  factory AcceptedInjury.fromJson(Map<String, dynamic> json) => AcceptedInjury(
        description: json["description"],
        id: json["_id"],
        location: Location.fromJson(json["location"]),
        date: DateTime.parse(json["date"]),
        imges: List<String>.from(json["imges"].map((x) => x)),
        injuries:
            List<Injury>.from(json["injuries"].map((x) => Injury.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "description": description,
        "_id": id,
        "location": location.toJson(),
        "date": date.toIso8601String(),
        "imges": List<dynamic>.from(imges.map((x) => x)),
        "injuries": List<dynamic>.from(injuries.map((x) => x.toJson())),
      };
}

class Injury {
  Injury({
    required this.k,
    required this.v,
  });

  String k;
  String v;

  factory Injury.fromJson(Map<String, dynamic> json) => Injury(
        k: json["k"],
        v: json["v"],
      );

  Map<String, dynamic> toJson() => {
        "k": k,
        "v": v,
      };
}

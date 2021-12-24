/// id : "d515e6a8-1d4b-4a32-b7f4-08d9b313c133"
/// firstName : "m"
/// lastName : ","
/// email : "atikShaed@gmail.com"
/// type : 1
/// year : 1
/// universityIdentifier : "1"
/// emailConfirmed : false
/// imagePath : null
/// refreshToken : "fCGrhUyi6ULLNQ01Hzd+748GHxZxacjjcLeu05hGXi8="
/// accessToken : "eyJhbGciOiJodHRwOi8vd3d3LnczLm9yZy8yMDAxLzA0L3htbGRzaWctbW9yZSNobWFjLXNoYTI1NiIsInR5cCI6IkpXVCJ9.eyJodHRwOi8vc2NoZW1hcy54bWxzb2FwLm9yZy93cy8yMDA1LzA1L2lkZW50aXR5L2NsYWltcy9uYW1laWRlbnRpZmllciI6ImQ1MTVlNmE4LTFkNGItNGEzMi1iN2Y0LTA4ZDliMzEzYzEzMyIsImh0dHA6Ly9zY2hlbWFzLm1pY3Jvc29mdC5jb20vd3MvMjAwOC8wNi9pZGVudGl0eS9jbGFpbXMvcm9sZSI6IlN0dWRlbnQiLCJleHAiOjE2MzgyNjE1NzMsImlzcyI6Imh0dHBzOi8vbG9jYWxob3N0OjQ0MzI1LyIsImF1ZCI6Imh0dHBzOi8vbG9jYWxob3N0OjQ0MzI1LyJ9.lzJUyYknNcluZQOo7KM5Xm3OenfD2HUmAw1FNPd0SG8"

class User {
  User({
    required String? id,
    required String? firstName,
    required String? lastName,
    required String? email,
    required int? year,
    required String? universityIdentifier,
    required bool? emailConfirmed,
    required String? refreshToken,
    required String? accessToken,
    int? type,
    dynamic imagePath,
  })  : _id = id,
        _firstName = firstName,
        _lastName = lastName,
        _email = email,
        _type = type,
        _year = year,
        _universityIdentifier = universityIdentifier,
        _emailConfirmed = emailConfirmed,
        _imagePath = imagePath,
        _refreshToken = refreshToken,
        _accessToken = accessToken;

  String? _id;
  String? _firstName;
  String? _lastName;
  String? _email;
  int? _type;
  int? _year;
  String? _universityIdentifier;
  bool? _emailConfirmed;
  dynamic _imagePath;
  String? _refreshToken;
  String? _accessToken;

  String? get id => _id;
  String? get firstName => _firstName;
  String? get lastName => _lastName;
  String? get email => _email;
  int? get type => _type;
  int? get year => _year;
  String? get universityIdentifier => _universityIdentifier;
  bool? get emailConfirmed => _emailConfirmed;
  dynamic get imagePath => _imagePath;
  String? get refreshToken => _refreshToken;
  String? get accessToken => _accessToken;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['firstName'] = _firstName;
    map['lastName'] = _lastName;
    map['email'] = _email;
    map['type'] = _type;
    map['year'] = _year;
    map['universityIdentifier'] = _universityIdentifier;
    map['emailConfirmed'] = _emailConfirmed;
    map['imagePath'] = _imagePath;
    map['refreshToken'] = _refreshToken;
    map['accessToken'] = _accessToken;
    return map;
  }

  User.fromJson(dynamic json) {
    _id = json['id'];
    _firstName = json['firstName'];
    _lastName = json['lastName'];
    _email = json['email'];
    _type = json['type'];
    _year = json['year'];
    _universityIdentifier = json['universityIdentifier'];
    _emailConfirmed = json['emailConfirmed'];
    _imagePath = json['imagePath'];
    _refreshToken = json['refreshToken'];
    _accessToken = json['accessToken'];
  }

  User copyWith({
    String? id,
    String? firstName,
    String? lastName,
    String? email,
    int? type,
    int? year,
    String? universityIdentifier,
    bool? emailConfirmed,
    dynamic imagePath,
    String? refreshToken,
    String? accessToken,
  }) {
    return User(
      id: id ?? _id,
      firstName: firstName ?? _firstName,
      lastName: lastName ?? _lastName,
      email: email ?? _email,
      type: type ?? _type,
      year: year ?? _year,
      universityIdentifier: universityIdentifier ?? _universityIdentifier,
      emailConfirmed: emailConfirmed ?? _emailConfirmed,
      imagePath: imagePath ?? _imagePath,
      refreshToken: refreshToken ?? _refreshToken,
      accessToken: accessToken ?? _accessToken,
    );
  }
}

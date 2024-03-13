import 'dart:convert';

class GenderResponse {
  bool? success;
  int? code;
  String? message;
  List<Gender>? gender;

  GenderResponse({
    this.success,
    this.code,
    this.message,
    this.gender,
  });

  factory GenderResponse.fromRawJson(String str) => GenderResponse.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory GenderResponse.fromJson(Map<String, dynamic> json) => GenderResponse(
    success: json["success"],
    code: json["code"],
    message: json["message"],
    gender: json["result"] == null ? [] : List<Gender>.from(json["result"]!.map((x) => Gender.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "success": success,
    "code": code,
    "message": message,
    "result": gender == null ? [] : List<dynamic>.from(gender!.map((x) => x.toJson())),
  };
}

class Gender {
  int? id;
  String? nameEn;
  String? nameAr;
  dynamic extraData;

  Gender({
    this.id,
    this.nameEn,
    this.nameAr,
    this.extraData,
  });

  factory Gender.fromRawJson(String str) => Gender.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Gender.fromJson(Map<String, dynamic> json) => Gender(
    id: json["id"],
    nameEn: json["nameEn"],
    nameAr: json["nameAr"],
    extraData: json["extraData"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "nameEn": nameEn,
    "nameAr": nameAr,
    "extraData": extraData,
  };
}

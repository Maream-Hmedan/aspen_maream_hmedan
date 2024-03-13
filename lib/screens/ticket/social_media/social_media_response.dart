import 'dart:convert';

class SocialMediaResponse {
  bool? success;
  int? code;
  String? message;
  List<Media>? media;

  SocialMediaResponse({
    this.success,
    this.code,
    this.message,
    this.media,
  });

  factory SocialMediaResponse.fromRawJson(String str) => SocialMediaResponse.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory SocialMediaResponse.fromJson(Map<String, dynamic> json) => SocialMediaResponse(
    success: json["success"],
    code: json["code"],
    message: json["message"],
    media: json["result"] == null ? [] : List<Media>.from(json["result"]!.map((x) => Media.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "success": success,
    "code": code,
    "message": message,
    "result": media == null ? [] : List<dynamic>.from(media!.map((x) => x.toJson())),
  };
}

class Media {
  int? masterSocialMediaId;
  String? masterSocialMediaNameEn;
  String? masterSocialMediaNameAr;
  int? masterSocialMediaOrderId;
  String? masterSocialMediaUrlLinkIos;
  String? masterSocialMediaUrlLinkAndroid;

  Media({
    this.masterSocialMediaId,
    this.masterSocialMediaNameEn,
    this.masterSocialMediaNameAr,
    this.masterSocialMediaOrderId,
    this.masterSocialMediaUrlLinkIos,
    this.masterSocialMediaUrlLinkAndroid,
  });

  factory Media.fromRawJson(String str) => Media.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Media.fromJson(Map<String, dynamic> json) => Media(
    masterSocialMediaId: json["masterSocialMediaId"],
    masterSocialMediaNameEn: json["masterSocialMediaNameEn"],
    masterSocialMediaNameAr: json["masterSocialMediaNameAr"],
    masterSocialMediaOrderId: json["masterSocialMediaOrderId"],
    masterSocialMediaUrlLinkIos: json["masterSocialMediaUrlLinkIos"],
    masterSocialMediaUrlLinkAndroid: json["masterSocialMediaUrlLinkAndroid"],
  );

  Map<String, dynamic> toJson() => {
    "masterSocialMediaId": masterSocialMediaId,
    "masterSocialMediaNameEn": masterSocialMediaNameEn,
    "masterSocialMediaNameAr": masterSocialMediaNameAr,
    "masterSocialMediaOrderId": masterSocialMediaOrderId,
    "masterSocialMediaUrlLinkIos": masterSocialMediaUrlLinkIos,
    "masterSocialMediaUrlLinkAndroid": masterSocialMediaUrlLinkAndroid,
  };
}

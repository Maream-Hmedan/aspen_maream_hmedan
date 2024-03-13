import 'dart:convert';

class SliderResponse {
  bool? success;
  int? code;
  String? message;
  List<SliderApp>? slider;

  SliderResponse({
    this.success,
    this.code,
    this.message,
    this.slider,
  });

  factory SliderResponse.fromRawJson(String str) => SliderResponse.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory SliderResponse.fromJson(Map<String, dynamic> json) => SliderResponse(
    success: json["success"],
    code: json["code"],
    message: json["message"],
    slider: json["result"] == null ? [] : List<SliderApp>.from(json["result"]!.map((x) => SliderApp.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "success": success,
    "code": code,
    "message": message,
    "result": slider == null ? [] : List<dynamic>.from(slider!.map((x) => x.toJson())),
  };
}

class SliderApp {
  int? lookupIntroId;
  String? lookupIntroTitleAr;
  String? lookupIntroTitleEn;
  String? lookupIntroDescriptionAr;
  String? lookupIntroDescriptionEn;
  String? lookupIntroImageUrl;

  SliderApp({
    this.lookupIntroId,
    this.lookupIntroTitleAr,
    this.lookupIntroTitleEn,
    this.lookupIntroDescriptionAr,
    this.lookupIntroDescriptionEn,
    this.lookupIntroImageUrl,
  });

  factory SliderApp.fromRawJson(String str) => SliderApp.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory SliderApp.fromJson(Map<String, dynamic> json) => SliderApp(
    lookupIntroId: json["lookupIntroId"],
    lookupIntroTitleAr: json["lookupIntroTitleAr"],
    lookupIntroTitleEn: json["lookupIntroTitleEn"],
    lookupIntroDescriptionAr: json["lookupIntroDescriptionAr"],
    lookupIntroDescriptionEn: json["lookupIntroDescriptionEn"],
    lookupIntroImageUrl: json["lookupIntroImageUrl"],
  );

  Map<String, dynamic> toJson() => {
    "lookupIntroId": lookupIntroId,
    "lookupIntroTitleAr": lookupIntroTitleAr,
    "lookupIntroTitleEn": lookupIntroTitleEn,
    "lookupIntroDescriptionAr": lookupIntroDescriptionAr,
    "lookupIntroDescriptionEn": lookupIntroDescriptionEn,
    "lookupIntroImageUrl": lookupIntroImageUrl,
  };
}

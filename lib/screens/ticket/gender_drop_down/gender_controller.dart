import 'dart:convert';

import 'package:aspen_project/configuration/api_end_point.dart';
import 'package:aspen_project/screens/http_wrapper/http_wrapper.dart';
import 'package:get/get.dart';

import 'gender_response.dart';

class SelectGender extends GetxController{
  var genderList=<Gender>[].obs;


  @override
  void onInit() {
    super.onInit();
    loadGender();
  }

  Future<void> loadGender() async {
    ApiResponse? response = await HttpWrapper(
      context: Get.context,
      url:ApiEndPoint.GENDER_LIST_URL
    ).post();
    if (response != null && response.body != null) {
      GenderResponse genderResponse =
      GenderResponse.fromRawJson((utf8.decode(response.body!)));
      // GenderResponse.fromJson(json.decode(utf8.decode(response.body!)));
      if (genderResponse.gender != null) {
        genderList.value = genderResponse.gender!;
      }
    }
  }
}
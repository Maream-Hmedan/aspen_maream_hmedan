import 'dart:convert';

import 'package:aspen_project/configuration/api_end_point.dart';
import 'package:aspen_project/screens/http_wrapper/http_wrapper.dart';
import 'package:aspen_project/screens/ticket/social_media/social_media_response.dart';
import 'package:get/get.dart';

enum ApiStatus { loading, empty, error, success }

class SocialMediaController extends GetxController {
  var myMediaList = <Media>[].obs;
  var status = ApiStatus.loading.obs;

  @override
  void onInit() {
    super.onInit();
    getSocialMediaFromApi();
  }

  getSocialMediaFromApi() async {
    ApiResponse? response = await HttpWrapper(
            context: Get.context, url: ApiEndPoint.SOCIAL_MEDIA_LIST_URL)
        .post();
    if (response != null && response.body != null) {
      SocialMediaResponse socialMediaResponse = SocialMediaResponse.fromJson(
          json.decode(utf8.decode(response.body!)));
      if (socialMediaResponse.media != null) {
        if (socialMediaResponse.media!.isEmpty) {
          status.value = ApiStatus.empty;
        }
        status.value = ApiStatus.success;
        myMediaList.value = socialMediaResponse.media!;
      }
    } else {
      status.value = ApiStatus.error;
    }
  }

  bool get isLoading => status.value == ApiStatus.loading;

  bool get isEmpty => status.value == ApiStatus.empty;

  bool get isError => status.value == ApiStatus.error;

  bool get isSuccess => status.value == ApiStatus.success;
}

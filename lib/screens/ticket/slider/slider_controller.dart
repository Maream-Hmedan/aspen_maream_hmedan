import 'dart:convert';
import 'package:aspen_project/configuration/api_end_point.dart';
import 'package:aspen_project/screens/http_wrapper/http_wrapper.dart';
import 'package:aspen_project/screens/ticket/slider/slider_response.dart';
import 'package:get/get.dart';


enum ApiStatus { loading, empty, error, success }

class SliderController extends GetxController{
 var sliders =<SliderApp>[].obs;
 var status =ApiStatus.loading.obs;
 @override
 void onInit() {
   super.onInit();
   getSliderFromApi();
 }

 getSliderFromApi() async {
   ApiResponse? response = await HttpWrapper(
     context: Get.context,
     url: ApiEndPoint.LIST_INTRO_URL
   ).post();
   if (response != null && response.body != null) {
     SliderResponse sliderResponse =
     SliderResponse.fromJson(json.decode(utf8.decode(response.body!)));
     if (sliderResponse.slider != null) {
       if(sliderResponse.slider!.isEmpty){
         status.value=ApiStatus.empty;
       }
       status.value = ApiStatus.success;
       sliders.value = sliderResponse.slider!;
     }else{
       status.value = ApiStatus.error;

     }
   }

 }
 bool get isLoading => status.value == ApiStatus.loading;
 bool get isEmpty => status.value == ApiStatus.empty;
 bool get isError => status.value == ApiStatus.error;
 bool get isSuccess => status.value == ApiStatus.success;

}
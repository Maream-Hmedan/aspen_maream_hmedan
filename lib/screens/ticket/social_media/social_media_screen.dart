import 'package:aspen_project/screens/ticket/social_media/social_media_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shimmer/shimmer.dart';
import 'package:sizer/sizer.dart';
import 'package:url_launcher/url_launcher.dart';

class SocialMediaScreen extends StatefulWidget {
  const SocialMediaScreen({super.key});

  @override
  State<SocialMediaScreen> createState() => _SocialMediaScreenState();
}

class _SocialMediaScreenState extends State<SocialMediaScreen> {
  // @override
  // void initState() {
  //   super.initState();
  //   WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
  //     _loadMyMediaList();
  //   });
  // }
  SocialMediaController controller = Get.put(SocialMediaController());

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 36.h,
      padding: EdgeInsets.zero,
      child: _socialMediaView(),
    );
  }

  Widget _socialMediaView() {
    return Obx(() {
      if (controller.isLoading) {
        return _getShimmerView();
      }
      if (controller.isSuccess) {
        return GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 4),
          itemBuilder: (_, index) {
            return GestureDetector(
              onTap: () async {
                await launchUrl(Uri.parse(
                    controller.myMediaList[index].masterSocialMediaNameEn ??
                        ""));
              },
              child: Container(
                margin: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage(
                            "assets/images/${controller.myMediaList[index].masterSocialMediaNameEn}.png"),
                        fit: BoxFit.cover)),
              ),
            );
          },
          itemCount: controller.myMediaList.length,
        );
      }
      return Container();
    });
  }

  // void _loadMyMediaList() async {
  //   ApiResponse? response = await HttpWrapper(
  //     context: context,
  //
  //   ).post();
  //   if (response != null && response.body != null) {
  //     SocialMediaResponse socialMediaResponse = SocialMediaResponse.fromJson(
  //         json.decode(utf8.decode(response.body!)));
  //     if (socialMediaResponse.media != null) {
  //       _myMediaList = socialMediaResponse.media;
  //     }
  //   }
  //
  //   if (mounted) {
  //     setState(() {});
  //   }
  //   // var url = Uri.parse(
  //   //     "http://e-commerce.albatross-solution.com/api/App/LookupMobile/GetSocialMediaList");
  //   // var response = await http.post(url);
  //   // if (response.statusCode == 200) {
  //   //   SocialMediaResponse socialMediaResponse =
  //   //       SocialMediaResponse.fromRawJson(response.body);
  //   //   if (socialMediaResponse.media != null) {
  //   //     _myMediaList = socialMediaResponse.media ?? [];
  //   //     if (_myMediaList!.isEmpty) {
  //   //       _myMediaList = null;
  //   //     }
  //   //   }
  //   // } else {
  //   //   _myMediaList = null;
  //   // }
  //   // if (mounted) {
  //   //   setState(() {});
  //   // }
  // }

  Widget _getShimmerView() {
    return GridView.builder(
      gridDelegate:
          const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 4),
      itemBuilder: (_, index) {
        return Shimmer.fromColors(
          baseColor: Colors.grey[300]!,
          highlightColor: Colors.grey[100]!,
          child: Container(
            margin: const EdgeInsets.all(20),
            color: Colors.white,
          ),
        );
      },
      itemCount: 10,
    );
  }
}

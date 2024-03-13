import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shimmer/shimmer.dart';
import 'package:sizer/sizer.dart';
import 'package:url_launcher/url_launcher.dart';

import 'social_media_response.dart';

class SocialMediaScreen extends StatefulWidget {
  const SocialMediaScreen({super.key});

  @override
  State<SocialMediaScreen> createState() => _SocialMediaScreenState();
}

List<Media>? _myMediaList = [];

class _SocialMediaScreenState extends State<SocialMediaScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      _loadMyMediaList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 36.h,
      padding: EdgeInsets.zero,
      child: _socialMediaView(),
    );
  }

  Widget _socialMediaView() {
    if (_myMediaList!.isEmpty) {
      return _getShimmerView();
    }
    return GridView.builder(
      gridDelegate:
          const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 4),
      itemBuilder: (_, index) {
        return GestureDetector(
          onTap: () async {
            await launchUrl(Uri.parse(
                _myMediaList![index].masterSocialMediaUrlLinkAndroid ?? ""));
          },
          child: Container(
            margin: const EdgeInsets.all(20),
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage(
                        "assets/images/${_myMediaList![index].masterSocialMediaNameEn}.png"),
                    fit: BoxFit.cover)),
          ),
        );
      },
      itemCount: _myMediaList!.length,
    );
  }

  void _loadMyMediaList() async {
    var url = Uri.parse(
        "http://e-commerce.albatross-solution.com/api/App/LookupMobile/GetSocialMediaList");
    var response = await http.post(url);
    if (response.statusCode == 200) {
      SocialMediaResponse socialMediaResponse =
          SocialMediaResponse.fromRawJson(response.body);
      if (socialMediaResponse.media != null) {
        _myMediaList = socialMediaResponse.media ?? [];
        if (_myMediaList!.isEmpty) {
          _myMediaList = null;
        }
      }
    } else {
      _myMediaList = null;
    }
    if (mounted) {
      setState(() {});
    }
  }

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

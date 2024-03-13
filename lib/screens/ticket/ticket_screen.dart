import 'package:aspen_project/screens/ticket/slider/slider_screen.dart';
import 'package:aspen_project/screens/ticket/social_media/social_media_screen.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:sizer/sizer.dart';

import 'gender_drop_down/gender_response.dart';
import 'gender_drop_down/gender_screen.dart';
import 'social_media/social_media_response.dart';
class TicketScreen extends StatefulWidget {
  const TicketScreen({super.key});

  @override
  State<TicketScreen> createState() => _TicketScreenState();
}

class _TicketScreenState extends State<TicketScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      _loadGender();
    });
  }
  List<Gender>? genderList = [];
  List<Media>? myMediaList = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(mainAxisSize: MainAxisSize.min,
          children: [
           const SizedBox(height: 20,),
         Text("Carousel With Indicator Slider",style: TextStyle(fontSize: 15.sp)),
            const SizedBox(height: 10,),
        const CarouselWithIndicatorDemo(),
            Row(
              children: [
                const SizedBox(width: 10,),
                GenderWidget(genderList: genderList!),
              ],
            ),
            const SizedBox(height: 5,),
             Text("Contact Us",style: TextStyle(fontSize: 15.sp)),
             const SocialMediaScreen(),

      ]),
    );
  }
  Future<void> _loadGender() async {
    var url = Uri.parse(
        "http://e-commerce.albatross-solution.com/api/App/LookupMobile/GetGenderList");
    var response = await http.post(url);
    if (response.statusCode == 200) {
      GenderResponse genderResponse = GenderResponse.fromRawJson(response.body);
      if (genderResponse.gender != null) {
        genderList = genderResponse.gender ?? [];
      }
      if (genderList!.isEmpty) {
        genderList = null;
      }
    }
    if (mounted) {
      setState(() {});
    }
  }


}

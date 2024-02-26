import 'package:aspen_project/screens/explore/search_view.dart';
import 'package:aspen_project/utils/ui/Custom_Drop_Down.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class ExploreScreen extends StatelessWidget {
  const ExploreScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SizedBox(
          width: 100.w,
          child: Column(
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    margin: const EdgeInsets.only(top: 15,bottom: 15),
                    width: 150,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,

                      children: [
                        Text(
                          "Explore",
                          style: TextStyle(
                            fontSize: 10.sp,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        Text(
                          '  Aspen',
                          style: TextStyle(
                            fontSize: 24.sp,
                            fontWeight: FontWeight.w500,
                            color: Colors.black,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const CustomDropDown(),
                ],
              ),
              const SearchView(),
            ],
          ),
        ),
      ),
    );
  }
}

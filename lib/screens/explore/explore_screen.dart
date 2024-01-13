import 'package:aspen_project/utils/ui/custom_drop_down.dart';
import 'package:aspen_project/screens/explore/search_view.dart';
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
          child:  Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
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
                  const SelectedLocationWidget(),
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

import 'package:aspen_project/configuration/app_images.dart';
import 'package:aspen_project/screens/bottom_nav_bar/bottom_nav_bar_screen.dart';
import 'package:aspen_project/utils/ui/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';



class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Image.asset(
            homeBackGround,
            fit: BoxFit.fitWidth,
            width: 100.w,
            height: 100.h,
          ),
          Positioned(
            top: 10.h,
            left: 10.h,
            right: 10.h,
            child: Image.asset(
              aspenLogo,
              fit: BoxFit.fill,
              width: 50.w,
              // height: 100.h,
            ),
          ),
          Positioned(
            top: 69.h,
            child: Container(
              margin: const EdgeInsets.only(left: 32),
              constraints: const BoxConstraints(
                maxWidth: 200,
              ),
              child: RichText(
                text: TextSpan(
                  style: TextStyle(
                    fontSize: 28.sp,
                    fontWeight: FontWeight.w500,
                    height: 1.13,
                    color: Colors.white,
                  ),
                  children: [
                    TextSpan(
                      text: 'Plan your',
                      style: TextStyle(
                        fontSize: 17.sp,
                        fontWeight: FontWeight.w400,
                        height: 1.13,
                        color: Colors.white,
                      ),
                    ),
                    const TextSpan(
                      text: ' ',
                    ),
                    TextSpan(
                      text: 'Luxurious Vacation',
                      style: TextStyle(
                        fontSize: 28.sp,
                        fontWeight: FontWeight.w500,
                        height: 1.13,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Positioned(
              top: 88.h,
              left: 5.h,
              right: 5.h,
              child: CustButton(
                buttonChild: const Text(
                  'Explore',
                  style: TextStyle(
                    fontSize: 25,
                    color: Colors.white,
                  ),
                ),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const BottomNavBarScreen()),
                  );
                },
              )),
        ],
      ),
    );
  }
}

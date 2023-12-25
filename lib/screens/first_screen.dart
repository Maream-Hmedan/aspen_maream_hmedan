import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import 'custom_button.dart';

class FirstScreen extends StatelessWidget {
  const FirstScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Image.asset(
            "assets/images/splash_bg.png",
            fit: BoxFit.fill,
            width: 100.w,
            height: 100.h,
          ),
          Positioned(
            top: 93,
            left: 57,
            right: 57,
            child: Image.asset(
              "assets/images/Aspenaspen_logo_text_img.png",
              fit: BoxFit.fill,
              width: 50.w,
              // height: 100.h,
            ),
          ),
          Container(
            margin: const EdgeInsets.only(top: 590, left: 32),
            constraints: const BoxConstraints(
              maxWidth: 200,
            ),
            child: RichText(
              text: const TextSpan(
                style: TextStyle(
                  fontSize: 40,
                  fontWeight: FontWeight.w500,
                  height: 1.1326045662,
                  color: Color(0xffffffff),
                ),
                children: [
                  TextSpan(
                    text: 'Plan your',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.w400,
                      height: 1.1326045662,
                      color: Color(0xffffffff),
                    ),
                  ),
                  TextSpan(
                    text: ' ',
                  ),
                  TextSpan(
                    text: 'Luxurious Vacation',
                    style: TextStyle(
                      fontSize: 40,
                      fontWeight: FontWeight.w500,
                      height: 1.1326045662,
                      color: Color(0xffffffff),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Positioned(
              top: 760,
              left: 32,
              right: 48,
              child: CustButton(
                buttonText: 'Explore',
                onTap: () {},
              ))
        ],
      ),
    );
  }
}

import 'package:aspen_project/screens/second_screen/home/text_form_widget.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import 'custom_drop_down.dart';
import 'home_tab/custom_tabs.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        height: 90.h,
        width: 100.w,
        child: Column(
         mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Stack(
              children: [
                SizedBox(
                  height: 18.h,
                  width: 100.w,
                ),
                const Positioned(
                    top: 44,
                    left: 20,
                    child: Text(
                      "Explore",
                      style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                      ),
                    )),
                const Positioned(left: 87, child: SelectedLocationWidget()),
                const Positioned(
                  top: 65,
                  left: 20,
                  child: Text(
                    'Aspen',
                    style: TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.w500,
                      height: 1.2175,
                      color: Colors.black,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(40, 132, 0, 0),
                  child: TextFormWidget(),
                )
              ],
            ),
            const SizedBox(height: 25,),
            const CustomTab(),


          ],
        ),
      ),
    );
  }
}

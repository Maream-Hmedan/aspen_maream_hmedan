import 'package:aspen_project/theme/theme_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import 'package:switcher_button/switcher_button.dart';
 // import your theme controller file

class SwitchButton extends StatelessWidget {
  const SwitchButton({super.key});

  @override
  Widget build(BuildContext context) {
    ThemeController themeController=Get.put(ThemeController());
    return Scaffold(
      body: Obx((){
        return Container(
          color: Theme.of(context).colorScheme.background,
          child: Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [

                  themeController.isDark.value
                      ? Text(
                    "Dark Mode Is Available",

                    style: TextStyle(fontSize: 15.sp),
                  )
                      : Text(
                    "Light Mode Is Available",
                    style: TextStyle(fontSize: 15.sp),
                  ),

                const SizedBox(
                  width: 10,
                ),
                SwitcherButton(
                  value: themeController.isDark.value,
                  offColor: Colors.cyanAccent,
                  onColor: Colors.redAccent,
                  onChange: (value) {
                    themeController.changeTheme();
                  },
                ),

              ],
            ),
          ),
        );
      }),

    );
  }
}

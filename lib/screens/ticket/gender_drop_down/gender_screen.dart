// ignore_for_file: must_be_immutable
import 'package:aspen_project/utils/ui/packages/custom_searchable_dropdown.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

import 'gender_controller.dart';

class GenderWidget extends StatelessWidget {
  GenderWidget({super.key});

   final String _selectGender = "Select Your Gender";

  SelectGender controller = Get.put(SelectGender());

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.zero,
      child: _genderWidgetView(),
    );
  }

  Widget _genderWidgetView() {
    return Obx(() {
      return CustomSearchableDropDown(
        items: controller.genderList,
        label: _selectGender,
        dropDownMenuItems: controller.genderList.map((e) => e.nameEn).toList(),
        menuPadding: const EdgeInsets.only(top: 2),
        showLabelInMenu: false,
        dropdownItemStyle: const TextStyle(fontSize: 14, color: Colors.black),
        dropdownBackgroundColor: Colors.grey.shade200,
        labelStyle: TextStyle(
          fontSize: 9.sp,
          fontWeight: FontWeight.w400,
          color: const Color(0xff5f5f5f),
        ),
        menuMode: true,
        menuHeight: 10.h,
        hideSearch: true,
        prefixIcon: const Icon(
          Icons.account_circle_outlined,
          color: Color(0xff0858D0),
          size: 16,
        ),
        onChanged: (value) {
        },
      );
    });
  }
}

import 'package:aspen_project/utils/ui/packages/custom_searchable_dropdown.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class CustomDropDown extends StatelessWidget {
   CustomDropDown({super.key});

  static const List<String> _locationList = [
    'Aspen,USA',
    'Jordan,Amman',
  ];

  String _selectedValue = 'Aspen,USA';

  @override
  Widget build(BuildContext context) {
    return CustomSearchableDropDown(
      items: _locationList,
      enabled: true,
      label: _selectedValue,
      onChanged: (value) {
        _selectedValue = value;
    
      },
    
    
      dropDownMenuItems: _locationList.map((e) {
            return e;
          }).toList() ,
      menuPadding: const EdgeInsets.only(top: 2),
      showLabelInMenu: false,
      dropdownItemStyle: const TextStyle(fontSize: 14, color: Colors.black),
      dropdownBackgroundColor: Colors.grey.shade200,
      labelStyle: const TextStyle(
        fontSize: 12,
        fontWeight: FontWeight.w400,
        height: 1.25,
        color: Color(0xff5f5f5f),
      ),
      menuMode: true,
      menuHeight: 10.h,
      hideSearch: true,
      prefixIcon: const Icon(
        Icons.location_on,
        color: Color(0xff0858D0),
        size: 16,
      ),
    );
  }
}

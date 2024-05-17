import 'package:aspen_project/configuration/app_colors.dart';
import 'package:flutter/material.dart';

ThemeData lightMode= ThemeData(
  brightness: Brightness.light,
  fontFamily: "montserrat",
  scaffoldBackgroundColor: AppColors.lightByColor,
  colorScheme: const ColorScheme.light(
    background: AppColors.lightByColor,
    secondary:Color(0xff97A0B2) ,
    onPrimaryContainer: AppColors.lightDivColor,
  ),
);



ThemeData darkMode= ThemeData(
  brightness: Brightness.dark,
  fontFamily: "montserrat",
  scaffoldBackgroundColor:AppColors.darkByColor,
  colorScheme: const ColorScheme.dark(
      background: AppColors.darkByColor,
      onPrimaryContainer: AppColors.darkDivColor,
      secondary: Colors.black,
  ),

);
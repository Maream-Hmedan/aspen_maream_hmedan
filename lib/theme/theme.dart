import 'package:flutter/material.dart';

ThemeData lightMode= ThemeData(
  brightness: Brightness.light,
  fontFamily: "montserrat",
  colorScheme: ColorScheme.light(
    background: Colors.white70,
    primary: Colors.white60,
    secondary: Colors.white54
  ),
);



ThemeData darkMode= ThemeData(
  brightness: Brightness.dark,
  fontFamily: "montserrat",
  colorScheme: ColorScheme.light(
      background: Colors.grey.shade700,
      primary: Colors.grey.shade500,
      secondary: Colors.grey.shade400
  ),

);
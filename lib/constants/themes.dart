import 'package:flutter/material.dart';
import 'package:my_portfolio/constants/fonts.dart';

class MyThemes {
  static ThemeData lightTheme = ThemeData(
    brightness: Brightness.dark,
    fontFamily: MyFonts.firaLight,
    scaffoldBackgroundColor: const Color(0xff010C15),
    colorScheme: ColorScheme.fromSeed(
      seedColor: Colors.blue.shade900,
      brightness: Brightness.dark,
    ),
  );
}

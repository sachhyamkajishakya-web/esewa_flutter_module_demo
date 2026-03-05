import 'package:flutter/material.dart';

class LightTheme {
  static const lightThemeTextColor = Color(0xff534b49);
  static final lightTheme = ThemeData(
    useMaterial3: true,
    brightness: Brightness.light,
    scaffoldBackgroundColor: Colors.white,
    cardColor: Color(0xfffaf8ef),
    primaryColor: lightThemeTextColor,
    primaryColorLight: Color(0xfff0ead0),
    dialogTheme: DialogThemeData(
      backgroundColor: Colors.white,
      titleTextStyle: TextStyle(
        color: Colors.black,
        fontSize: 24,
        fontWeight: FontWeight.w600,
      ),
      contentTextStyle: TextStyle(
        color: Colors.black,
        fontSize: 16,
        fontWeight: FontWeight.normal,
      ),
    ),
    textTheme: TextTheme(
      bodySmall: TextStyle(
        color: lightThemeTextColor,
        fontSize: 10,
        fontWeight: FontWeight.w400,
      ),
      bodyMedium: TextStyle(
        color: lightThemeTextColor,
        fontSize: 12,
        fontWeight: FontWeight.normal,
      ),
      bodyLarge: TextStyle(
        color: lightThemeTextColor,
        fontSize: 14,
        fontWeight: FontWeight.bold,
      ),
      titleSmall: TextStyle(
        color: lightThemeTextColor,
        fontSize: 24,
        fontWeight: FontWeight.w500,
      ),
      titleMedium: TextStyle(
        color: lightThemeTextColor,
        fontSize: 32,
        fontWeight: FontWeight.w500,
      ),
      titleLarge: TextStyle(
        color: lightThemeTextColor,
        fontSize: 40,
        fontWeight: FontWeight.bold,
        letterSpacing: 1.5,
      ),
    ),
  );
}

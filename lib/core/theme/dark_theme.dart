import 'package:flutter/material.dart';

class DartTheme {
  static const lightThemeTextColor = Color(0xff534b49);
  static final darkTheme = ThemeData(
    useMaterial3: true,
    brightness: Brightness.dark,
    scaffoldBackgroundColor: Colors.black,
    cardColor: Color(0xffe3e3e3),
    primaryColor: Colors.white,
    primaryColorLight: Colors.red,
    dividerColor: Color(0xFFe0e0e0),
    progressIndicatorTheme: ProgressIndicatorThemeData(
      circularTrackColor: Colors.white,
      color: lightThemeTextColor,
    ),
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
      bodySmall: TextStyle(fontSize: 10, fontWeight: FontWeight.w400),
      bodyMedium: TextStyle(fontSize: 12, fontWeight: FontWeight.normal),
      bodyLarge: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
      displaySmall: TextStyle(fontSize: 16, fontWeight: FontWeight.normal),
      displayMedium: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
      displayLarge: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
      titleSmall: TextStyle(fontSize: 24, fontWeight: FontWeight.w500),
      titleMedium: TextStyle(fontSize: 32, fontWeight: FontWeight.w500),
      titleLarge: TextStyle(
        fontSize: 40,
        fontWeight: FontWeight.bold,
        letterSpacing: 1.5,
      ),
    ),
  );
}

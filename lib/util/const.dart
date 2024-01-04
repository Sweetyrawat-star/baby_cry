import 'package:flutter/material.dart';

class Constants {
  static String appName = "To Your Door";

  //Colors for theme
//  Color(0xfffcfcff);
  static Color lightPrimary = Color(0xfffcfcff);
  static Color darkPrimary = Colors.black;
  static Color lightAccent = Colors.red;
  static Color darkAccent = Colors.red.shade400;
 // static Color lightBG = Colors.red[400];
  static Color darkBG = Colors.black;
  static Color ratingBG = Colors.yellow.shade600;

  static ThemeData lightTheme = ThemeData(
   // backgroundColor: lightBG,
    primaryColor: lightPrimary,
    hintColor: lightAccent,
    cardColor: lightAccent,
  //  scaffoldBackgroundColor: lightBG,

//      iconTheme: IconThemeData(
//        color: lightAccent,
//      ),

  );

  static ThemeData darkTheme = ThemeData(
    brightness: Brightness.dark,
    backgroundColor: darkBG,
    primaryColor: darkPrimary,
    hintColor: darkAccent,
    scaffoldBackgroundColor: darkBG,
    cardColor: darkAccent,
    appBarTheme: AppBarTheme(
      color: lightAccent,
    ),
  );
}

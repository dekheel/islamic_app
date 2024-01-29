import 'package:flutter/material.dart';

class MyTheme {
  // colors , light theme , dark theme , text theme

  static Color blackColor = const Color(0xff242424);
  static Color primaryLightColor = const Color(0xffB7935F);

  static ThemeData lightTheme = ThemeData(
      primaryColor: primaryLightColor,
      scaffoldBackgroundColor: Colors.transparent,
      appBarTheme: const AppBarTheme(
          backgroundColor: Colors.transparent,
          centerTitle: true,
          elevation: 0,
          titleTextStyle: TextStyle()),
      textTheme: TextTheme(
          titleLarge: TextStyle(
        color: blackColor,
        fontSize: 30,
        fontWeight: FontWeight.bold,
        fontFamily: "ElMessiri",
      )),
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
          backgroundColor: primaryLightColor,
          showUnselectedLabels: true,
          selectedItemColor: blackColor,
          selectedLabelStyle: TextStyle(),
          unselectedLabelStyle: TextStyle(),
          selectedIconTheme: IconThemeData(),
          unselectedIconTheme: IconThemeData()));
}

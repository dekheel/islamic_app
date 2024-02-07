import 'package:flutter/material.dart';

class MyTheme {
  // colors , light theme , dark theme , text theme

  static Color blackColor = const Color(0xff242424);
  static Color primaryLightColor = const Color(0xffB7935F);

  static Color primaryDarkColor = const Color(0xff141A2E);

  static Color whiteColor = const Color(0xffffffff);
  static Color yellowColor = const Color(0xfffacc1d);

  static ThemeData lightTheme = ThemeData(
      primaryColor: primaryLightColor,
      scaffoldBackgroundColor: Colors.transparent,
      appBarTheme: AppBarTheme(
          iconTheme: IconThemeData(color: blackColor),
          backgroundColor: Colors.transparent,
          centerTitle: true,
          elevation: 0,
          titleTextStyle: const TextStyle()),
      textTheme: TextTheme(
          titleLarge: TextStyle(
            color: blackColor,
            fontSize: 30,
            fontWeight: FontWeight.bold,
            fontFamily: "ElMessiriBold",
          ),
          titleMedium: TextStyle(
            color: blackColor,
            fontWeight: FontWeight.w600,
            fontSize: 25,
            fontFamily: "ElMessiriSimiBold",
          ),
          titleSmall: TextStyle(
            color: blackColor,
            fontSize: 25,
            fontWeight: FontWeight.w400,
            fontFamily: "ElMessiriRegular",
          )),
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
          backgroundColor: primaryLightColor,
          selectedItemColor: blackColor,
          selectedLabelStyle: TextStyle(
              fontSize: 12, color: blackColor, fontFamily: "Inter-Regular"),
          selectedIconTheme: const IconThemeData(
            size: 50,
          ),
          unselectedIconTheme: const IconThemeData(
            size: 40,
          )));

  static ThemeData darkTheme = ThemeData(
      primaryColor: primaryDarkColor,
      scaffoldBackgroundColor: Colors.transparent,
      appBarTheme: AppBarTheme(
          iconTheme: IconThemeData(color: whiteColor),
          backgroundColor: Colors.transparent,
          centerTitle: true,
          elevation: 0,
          titleTextStyle: const TextStyle()),
      textTheme: TextTheme(
          titleLarge: TextStyle(
            color: whiteColor,
            fontSize: 30,
            fontWeight: FontWeight.bold,
            fontFamily: "ElMessiriBold",
          ),
          titleMedium: TextStyle(
            color: whiteColor,
            fontWeight: FontWeight.w600,
            fontSize: 25,
            fontFamily: "ElMessiriSimiBold",
          ),
          titleSmall: TextStyle(
            color: whiteColor,
            fontSize: 25,
            fontWeight: FontWeight.w400,
            fontFamily: "ElMessiriRegular",
          )),
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
          backgroundColor: primaryDarkColor,
          selectedItemColor: yellowColor,
          selectedLabelStyle: TextStyle(
              fontSize: 12, color: whiteColor, fontFamily: "Inter-Regular"),
          selectedIconTheme: const IconThemeData(
            size: 50,
          ),
          unselectedIconTheme: const IconThemeData(
            size: 40,
          )));
}

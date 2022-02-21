import 'package:flutter/material.dart';
import 'package:starbucks_redesign/core/constants/colors.dart';
import 'package:starbucks_redesign/core/init/theme/panache/light_text_theme.dart';

final ThemeData lightTheme = ThemeData(
  fontFamily: "Inter",
  primarySwatch: Colors.green,
  brightness: Brightness.light,
  primaryColor: mainGreen, //xxx
  primaryColorBrightness: Brightness.dark,
  primaryColorLight: lightGreen,
  primaryColorDark: darkGreen,
  scaffoldBackgroundColor: backgroundColor,
  errorColor: mainRed,
  appBarTheme: AppBarTheme(
    backgroundColor: white,
    elevation: 10,
    shadowColor: appBarShadow.withOpacity(.2),
    titleTextStyle: const TextStyle(
        color: darkGreen, fontWeight: FontWeight.w500, fontSize: 20),
    iconTheme: const IconThemeData(
      color: darkGreen,
    ),
  ),
  bottomNavigationBarTheme: const BottomNavigationBarThemeData(
    backgroundColor: white,
    unselectedIconTheme: IconThemeData(color: grey),
    selectedIconTheme: IconThemeData(color: mainGreen),
  ),
  buttonTheme: const ButtonThemeData(buttonColor: mainGreen),

  textTheme: lightTextTheme,
  inputDecorationTheme: const InputDecorationTheme(
    fillColor: white,
    filled: true,
    border: OutlineInputBorder(
      borderSide: BorderSide(color: lightGrey, width: 1),
    ),
  ),
);

import 'package:ahs_website/constants/const.dart';
import 'package:flutter/material.dart';

ThemeData lightThemeData = ThemeData(
  textTheme: const TextTheme(
    bodyText1: TextStyle(),
    bodyText2: TextStyle(),
    subtitle1: TextStyle(),
    headline1: TextStyle(),
    headline5: TextStyle(),
    subtitle2: TextStyle(),
    headline4: TextStyle(),
    headline6: TextStyle(),
  ).apply(
    bodyColor: Colors.grey[800],
    displayColor: Colors.grey[800],
  ),
  primaryColor: Colors.white,
  fontFamily: "VarelaRound",
  buttonTheme: const ButtonThemeData(highlightColor: greenColor),
  scaffoldBackgroundColor: bgColor,
  canvasColor: secondaryColor,
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ButtonStyle(
      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
        RoundedRectangleBorder(borderRadius: BorderRadius.circular(30.0)),
      ),
      foregroundColor: MaterialStateProperty.all(greenColor),
      shadowColor: MaterialStateProperty.all(greenColor),
      backgroundColor: MaterialStateProperty.all(greenColor),
      textStyle:
          MaterialStateProperty.all(const TextStyle(color: Colors.black)),
    ),
  ),
  outlinedButtonTheme: OutlinedButtonThemeData(
    style: ButtonStyle(
      backgroundColor: MaterialStateProperty.all(Colors.black),
      side: MaterialStateProperty.all(
        const BorderSide(color: blueColor),
      ),
      textStyle: MaterialStateProperty.all(
        const TextStyle(
            color: greenColor, decoration: TextDecoration.underline),
      ),
      shape: MaterialStateProperty.all(
        const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.zero)),
      ),
    ),
  ),
);

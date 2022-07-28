import 'package:flutter/material.dart';

const brightness = Brightness.light;
const primaryColor = Color.fromRGBO(92, 42, 100, 1.0);
const backgroundColor = Color.fromRGBO(56, 32, 52, 1.0);
const accentColor = Color.fromRGBO(92, 42, 100, 1.0);
const bottomAppBarColor = Color.fromRGBO(56, 32, 52, 1.0);
const cursorColor = Colors.white;
const textStyleColor = Colors.white;

ThemeData appTheme() {
  return ThemeData(
    brightness: brightness,
    primaryColor: primaryColor,
    accentColor: accentColor,
    backgroundColor: backgroundColor,
    bottomAppBarColor: bottomAppBarColor,
    cursorColor: accentColor,
    appBarTheme: const AppBarTheme(
      textTheme: TextTheme(
        bodyText1: TextStyle(
          fontSize: 20,
          color: textStyleColor,
        ),
      ),
      color: Color.fromRGBO(56, 32, 52, 1.0),
      actionsIconTheme: IconThemeData(color: Colors.white),
      iconTheme: IconThemeData(color: Colors.white),
    ),
    textTheme: const TextTheme(
      button: TextStyle(
        color: Colors.white,
        fontFamily: "Montserrat",
      ),
      caption: TextStyle(
        fontFamily: "Montserrat",
      ),
      overline: TextStyle(
        fontFamily: "Montserrat",
      ),
    ),
  );
}

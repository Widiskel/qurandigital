// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

const appSoftPurple = Color(0xffB9A2D8);
const appOldBlue = Color(0xff431AA1);
const appSoftWhite = Color(0xffFAF8FC);
const appBluePurple = Color(0xff2E0D8A);
const appPurple = Color(0xff9345F2);

const appSoftPurpleDark = Color(0xff943DF4);
const appOldBlueDark = Color(0xff1E0771);
const appSoftWhiteDark = Color.fromARGB(255, 196, 174, 218);
const appBluePurpleDark = Color(0xff010313);
const appPurpleDark = Color(0xff2B0C8B);

ThemeData appLight = ThemeData(
    brightness: Brightness.light,
    floatingActionButtonTheme: FloatingActionButtonThemeData(
      backgroundColor: appOldBlue,
    ),
    scaffoldBackgroundColor: appSoftWhite,
    primaryColor: appPurple,
    tabBarTheme: TabBarTheme(
      indicator:
          UnderlineTabIndicator(borderSide: BorderSide(color: appOldBlue)),
      labelColor: appOldBlue,
      unselectedLabelColor: appSoftPurple,
    ),
    listTileTheme: ListTileThemeData(textColor: appOldBlue),
    textTheme: TextTheme(
        bodyText1: TextStyle(color: appOldBlue),
        bodyText2: TextStyle(color: appOldBlue)),
    appBarTheme: const AppBarTheme(backgroundColor: appOldBlue));

ThemeData appDark = ThemeData(
    brightness: Brightness.dark,
    tabBarTheme: TabBarTheme(
      indicator:
          UnderlineTabIndicator(borderSide: BorderSide(color: appSoftPurple)),
      labelColor: appSoftWhite,
      unselectedLabelColor: appSoftPurpleDark,
    ),
    floatingActionButtonTheme: FloatingActionButtonThemeData(
      backgroundColor: appSoftPurpleDark,
    ),
    scaffoldBackgroundColor: appOldBlueDark,
    primaryColor: appPurpleDark,
    listTileTheme: ListTileThemeData(textColor: appSoftWhite),
    textTheme: TextTheme(
        bodyText1: TextStyle(color: appSoftWhite),
        bodyText2: TextStyle(color: appSoftWhite)),
    appBarTheme: const AppBarTheme(backgroundColor: appOldBlueDark));

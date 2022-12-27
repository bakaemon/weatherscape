import 'dart:ui';

import 'package:flutter/material.dart';

class AppColors {
  // General
  static const darkPurple = Color.fromARGB(57, 52, 12, 131);
  static const lightPurple = Color.fromARGB(92, 35, 22, 85);
  static const darkcloud = [lightPurple, darkPurple];
  static const rainBlueLight = Color(0xFF4480C6);
  static const rainBlueDark = Color(0xFF364699);
  static const clearsky = [rainBlueLight, rainBlueDark];
  static const clearskyInverted = [rainBlueDark, rainBlueLight];
  static const accentColor = Color(0xFFe96e50);
  static const primaryGradient = clearskyInverted;

  // AppBar
  static const appBarTheme = rainBlueDark;

  // Drawer
  static const drawerHeaderBackground = appBarTheme;
  static const drawerBackground = Colors.white;
  static const drawerTextColor = Color.fromARGB(255, 87, 90, 100);
  static const drawerIconColor = Color.fromARGB(255, 87, 90, 100);
  static const drawerSelectedColor = Colors.grey;
  static const drawerSelectedTextColor = Colors.white;

  // Search Box
  static const searchBoxTheme = Colors.white;
  static const searchBoxTextColor = Colors.black;
  static const searchBoxIconColor = Colors.black;
  static const searchBoxSelectedColor = Colors.grey;
  static const searchBoxSelectedTextColor = Colors.white;
  static const searchButton = Colors.blueAccent;

  // Background
  static const backgroundGradient = primaryGradient;

}

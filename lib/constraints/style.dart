import 'dart:ui';

import 'package:flutter/material.dart';

final textStyleWithShadow = TextStyle(color: Colors.white, shadows: [
  BoxShadow(
    color: Colors.black12.withOpacity(0.25),
    spreadRadius: 1,
    blurRadius: 4,
    offset: const Offset(0, 0.5),
  )
]);

final defaultTextTheme = TextTheme(
    headline1: textStyleWithShadow,
    headline2: textStyleWithShadow,
    headline3: textStyleWithShadow,
    headline4: textStyleWithShadow,
    headline5: textStyleWithShadow,
    subtitle1: const TextStyle(color: Colors.white),
    bodyText2: const TextStyle(color: Colors.white),
    bodyText1: const TextStyle(color: Colors.white),
    caption: const TextStyle(color: Colors.white70, fontSize: 13),
    button: const TextStyle(color: Colors.white),
    subtitle2: const TextStyle(color: Colors.white),
    overline: const TextStyle(color: Colors.white),
    headline6: const TextStyle(color: Colors.white)

    
  );
final defaultTheme = ThemeData(
  brightness: Brightness.light,
  textTheme: defaultTextTheme,
);

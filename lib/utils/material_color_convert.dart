import 'package:flutter/material.dart';

/*
 * To use just simple provide the RGB value and call the mdColor straight up
 * e.g. CustomMaterialColor(88, 207, 194).mdColor
 */
class CustomMaterialColor {
  final Color color;

  CustomMaterialColor({required this.color});

  MaterialColor get materialColor {
    final r = color.red;
    final g = color.green;
    final b = color.blue;

    return MaterialColor(
      color.value,
      <int, Color>{
        50: Color.fromRGBO(r, g, b, .1),
        100: Color.fromRGBO(r, g, b, .2),
        200: Color.fromRGBO(r, g, b, .3),
        300: Color.fromRGBO(r, g, b, .4),
        400: Color.fromRGBO(r, g, b, .5),
        500: Color.fromRGBO(r, g, b, .6),
        600: Color.fromRGBO(r, g, b, .7),
        700: Color.fromRGBO(r, g, b, .8),
        800: Color.fromRGBO(r, g, b, .9),
        900: Color.fromRGBO(r, g, b, 1),
      },
    );
  }

}

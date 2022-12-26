import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:weatherscape/constraints/constraints.dart';

import 'weather_forecast.dart';

final textStyleWithShadow = TextStyle(color: Colors.white, shadows: [
  BoxShadow(
    color: Colors.black12.withOpacity(0.25),
    spreadRadius: 1,
    blurRadius: 4,
    offset: const Offset(0, 0.5),
  )
]);
final themeData = ThemeData(
  brightness: Brightness.light,
  textTheme: TextTheme(
    headline1: textStyleWithShadow,
    headline2: textStyleWithShadow,
    headline3: textStyleWithShadow,
    headline4: textStyleWithShadow,
    headline5: textStyleWithShadow,
    subtitle1: const TextStyle(color: Colors.white),
    bodyText2: const TextStyle(color: Colors.white),
    bodyText1: const TextStyle(color: Colors.white),
    caption: const TextStyle(color: Colors.white70, fontSize: 13),
  ),
);

class ForecastPage extends StatelessWidget {
  const ForecastPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: themeData,
      home: Container(
        width: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: AppColors.backgroundGradient,
          ),
        ),
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: const [
              Spacer(),
              SearchBox(),
              Spacer(),
              CurrentWeather(),
              Spacer(),
              DailyWeather(),
              Spacer(),
            ],
          ),
        ),
      ),
    );
  }
}

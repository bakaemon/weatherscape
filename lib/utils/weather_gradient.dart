import 'package:flutter/material.dart';

class WeatherGradient {
  WeatherGradient({required this.weatherMain});
  final String weatherMain;

  MaterialColor get gradientPrimaryColor {
    switch (weatherMain) {
      case 'Clear':
        return Colors.indigo;
      case 'Clouds':
        return Colors.grey;
      case 'Rain':
        return Colors.blueGrey;
      case 'Snow':
        return Colors.lightBlue;
      case 'Thunderstorm':
        return Colors.deepPurple;
      case 'Drizzle':
        return Colors.blueGrey;
      case 'Mist':
        return Colors.blueGrey;
      case 'Smoke':
        return Colors.blueGrey;
      case 'Haze':
        return Colors.blueGrey;
      case 'Dust':
        return Colors.blueGrey;
      case 'Fog':
        return Colors.blueGrey;
      case 'Sand':
        return Colors.blueGrey;
      case 'Ash':
        return Colors.blueGrey;
      case 'Squall':
        return Colors.blueGrey;
      case 'Tornado':
        return Colors.blueGrey;
      default:
        return Colors.blueGrey;
    }
  }
}

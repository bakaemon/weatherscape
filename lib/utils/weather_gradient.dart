import 'package:flutter/material.dart';

class WeatherGradient {
  WeatherGradient({required this.weatherMain});
  final String weatherMain;

  MaterialColor get gradientPrimaryColor {
    switch (weatherMain) {
      case 'Clouds':
      case 'Clear':
        return Colors.indigo;
      
        // return Colors.lightBlue;
      case 'Rain':
        return Colors.blueGrey;
      case 'Snow':
        return Colors.lightBlue;
      case 'Thunderstorm':
        return Colors.deepPurple;
      case 'Drizzle':
        return Colors.deepPurple;
      case 'Mist':
        return Colors.blueGrey;
      case 'Smoke':
        return Colors.blueGrey;
      case 'Haze':
        return Colors.blueGrey;
      case 'Dust':
        return Colors.grey;
      case 'Fog':
        return Colors.blueGrey;
      case 'Sand':
        return Colors.orange;
      case 'Ash':
        return Colors.grey;
      case 'Squall':
        return Colors.blueGrey;
      case 'Tornado':
        return Colors.blueGrey;
      default:
        return Colors.indigo;
    }
  }
}

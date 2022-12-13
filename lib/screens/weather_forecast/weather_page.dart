import 'package:flutter/material.dart';

import '../../constraints/constraints.dart';
import 'current_weather.dart';
import 'search_box.dart';

class WeatherPage extends StatelessWidget {
  const WeatherPage({Key? key, required this.city}) : super(key: key);
  final String city;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: AppColors.darkcloud,
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
              // HourlyWeather(),
              // Spacer(),
            ],
          ),
        ),
      ),
    );
  }
}

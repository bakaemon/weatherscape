import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:weather/weather.dart';
import 'package:weatherscape/constraints/constraints.dart';
import 'package:weatherscape/controllers/weather_detail_controller.dart';
import 'package:weatherscape/screens/weather_forecast/charts/uv_chart_page.dart';
import 'package:weatherscape/screens/weather_forecast/current_weather.dart';
import 'package:weatherscape/utils/weather_gradient.dart';

import 'location_controller.dart';

final currentLatLong = StateProvider<List<double>>((ref) => [0,0]);


final currentWeatherControllerProvider = FutureProvider((ref) async {
  final weather = WeatherFactory(ConstraintValues.weatherAPIKey);
  final weatherData =
      await weather.currentWeatherByCityName(ref.watch(cityProvider));
  ref.read(backgroundProvider.notifier).state =
      WeatherGradient(weatherMain: weatherData.weatherMain!)
          .gradientPrimaryColor;
  ref.read(currentLatLong.notifier).state = [
    weatherData.latitude!,
    weatherData.longitude!
  ];
  return weatherData;
});

final fiveDayWeatherController = FutureProvider((ref) {
  final weather = WeatherFactory(ConstraintValues.weatherAPIKey);
  return weather.fiveDayForecastByCityName(ref.watch(cityProvider));
});

final todayMaxMinController = FutureProvider((ref) async {
  final weather = WeatherFactory(ConstraintValues.weatherAPIKey);
  final fiveDayForecast =
      await weather.fiveDayForecastByCityName(ref.watch(cityProvider));
  final todayForecast = [
    for (var i in [0, 1, 2, 3, 4, 5, 6, 7]) fiveDayForecast[i]
  ];
  final todayMaxTemp = todayForecast.map((e) => e.tempMax).reduce(
      (value, element) =>
          value!.celsius! > element!.celsius! ? value : element);
  final todayMinTemp = todayForecast.map((e) => e.tempMin).reduce(
      (value, element) =>
          value!.celsius! < element!.celsius! ? value : element);
  return [todayMaxTemp, todayMinTemp];
});

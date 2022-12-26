import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:weather/weather.dart';
import 'package:weatherscape/constraints/constraints.dart';

import 'location_controller.dart';
final currentWeatherControllerProvider = FutureProvider((ref) {
  final weather = WeatherFactory(ConstraintValues.weatherAPIKey);
  return weather.currentWeatherByCityName(ref.watch(cityProvider));
});
final fiveDayWeatherController = FutureProvider((ref) {
  final weather = WeatherFactory(ConstraintValues.weatherAPIKey);
  return weather.fiveDayForecastByCityName(ref.watch(cityProvider));
});

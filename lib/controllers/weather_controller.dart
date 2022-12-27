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

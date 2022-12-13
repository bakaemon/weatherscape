
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:weather/weather.dart';
import 'package:weatherscape/screens/weather_forecast/current_weather_controller.dart';
import 'package:weatherscape/utils/widget_util.dart';

import '../../constraints/constraints.dart';
import '../../utils/weather_icon.dart';

class CurrentWeather extends ConsumerWidget {
  const CurrentWeather({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final city = ref.watch(cityProvider);
    final weatherDataValue = ref.watch(currentWeatherControllerProvider);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(city, style: Theme.of(context).textTheme.headline4),
        weatherDataValue.when(
          data: (weatherData) => CurrentWeatherContents(data: weatherData),
          loading: () => const Center(child: CircularProgressIndicator()),
          error: (e, s) => errorEvent(
            context, ref
          ),
        ),
      ],
    );
  }

  errorEvent(BuildContext context, WidgetRef ref) {
    return const Center(child: Text("Can't get weather data"));

  }
}

class CurrentWeatherContents extends ConsumerWidget {
  const CurrentWeatherContents({Key? key, required this.data})
      : super(key: key);
  final Weather data;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final textTheme = Theme.of(context).textTheme;

    final temp = data.temperature!.celsius!.toInt().toString();
    final minTemp = data.tempMin!.celsius!.toInt().toString();
    final maxTemp = data.tempMax!.celsius!.toInt().toString();
    final highAndLow = 'Max:$maxTemp° Min:$minTemp°';
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        WeatherIconImage(iconCode: data.weatherIcon!, size: 120),
        Text(temp, style: textTheme.headline2),
        Text(highAndLow, style: textTheme.bodyText2),
      ],
    );
  }
}

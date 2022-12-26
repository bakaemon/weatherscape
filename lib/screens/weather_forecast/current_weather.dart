import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:weather/weather.dart';
import 'package:weatherscape/config.dart';
import 'package:weatherscape/controllers/location_controller.dart';
import 'package:weatherscape/screens/weather_forecast/daily_weather.dart';
import 'package:weatherscape/controllers/weather_controller.dart';
import 'package:weatherscape/utils/unit_util.dart';
import 'package:weatherscape/utils/widget_util.dart';
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
          error: (e, s) {
            WidgetsBinding.instance.addPostFrameCallback((_) {
              var exceptionClassName = e.runtimeType.toString();
              var exceptionMessage = e.toString().contains("404") ? "City not found" : "Can't get weather data";
              WidgetTool.showNotifDialog(context, exceptionClassName, exceptionMessage);
            });
            return const Center(child: Text("Can't get weather data"));
          },
        ),
      ],
    );
  }
}

class CurrentWeatherContents extends ConsumerWidget {
  const CurrentWeatherContents({Key? key, required this.data})
      : super(key: key);
  final Weather data;
  final units = AppConfig.units;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final textTheme = Theme.of(context).textTheme;

    String temp = UnitUtil.getTemp(temp: data.temperature!, unit: units);
    final minTemp = UnitUtil.getTemp(temp: data.tempMin!, unit: units);
    final maxTemp = UnitUtil.getTemp(temp: data.tempMax!, unit: units);
    final highAndLow = 'Max:$maxTemp Min:$minTemp';
    return InkWell(
      onTap: () {
        ref.read(weatherWidgetProvider.notifier).state =
            const DailyWeatherWidget();
        //ref.invalidate(weatherWidgetProvider);
      },
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          WeatherIconImage(iconCode: data.weatherIcon!, size: 120),
          Text(temp, style: textTheme.headline2),
          Text(highAndLow, style: textTheme.bodyText2),
        ],
      ),
    );
  }
}

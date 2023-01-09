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
    final textTheme = Theme.of(context).textTheme;
    final city = ref.watch(cityProvider);
    final weatherDataValue = ref.watch(currentWeatherControllerProvider);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(city, style: textTheme.headline4),
        weatherDataValue.when(
          data: (weatherData) => CurrentWeatherContents(data: weatherData),
          loading: () => const Center(child: CircularProgressIndicator()),
          error: (e, s) {
            WidgetsBinding.instance.addPostFrameCallback((_) {
              var exceptionMessage = e.toString().contains("404")
                  ? "City not found"
                  : "Can't get weather data";
              WidgetTool.showNotifDialog(
                  context, "Error", exceptionMessage);
            });
            return Center(child: Text("Can't get weather data", style: textTheme.bodyText2,));
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
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        WeatherIconImage(iconCode: data.weatherIcon!, size: 120),
        Text(temp, style: textTheme.headline2),
        ref.watch(todayMaxMinController).when(
              data: (maxMin) => Text(
                  "Highest: ${UnitUtil.getTemp(temp: maxMin[0]!, unit: units)} / Lowest: ${UnitUtil.getTemp(temp: maxMin[1]!, unit: units)}",
                  style: textTheme.bodyText2),
              loading: () => const Center(child: CircularProgressIndicator()),
              error: (e, s) => const Center(),
            ),
      ],
    );
  }
}

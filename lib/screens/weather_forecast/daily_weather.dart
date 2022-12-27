import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:weather/weather.dart';
import 'package:weatherscape/config.dart';
import 'package:weatherscape/utils/unit_util.dart';
import 'package:weatherscape/utils/weather_icon.dart';
import 'package:intl/intl.dart';

import 'hourly_weather.dart';
import '../../controllers/weather_controller.dart';

class DailyWeather extends ConsumerWidget {
  const DailyWeather({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final forecastDataValue = ref.watch(fiveDayWeatherController);
    return forecastDataValue.when(
      data: (forecastData) {
        // API returns data points in 3-hour intervals -> 1 day = 8 intervals
        final items = [0, 8, 16, 24, 32];
        return DailyWeatherRow(
          weatherDataItems: [
            for (var i in items) forecastData[i],
          ],
        );
      },
      loading: () => const Center(child: CircularProgressIndicator()),
      error: (e, __) => const Spacer(),
    );
  }
}

class DailyWeatherRow extends StatelessWidget {
  const DailyWeatherRow({Key? key, required this.weatherDataItems})
      : super(key: key);
  final List<Weather> weatherDataItems;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: weatherDataItems
          .map((data) => DailyWeatherItem(
                data: data,
                position: weatherDataItems.indexOf(data),
              ))
          .toList(),
    );
  }
}

class DailyWeatherItem extends ConsumerWidget {
  const DailyWeatherItem({Key? key, required this.data, required this.position})
      : super(key: key);
  final Weather data;
  final int position;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final textTheme = Theme.of(context).textTheme;
    const fontWeight = FontWeight.normal;
    final temp =
        UnitUtil.getTemp(temp: data.temperature!, unit: AppConfig.units);
    return Expanded(
        child: Column(
      children: [
        Text(
          DateFormat.E().format(data.date!),
          style: textTheme.caption!.copyWith(fontWeight: fontWeight),
        ),
        const SizedBox(height: 8),
        WeatherIconImage(
          iconCode: data.weatherIcon!,
          size: 48,
        ),
        const SizedBox(height: 8),
        Text(
          temp,
          style: textTheme.bodyText1!.copyWith(fontWeight: fontWeight),
        ),
      ],
    ));
  }
}

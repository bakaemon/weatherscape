import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:weather/weather.dart';
import 'package:weatherscape/config.dart';
import 'package:weatherscape/controllers/weather_controller.dart';
import 'package:weatherscape/utils/unit_util.dart';
import 'package:weatherscape/utils/weather_icon.dart';

class HourlyWeather extends ConsumerWidget {
  const HourlyWeather({Key? key, required this.items}) : super(key: key);
  final List<int> items;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final forecastDataValue = ref.watch(fiveDayWeatherController);
    return forecastDataValue.when(
      data: (forecastData) {
        List<Weather> weatherDataItems = [];
        for (var i in items) {
          if (forecastData[i].weatherIcon != null) {
            weatherDataItems.add(forecastData[i]);
          }
        }
        return HourlyWeatherRow(weatherDataItems: weatherDataItems);
      },
      loading: () => const Center(child: CircularProgressIndicator()),
      error: (e, __) => const Spacer(),
    );
  }
}

class HourlyWeatherRow extends StatelessWidget {
  const HourlyWeatherRow({Key? key, required this.weatherDataItems})
      : super(key: key);
  final List<Weather> weatherDataItems;

  @override
  Widget build(BuildContext context) {
    if (weatherDataItems.isEmpty) return const SizedBox.shrink();
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: weatherDataItems
          .map((data) => HourlyWeatherItem(data: data))
          .toList(),
    );
  }
}

class HourlyWeatherItem extends StatelessWidget {
  const HourlyWeatherItem({Key? key, required this.data}) : super(key: key);
  final Weather data;

  @override
  Widget build(BuildContext context) {
    data;
    final textTheme = Theme.of(context).textTheme;
    const fontWeight = FontWeight.normal;
    final temp =
        UnitUtil.getTemp(temp: data.temperature!, unit: AppConfig.units);
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          DateFormat('HH:mm').format(data.date!),
          style: textTheme.bodyText1!.copyWith(fontWeight: fontWeight),
        ),
        const SizedBox(height: 8),
        WeatherIconImage(
          iconCode: data.weatherIcon!,
          size: 32,
        ),
        const SizedBox(height: 8),
        Text(
          temp,
          style: textTheme.bodyText1!.copyWith(fontWeight: fontWeight),
        ),
      ],
    );
  }
}

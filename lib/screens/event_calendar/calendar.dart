import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:weatherscape/controllers/weather_controller.dart';
import 'package:weatherscape/screens/custom_widgets/horizontal_calendar.dart';
import 'package:weatherscape/utils/widget_util.dart';

class Calendar extends ConsumerStatefulWidget {
  const Calendar({super.key});

  @override
  ConsumerState<Calendar> createState() => _CalendarState();
}

class _CalendarState extends ConsumerState<Calendar> {
  @override
  Widget build(BuildContext context) {
    return ref.watch(fiveDayWeatherController).when(
          data: (weatherList) {
            final dailyWeatherList = [
              for (var i in [0, 8, 16, 24, 32]) weatherList[i]
            ];
            return HorizontonalCalendar(
                onTap: () {}, weatherDataList: dailyWeatherList);
          },
          loading: () => const Center(child: CircularProgressIndicator()),
          error: (error, stack) {
            WidgetsBinding.instance.addPostFrameCallback((_) {
              var exceptionClassName = error.runtimeType.toString();
              var exceptionMessage = error.toString().contains("404")
                  ? "City not found"
                  : "Can't get weather data";
              WidgetTool.showNotifDialog(
                  context, exceptionClassName, exceptionMessage);
            });
            return const Center(child: Text("Can't get weather data"));
          },
        );
  }
}

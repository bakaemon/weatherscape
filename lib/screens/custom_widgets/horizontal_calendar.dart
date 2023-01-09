import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:weather/weather.dart';
import 'package:weatherscape/utils/date_util.dart';
import 'package:weatherscape/utils/unit_util.dart';
import 'package:weatherscape/utils/weather_icon.dart';

class HorizontonalCalendar extends StatefulWidget {
  List<Weather>? weatherDataList;

  HorizontonalCalendar({super.key, required this.onTap, this.weatherDataList});
  final void Function() onTap;
  @override
  State<HorizontonalCalendar> createState() => _HorizontonalCalendarState();
}

class _HorizontonalCalendarState extends State<HorizontonalCalendar> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: DateUtil.getDaysInMonth(),
        itemBuilder: (context, index) {
          var calendarItems = <Widget>[];
          final date = DateTime.now().add(Duration(days: index));
          for (var element in widget.weatherDataList!) {
            if (element.date!.day == date.day) {
              calendarItems.add(_buildCalendarItem(
                  date: date,
                  weatherIcon: element.weatherIcon!,
                  weatherMain: element.weatherMain!,
                  temperature: UnitUtil.getTemp(temp: element.temperature!)));
            }
          }
          return InkWell(
            onTap: widget.onTap,
            child: Row(
              children: calendarItems,
            ),
          );
        },
      ),
    );
  }

  Widget _buildCalendarItem(
      {required DateTime date,
      required String weatherIcon,
      required String weatherMain,
      required String temperature}) {
    return SizedBox(
      width: 100,
      child: Column(
        children: [
          Text(DateFormat('EEE').format(date)),
          Text(DateFormat('d').format(date)),
          WeatherIconImage(iconCode: weatherIcon, size: 50),
          Text(weatherMain),
          Text(temperature),
        ],
      ),
    );
      }
}

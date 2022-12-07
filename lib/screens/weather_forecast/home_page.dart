import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:weather/weather.dart';
import 'package:weatherscape/constraints.dart';
import 'package:location/location.dart';
import 'package:geocoding/geocoding.dart';
import 'package:weatherscape/screens/weather_forecast/weather_screen_component.dart';

import '../../utils/location_util.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  WeatherFactory weatherFactory =
      WeatherFactory(ConstraintValues.weatherAPIKey);
  late WeatherScreenComponent weatherScreenComponent;
  LocationData? locationData;
  // List<Weather> weatherHourlyList = [];
  List<Weather> weatherDailyList = [];

  @override
  Widget build(BuildContext context) {
    return startBuilders();
  }

  startBuilders() {
    return locationBuilder();
  }

  locationBuilder() {
    return FutureBuilder(
      future: LocationUtil.getLocation(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          locationData = snapshot.data as LocationData;
          return weatherBuilder(locationData!);
        } else {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );
  }

  weatherBuilder(LocationData locationData) {
    return FutureBuilder(
      future: weatherFactory.fiveDayForecastByLocation(
          locationData.latitude!, locationData.longitude!),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          weatherDailyList = snapshot.data as List<Weather>;
          weatherScreenComponent = WeatherScreenComponent(
              context: context,
              weathers: weatherDailyList,
              locationData: locationData);
          weatherScreenComponent.buildDailyForecast(weatherDailyList);
          return weatherScreenComponent.buildMainScreen();
        } else {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );
  }
}

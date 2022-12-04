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
  @override
  Widget build(BuildContext context) {
    WeatherFactory weatherFactory =
        WeatherFactory(ConstraintValues.weatherAPIKey);
    return FutureBuilder(
        future: LocationUtil.getLocation(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            LocationData? locationData = snapshot.data;
            return FutureBuilder(
                future: weatherFactory.currentWeatherByLocation(
                    locationData!.latitude!, locationData.longitude!),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    Weather weather = snapshot.data as Weather;
                    WeatherScreenComponent weatherScreenComponent =
                        WeatherScreenComponent(context: context, weather: weather, locationData: locationData);
                        weatherScreenComponent.buildHourlyForecast();
                        weatherScreenComponent.buildDailyForecast();
                        return weatherScreenComponent.buildMainScreen();
                  } else if (snapshot.hasError) {
                    return Center(
                      child: Text(
                        "Error: ${snapshot.error}",
                        style: GoogleFonts.roboto(
                          fontSize: 20,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    );
                  } else {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                });
          } else if (snapshot.hasError) {
            return Text("${snapshot.error}");
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        });
  }
}

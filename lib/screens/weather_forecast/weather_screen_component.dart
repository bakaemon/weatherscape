import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:geocoding/geocoding.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:location/location.dart';
import 'package:weather/weather.dart';
import 'package:weatherscape/config.dart';

class WeatherScreenComponent {
  BuildContext context;
  late Size size;
  late Brightness brightness;
  late bool isDarkMode;

  late String cityName;

  late int currTemp;

  late int maxTemp;

  late int minTemp;

  List<Weather> weathers;

  LocationData locationData;

  // late List<Widget> hourlyForecastComponent;
  late List<Widget> dailyForecastComponent;

  WeatherScreenComponent(
      {required this.context,
      required this.weathers,
      required this.locationData}) {
    size = MediaQuery.of(context).size;
    brightness = MediaQuery.of(context).platformBrightness;
    isDarkMode = brightness == Brightness.dark;
    cityName = weathers[0].areaName!;
    currTemp = weathers[0].temperature!.celsius!.round();
    maxTemp = weathers[0].tempMax!.celsius!.round();
    minTemp = weathers[0].tempMin!.celsius!.round();
  }

  Widget buildMainScreen() {
    return Scaffold(
      body: Center(
        child: Container(
          height: size.height,
          width: size.height,
          decoration: BoxDecoration(
            color: isDarkMode ? Colors.black : Colors.white,
          ),
          child: SafeArea(
            child: Stack(
              children: [
                SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: EdgeInsets.symmetric(
                          vertical: size.height * 0.01,
                          horizontal: size.width * 0.05,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            FaIcon(
                              FontAwesomeIcons.bars,
                              color: isDarkMode ? Colors.white : Colors.black,
                            ),
                            Align(
                              child: Text(
                                AppConfig.appName, //TODO: change app name
                                style: GoogleFonts.questrial(
                                  color: isDarkMode
                                      ? Colors.white
                                      : const Color(0xff1D1617),
                                  fontSize: size.height * 0.02,
                                ),
                              ),
                            ),
                            FaIcon(
                              FontAwesomeIcons.plusCircle,
                              color: isDarkMode ? Colors.white : Colors.black,
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                          top: size.height * 0.03,
                        ),
                        child: Align(
                          child: Text(
                            cityName,
                            style: GoogleFonts.questrial(
                              color: isDarkMode ? Colors.white : Colors.black,
                              fontSize: size.height * 0.06,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                          top: size.height * 0.005,
                        ),
                        child: Align(
                          child: Text(
                            'Today', //day
                            style: GoogleFonts.questrial(
                              color:
                                  isDarkMode ? Colors.white54 : Colors.black54,
                              fontSize: size.height * 0.035,
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                          top: size.height * 0.03,
                        ),
                        child: Align(
                          child: Text(
                            '$currTemp˚C', //curent temperature
                            style: GoogleFonts.questrial(
                              color: currTemp <= 0
                                  ? Colors.blue
                                  : currTemp > 0 && currTemp <= 15
                                      ? Colors.indigo
                                      : currTemp > 15 && currTemp < 30
                                          ? Colors.deepPurple
                                          : Colors.pink,
                              fontSize: size.height * 0.13,
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding:
                            EdgeInsets.symmetric(horizontal: size.width * 0.25),
                        child: Divider(
                          color: isDarkMode ? Colors.white : Colors.black,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                          top: size.height * 0.005,
                        ),
                        child: Align(
                          child: Text(
                            weathers[0].weatherDescription!, // weathers
                            style: GoogleFonts.questrial(
                              color:
                                  isDarkMode ? Colors.white54 : Colors.black54,
                              fontSize: size.height * 0.03,
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                          top: size.height * 0.03,
                          bottom: size.height * 0.01,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              '$minTemp˚C', // min temperature
                              style: GoogleFonts.questrial(
                                color: minTemp <= 0
                                    ? Colors.blue
                                    : minTemp > 0 && minTemp <= 15
                                        ? Colors.indigo
                                        : minTemp > 15 && minTemp < 30
                                            ? Colors.deepPurple
                                            : Colors.pink,
                                fontSize: size.height * 0.03,
                              ),
                            ),
                            Text(
                              '/',
                              style: GoogleFonts.questrial(
                                color: isDarkMode
                                    ? Colors.white54
                                    : Colors.black54,
                                fontSize: size.height * 0.03,
                              ),
                            ),
                            Text(
                              '$maxTemp˚C', //max temperature
                              style: GoogleFonts.questrial(
                                color: maxTemp <= 0
                                    ? Colors.blue
                                    : maxTemp > 0 && maxTemp <= 15
                                        ? Colors.indigo
                                        : maxTemp > 15 && maxTemp < 30
                                            ? Colors.deepPurple
                                            : Colors.pink,
                                fontSize: size.height * 0.03,
                              ),
                            ),
                          ],
                        ),
                      ),
                      // Padding(
                      //   padding: EdgeInsets.symmetric(
                      //     horizontal: size.width * 0.05,
                      //   ),
                      //   child: Container(
                      //     decoration: BoxDecoration(
                      //       borderRadius: const BorderRadius.all(
                      //         Radius.circular(10),
                      //       ),
                      //       color: isDarkMode
                      //           ? Colors.white.withOpacity(0.05)
                      //           : Colors.black.withOpacity(0.05),
                      //     ),
                      //     child: Column(
                      //       children: [
                      //         Align(
                      //           alignment: Alignment.centerLeft,
                      //           child: Padding(
                      //             padding: EdgeInsets.only(
                      //               top: size.height * 0.01,
                      //               left: size.width * 0.03,
                      //             ),
                      //             child: Text(
                      //               'Forecast for today',
                      //               style: GoogleFonts.questrial(
                      //                 color: isDarkMode
                      //                     ? Colors.white
                      //                     : Colors.black,
                      //                 fontSize: size.height * 0.025,
                      //                 fontWeight: FontWeight.bold,
                      //               ),
                      //             ),
                      //           ),
                      //         ),

                      //         Padding(
                      //           padding: EdgeInsets.all(size.width * 0.005),
                      //           child: SingleChildScrollView(
                      //             scrollDirection: Axis.horizontal,
                      //             child: Row(
                      //               children: hourlyForecastComponent,
                      //             ),
                      //           ),
                      //         ),
                      //       ],
                      //     ),
                      //   ),
                      // ),
                      Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: size.width * 0.05,
                          vertical: size.height * 0.02,
                        ),
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: const BorderRadius.all(
                              Radius.circular(10),
                            ),
                            color: Colors.white.withOpacity(0.05),
                          ),
                          child: Column(
                            children: [
                              Align(
                                alignment: Alignment.centerLeft,
                                child: Padding(
                                  padding: EdgeInsets.only(
                                    top: size.height * 0.02,
                                    left: size.width * 0.03,
                                  ),
                                  child: Text(
                                    '7-day forecast',
                                    style: GoogleFonts.questrial(
                                      color: isDarkMode
                                          ? Colors.white
                                          : Colors.black,
                                      fontSize: size.height * 0.025,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ),
                              Divider(
                                color: isDarkMode ? Colors.white : Colors.black,
                              ),
                              Padding(
                                padding: EdgeInsets.all(size.width * 0.005),
                                child: Column(
                                  children: dailyForecastComponent,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget buildForecastToday(String time, int temp, int wind, int rainChance,
      IconData weatherIcon, size, bool isDarkMode) {
    return Padding(
      padding: EdgeInsets.all(size.width * 0.025),
      child: Column(
        children: [
          Text(
            time,
            style: GoogleFonts.questrial(
              color: isDarkMode ? Colors.white : Colors.black,
              fontSize: size.height * 0.02,
            ),
          ),
          Row(
            children: [
              Padding(
                padding: EdgeInsets.symmetric(
                  vertical: size.height * 0.005,
                ),
                child: FaIcon(
                  weatherIcon,
                  color: isDarkMode ? Colors.white : Colors.black,
                  size: size.height * 0.03,
                ),
              ),
            ],
          ),
          Text(
            '$temp˚C',
            style: GoogleFonts.questrial(
              color: isDarkMode ? Colors.white : Colors.black,
              fontSize: size.height * 0.025,
            ),
          ),
          Row(
            children: [
              Padding(
                padding: EdgeInsets.symmetric(
                  vertical: size.height * 0.01,
                ),
                child: FaIcon(
                  FontAwesomeIcons.wind,
                  color: Colors.grey,
                  size: size.height * 0.03,
                ),
              ),
            ],
          ),
          Text(
            '$wind km/h',
            style: GoogleFonts.questrial(
              color: Colors.grey,
              fontSize: size.height * 0.02,
            ),
          ),
          Row(
            children: [
              Padding(
                padding: EdgeInsets.symmetric(
                  vertical: size.height * 0.01,
                ),
                child: FaIcon(
                  FontAwesomeIcons.umbrella,
                  color: Colors.blue,
                  size: size.height * 0.03,
                ),
              ),
            ],
          ),
          Text(
            '$rainChance %',
            style: GoogleFonts.questrial(
              color: Colors.blue,
              fontSize: size.height * 0.02,
            ),
          ),
        ],
      ),
    );
  }

  Widget buildForecastTodayAlt(String time, int temp, int wind, int rainChance,
      String weatherIcon, size, bool isDarkMode) {
    return Padding(
      padding: EdgeInsets.all(size.width * 0.025),
      child: Column(
        children: [
          Text(
            time,
            style: GoogleFonts.questrial(
              color: isDarkMode ? Colors.white : Colors.black,
              fontSize: size.height * 0.02,
            ),
          ),
          Row(
            children: [
              Padding(
                  padding: EdgeInsets.symmetric(
                    vertical: size.height * 0.005,
                  ),
                  child: Image.network(
                    'http://openweathermap.org/img/w/$weatherIcon.png',
                    height: size.height * 0.05,
                    width: size.width * 0.1,
                    fit: BoxFit.contain,
                  )
                ),
            ],
          ),
          Text(
            '$temp˚C',
            style: GoogleFonts.questrial(
              color: isDarkMode ? Colors.white : Colors.black,
              fontSize: size.height * 0.025,
            ),
          ),
          Row(
            children: [
              Padding(
                padding: EdgeInsets.symmetric(
                  vertical: size.height * 0.01,
                ),
                child: FaIcon(
                  FontAwesomeIcons.wind,
                  color: Colors.grey,
                  size: size.height * 0.03,
                ),
              ),
            ],
          ),
          Text(
            '$wind km/h',
            style: GoogleFonts.questrial(
              color: Colors.grey,
              fontSize: size.height * 0.02,
            ),
          ),
          Row(
            children: [
              Padding(
                padding: EdgeInsets.symmetric(
                  vertical: size.height * 0.01,
                ),
                child: FaIcon(
                  FontAwesomeIcons.umbrella,
                  color: Colors.blue,
                  size: size.height * 0.03,
                ),
              ),
            ],
          ),
          Text(
            '$rainChance %',
            style: GoogleFonts.questrial(
              color: Colors.blue,
              fontSize: size.height * 0.02,
            ),
          ),
        ],
      ),
    );
  }

  Widget buildSevenDayForecast(String time, int minTemp, int maxTemp,
      IconData weatherIcon, size, bool isDarkMode) {
    return Padding(
      padding: EdgeInsets.all(
        size.height * 0.005,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: size.width * 0.02,
                ),
                child: Text(
                  time,
                  style: GoogleFonts.questrial(
                    color: isDarkMode ? Colors.white : Colors.black,
                    fontSize: size.height * 0.025,
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: size.width * 0.25,
                ),
                child: FaIcon(
                  weatherIcon,
                  color: isDarkMode ? Colors.white : Colors.black,
                  size: size.height * 0.03,
                ),
              ),
              Align(
                child: Padding(
                  padding: EdgeInsets.only(
                    left: size.width * 0.15,
                  ),
                  child: Text(
                    '$minTemp˚C',
                    style: GoogleFonts.questrial(
                      color: isDarkMode ? Colors.white38 : Colors.black38,
                      fontSize: size.height * 0.025,
                    ),
                  ),
                ),
              ),
              Align(
                alignment: Alignment.centerRight,
                child: Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: size.width * 0.05,
                  ),
                  child: Text(
                    '$maxTemp˚C',
                    style: GoogleFonts.questrial(
                      color: isDarkMode ? Colors.white : Colors.black,
                      fontSize: size.height * 0.025,
                    ),
                  ),
                ),
              ),
            ],
          ),
          Divider(
            color: isDarkMode ? Colors.white : Colors.black,
          ),
        ],
      ),
    );
  }

  Widget buildSevenDayForecastAlt(String time, int minTemp, int maxTemp,
      String weatherMain, size, bool isDarkMode) {
    return Padding(
      padding: EdgeInsets.all(
        size.height * 0.005,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: size.width * 0.02,
                ),
                child: Text(
                  time,
                  style: GoogleFonts.questrial(
                    color: isDarkMode ? Colors.white : Colors.black,
                    fontSize: size.height * 0.025,
                  ),
                ),
              ),
              Padding(
                  padding: EdgeInsets.symmetric(
                    vertical: size.height * 0.005,
                  ),
                  child: Icon(getWeatherIcon(weatherMain, 6))
                  ),
              Align(
                child: Padding(
                  padding: EdgeInsets.only(
                    left: size.width * 0.15,
                  ),
                  child: Text(
                    '$minTemp˚C',
                    style: GoogleFonts.questrial(
                      color: isDarkMode ? Colors.white38 : Colors.black38,
                      fontSize: size.height * 0.025,
                    ),
                  ),
                ),
              ),
              Align(
                alignment: Alignment.centerRight,
                child: Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: size.width * 0.05,
                  ),
                  child: Text(
                    '$maxTemp˚C',
                    style: GoogleFonts.questrial(
                      color: isDarkMode ? Colors.white : Colors.black,
                      fontSize: size.height * 0.025,
                    ),
                  ),
                ),
              ),
            ],
          ),
          Divider(
            color: isDarkMode ? Colors.white : Colors.black,
          ),
        ],
      ),
    );
  }
  // /*
  // * The function is temporally do nothing for now
  // */
  // buildHourlyForecast([List<Weather> hourlyWeathers = const []]) {
  //   for (int i = 0; i < hourlyWeathers.length; i++) {
  //     hourlyForecastComponent.add(
  //       buildForecastTodayAlt(
  //         i == 0 ? 'Now' : "${hourlyWeathers[i].date!.hour}:00",
  //         getTemp(hourlyWeathers[i].temperature!),
  //         hourlyWeathers[i].windSpeed!.toInt(),
  //         0,
  //         hourlyWeathers[i].weatherIcon!,
  //         size,
  //         isDarkMode,
  //       ),
  //     );
  //   }
  // }

  buildDailyForecast([List<Weather> dailyWeathers = const []]) {
    dailyForecastComponent = [];
    for (int i = 0; i < dailyWeathers.length; i++) {
      dailyForecastComponent.add(
        buildSevenDayForecastAlt(
          i == 0
              ? 'Today'
              : "${dailyWeathers[i].date!.day}/${dailyWeathers[i].date!.month}",
          getTemp(dailyWeathers[i].tempMin!),
          getTemp(dailyWeathers[i].tempMax!),
          dailyWeathers[i].weatherMain!,
          size,
          isDarkMode,
        ),
      );
    }
  }

  int getTemp(Temperature temp) {
    if (AppConfig.units == "metric") {
      return temp.celsius!.round();
    } else {
      return temp.fahrenheit!.round();
    }
  }

  IconData getWeatherIcon(String weatherMain, int hour) {
    if (weatherMain == 'Clear') {
      if (hour >= 6 && hour <= 18) {
        return FontAwesomeIcons.sun;
      } else {
        return FontAwesomeIcons.moon;
      }
    } else if (weatherMain == 'Clouds') {
      return FontAwesomeIcons.cloud;
    } else if (weatherMain == 'Rain') {
      return FontAwesomeIcons.cloudRain;
    } else if (weatherMain == 'Snow') {
      return FontAwesomeIcons.snowflake;
    } else if (weatherMain == 'Thunderstorm') {
      return FontAwesomeIcons.bolt;
    } else if (weatherMain == 'Drizzle') {
      return FontAwesomeIcons.cloudShowersHeavy;
    } else {
      return FontAwesomeIcons.smog;
    }
  }
}

import 'dart:convert';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;
import 'package:weatherscape/constraints/constraints.dart';
import 'package:weatherscape/controllers/weather_controller.dart';

var weatherDetailController = FutureProvider<Map<String, dynamic>>((ref) async {
  List<double> latLong = ref.watch(currentLatLong);
  var uri = Uri.parse(
      'https://api.openweathermap.org/data/3.0/onecall?lat=${latLong[0]}&lon=${latLong[1]}&exclude=minutely,hourly,alerts&appid=${ConstraintValues.weatherAPIKey}');
  var request = http.Request('GET', uri);
  var response = await request.send();
  var responseBody =
      response.stream.transform(utf8.decoder).transform(json.decoder);
  // turn to map
  var responseData =
      await responseBody.map((event) => event as Map<String, dynamic>).first;
  var uvIndexHourly = [responseData['current']['uvi']];
  uvIndexHourly.add((responseData['hourly'] as List<dynamic>)
      .map((eachHour) => eachHour['uvi']));
  var uvIndexDaily =
      (responseData['daily'] as List<dynamic>).map((eachDay) => eachDay['uvi']);

  return {
    'current': responseData['current'],
    'uvIndexHourly': uvIndexHourly,
    'uvIndexDaily': uvIndexDaily,
  };
});

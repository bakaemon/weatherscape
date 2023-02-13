import 'dart:convert';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;
import 'package:weatherscape/constraints/constraints.dart';
import 'package:weatherscape/controllers/weather_controller.dart';

var weatherDetailController = FutureProvider<List< dynamic>>((ref) async {
  var apiKey1 = "openuv-mf1pgrle2l8hme-io";
  var apiKey2 = 'openuv-mf1pgrle2lg17z-io';
  var headers = {
    'x-access-token': apiKey1,
    'Content-Type': 'application/json',
  };

  List<double> latLong = ref.watch(currentLatLong);
  var uri = Uri.parse(
      "https://api.openuv.io/api/v1/forecast?lat=${latLong[0]}&lng=${latLong[1]}");
  // var uri = Uri.parse(
  // 'https://api.openweathermap.org/data/3.0/onecall?lat=${latLong[0]}&lon=${latLong[1]}&exclude=minutely,hourly,alerts&appid=${ConstraintValues.weatherAPIKey}');
  var request = http.Request('GET', uri);
  request.headers.addAll(headers);
  var response = await request.send();
  var responseBody =
      response.stream.transform(utf8.decoder).transform(json.decoder);
  // turn to map
  var responseData =
      await responseBody.map((dynamic event) => event["result"] as List<dynamic>).first;
  
  var uvIndexHourly = responseData.map((e) => [e["uv"], e["uv_time"]]).toList();

  return uvIndexHourly;
});

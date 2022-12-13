import 'package:flutter/material.dart';

class WeatherIconImage extends StatelessWidget {
  const WeatherIconImage({
    Key? key,
    required this.iconCode,
    this.size = 100,
  }) : super(key: key);

  final String iconCode;
  final double size;

  @override
  Widget build(BuildContext context) {
    return Image.network(
      "http://openweathermap.org/img/w/$iconCode.png",
      width: size,
      height: size,
    );
  }
}
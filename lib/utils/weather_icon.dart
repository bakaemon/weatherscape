import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
class WeatherIconImage extends StatelessWidget {
  const WeatherIconImage({
    Key? key,
    required this.iconCode,
    this.size = 500,
  }) : super(key: key);

  final String iconCode;
  final double size;

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: "http://openweathermap.org/img/wn/$iconCode@2x.png",
      width: size,
      height: size,
    );
  }
}
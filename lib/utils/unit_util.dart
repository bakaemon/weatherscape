import 'package:weather/weather.dart';

import 'speed.dart';

class UnitUtil {
  static String getTempUnit(String unit) {
    if (unit == 'imperial') {
      return '°F';
    } else if (unit == 'international') {
      return '°K';
    } else if (unit == 'metric') {
      return '°C';
    }
    return '°C';
  }
  static String getTemp({required Temperature temp, String unit="metric"}) {
    switch (getTempUnit(unit)) {
      case '°F':
        return '${temp.fahrenheit!.toInt()}°F';
      case '°K':
        return '${temp.kelvin!.toInt()}°K';
      default:
        return '${temp.celsius!.toInt()}°C';
    }
  }

  static String getSpeed({required Speed speed, String? unit}) {
    if (unit == 'imperial') {
      return '${speed.milesPerHour!} mph';
    } else if (unit == 'metric') {
      return '${speed.kilometersPerHour!} kph';
    } else {
      return '${speed.metersPerSecond!} m/s';
    }
  }
}

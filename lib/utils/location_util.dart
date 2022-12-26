import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
class LocationUtil {

  // get city name from location
  static Future<String> getCityName() async {
    var permission =  await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
    }
    Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
    List<Placemark> placemarks = await placemarkFromCoordinates(
        position.latitude, position.longitude);
    return placemarks[0].locality!;
  }


}
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:weatherscape/utils/location_util.dart';

final cityNameLocationController = FutureProvider((ref) async {
  final cityName = await LocationUtil.getCityName();
  ref.read(cityProvider.notifier).state = cityName;
  return cityName;
});
final cityNameLocationControllerNoChangeProvider = FutureProvider((ref) async {
  final cityName = await LocationUtil.getCityName();
  return cityName;
});
final cityProvider = StateProvider((ref) => 'Hanoi');

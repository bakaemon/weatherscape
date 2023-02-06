import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:weatherscape/constraints/constraints.dart';
import 'package:weatherscape/constraints/style.dart';
import 'package:weatherscape/controllers/location_controller.dart';
import 'package:weatherscape/screens/main_page.dart';
import 'package:weatherscape/screens/weather_forecast/search_box_v2.dart';
import 'package:weatherscape/utils/gradient_container.dart';

import 'weather_forecast.dart';

class ForecastPage extends ConsumerWidget {
  const ForecastPage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var icon = ref.read(cityProvider).isEmpty ? Icons.gps_off : Icons.gps_fixed;
    setActionBars(ref, [
      IconButton(
        icon: Icon(icon),
        onPressed: () {
          ref.watch(cityNameLocationController).whenData((value) {
            ref.read(cityProvider.notifier).state = value;
          });
        },
      )
    ]);
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: defaultTheme,
        home: GradientContainer(
          color: ref.watch(backgroundProvider),
          child: SafeArea(
            child: CustomScrollView(
              slivers: [
                SliverList(
                  delegate: SliverChildListDelegate(
                    [
                      const SearchBoxV2(),
                      const SizedBox(height: 20),
                      CurrentWeather(),
                      const SizedBox(height: 50),
                      const DailyWeather(),
                      const SizedBox(
                        height: 20,
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:weatherscape/controllers/weather_controller.dart';
import 'package:weatherscape/screens/weather_forecast/forecast_page.dart';
import 'package:weatherscape/utils/widget_util.dart';
import '../constraints/constraints.dart';
import 'drawer.dart';

class MainPage extends ConsumerStatefulWidget {
  const MainPage({Key? key}) : super(key: key);
  @override
  ConsumerState<ConsumerStatefulWidget> createState() => MainPageState();
}

final titleProvider = StateProvider((ref) => "Forecast");
final pageProvider = StateProvider<Widget>((ref) => const ForecastPage());
DateTime currentBackPressTime = DateTime.now();

class MainPageState extends ConsumerState<MainPage> {
  @override
  Widget build(BuildContext context) {
    return _buildPopScope(
        context,
        Scaffold(
          appBar: AppBar(
            title: Text(ref.watch(titleProvider)),
            backgroundColor: ref.watch(backgroundProvider)[800],
            elevation: 0,
          ),
          drawer: AppDrawer.buildDrawer(context, ref),
          body: ref.watch(pageProvider),
        ));
  }

  Widget _buildPopScope(BuildContext context, Widget child) {
    currentBackPressTime = DateTime.now(); // reset back press time
    return WillPopScope(
      onWillPop: () => onWillPop(context),
      child: child,
    );
  }

  // Back press event
  Future<bool> onWillPop(BuildContext context) {
    final now = DateTime.now();
    final difference =
        currentBackPressTime.difference(now).inMilliseconds.abs();

    if (difference < 500) {
      return Future.value(true);
    }
    currentBackPressTime = now;
    WidgetTool.showSnackBar(context, "Press back again to exit");
    return Future.value(false);
  }
}

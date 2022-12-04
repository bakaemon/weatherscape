import 'package:flutter/material.dart';
import 'package:weatherscape/config.dart';

import 'screens/weather_forecast/home_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(const App());
}

class App extends StatefulWidget {
  const App({Key? key}) : super(key: key);
  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: AppConfig.appName,
      home: HomePage(),
    );
  }
}

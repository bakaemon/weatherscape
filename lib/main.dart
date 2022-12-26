import 'package:flutter/material.dart';
import 'package:weatherscape/config.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'screens/main_page.dart';

void main() {
  runApp(const ProviderScope(child: MyApp()));
  // runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    
    return WillPopScope(
        child: const MaterialApp(
          title: AppConfig.appName,
          debugShowCheckedModeBanner: false,
          home: MainPage(),
        ),
        onWillPop: () => onWillPop(context));
  }

  Future<bool> onWillPop(BuildContext context) async {
    // DateTime currentBackPressTime = DateTime.now();
    // if (DateTime.now().difference(currentBackPressTime) >
    //     const Duration(seconds: 2)) {
    //   currentBackPressTime = DateTime.now();
    //   WidgetTool.showSnackBar(context, "Press back again to exit");
    //   return Future.value(false);
    // }
    return Future.value(false);
  }
}

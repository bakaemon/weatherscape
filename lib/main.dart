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
    
    return const MaterialApp(
      title: AppConfig.appName,
      debugShowCheckedModeBanner: false,
      home: MainPage(),
    );
  }


}

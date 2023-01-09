import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:weatherscape/config.dart';

import '../constraints/constraints.dart';
import 'event_calendar/event_calendar_page.dart';
import 'main_page.dart';
import 'weather_forecast/forecast_page.dart';

class AppDrawer {
  static Widget buildDrawer(BuildContext context, WidgetRef ref) {
    var gradientPrimaryColor = ref.watch(backgroundProvider);
    return Drawer(
      backgroundColor: Colors.white,
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          SizedBox(
            height: 120,
            child: DrawerHeader(
              decoration: BoxDecoration(
                color: gradientPrimaryColor[800],
              ),
              child: const Text(AppConfig.appName,
                  style: TextStyle(color: Colors.white, fontSize: 20)),
            ),
          ),
          buildDrawerItem(
              icon: Icons.sunny,
              text: "Forecast",
              onTap: () {
                ref.read(titleProvider.notifier).state = "Forecast";
                ref.read(pageProvider.notifier).state = const ForecastPage();
                Navigator.pop(context);
              }),
          buildDrawerItem(
            icon: Icons.calendar_month_outlined,
            text: 'Plans',
            onTap: () {
              ref.read(titleProvider.notifier).state = "Plans";
              ref.read(pageProvider.notifier).state = const EventCalendarPage();
              Navigator.pop(context);
            },
          ),
          buildDrawerItem(
            icon: Icons.info,
            text: 'About',
            onTap: () {
              Navigator.pop(context);
            },
          ),
        ],
      ),
    );
  }

  static Widget buildDrawerItem(
      {required IconData icon,
      required String text,
      required void Function()? onTap}) {
    return ListTile(
      leading: Icon(icon, color: Colors.blueAccent),
      title:
          Text(text, style: const TextStyle(color: Colors.black, fontSize: 16)),
      onTap: onTap,
    );
  }

  // build backpress scope of event

}

import 'package:flutter/material.dart';
import 'package:weatherscape/constraints/constraints.dart';
import 'package:weatherscape/screens/event_calendar/calendar.dart';

class EventCalendarPage extends StatelessWidget {
  const EventCalendarPage({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Container(
        width: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: AppColors.darkcloud,
          ),
        ),
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: const [
              Spacer(),
              Calendar(),
              Spacer()
            ],
          ),
        ),
      ),
    );
  }
}

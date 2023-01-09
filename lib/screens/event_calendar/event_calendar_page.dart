import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:weatherscape/constraints/constraints.dart';
import 'package:weatherscape/constraints/style.dart';
import 'package:weatherscape/controllers/weather_controller.dart';
import 'package:weatherscape/utils/gradient_container.dart';

class EventCalendarPage extends ConsumerWidget {
  const EventCalendarPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final textTheme = Theme.of(context).textTheme;
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: defaultTheme,
      home: GradientContainer(
        color: ref.watch(backgroundProvider),
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              const Spacer(),
              Center(
                  child: Text('TODO: Create weather calendar',
                      style: textTheme.bodyText2)),
              const Spacer()
            ],
          ),
        ),
      ),
    );
  }
}

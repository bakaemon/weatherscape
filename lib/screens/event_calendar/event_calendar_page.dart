import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:weatherscape/constraints/constraints.dart';
import 'package:weatherscape/constraints/style.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:weatherscape/screens/main_page.dart';
import 'package:weatherscape/utils/gradient_container.dart';

class EventCalendarPage extends ConsumerWidget {
  const EventCalendarPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    setActionBars(ref, []);
    final textTheme = Theme.of(context).textTheme;
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: defaultTheme,
      home: GradientContainer(
        // color: ref.watch(backgroundProvider),
        color: Colors.grey,
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              TableCalendar(
                firstDay: DateTime.utc(1930, 1, 1),
                lastDay: DateTime.utc(2100, 12, 31),
                focusedDay: DateTime.now(),
                calendarStyle: CalendarStyle(
                    defaultTextStyle: textTheme.bodyText2!,
                    outsideTextStyle:
                        textTheme.bodyText2!.copyWith(color: Colors.grey),
                    weekendTextStyle:
                        textTheme.bodyText2!.copyWith(color: Colors.red),
                    outsideDaysVisible: true,
                    markersAlignment: Alignment.bottomRight),
                headerStyle: HeaderStyle(
                  titleTextStyle: textTheme.headline6!,
                  formatButtonVisible: false,
                  leftChevronIcon: const Icon(Icons.chevron_left),
                  rightChevronIcon: const Icon(Icons.chevron_right),
                ),
                calendarBuilders: CalendarBuilders(
                  markerBuilder: (context, day, events) => events.isNotEmpty
                      ? Container(
                          margin: const EdgeInsets.all(4),
                          decoration: const BoxDecoration(
                            shape: BoxShape.rectangle,
                            color: Colors.lightBlue,
                          ),
                          alignment: Alignment.center,
                          width: 16,
                          height: 16,
                          child: Text(
                            '${events.length}',
                            style: const TextStyle(
                                color: Colors.white, fontSize: 12),
                          ),
                        )
                      : null,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

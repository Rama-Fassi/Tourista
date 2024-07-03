import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:tourista/constants.dart';

class CompactCalendarWidget extends StatefulWidget {
  const CompactCalendarWidget({super.key});

  @override
  State<CompactCalendarWidget> createState() => _CompactCalendarWidgetState();
}

class _CompactCalendarWidgetState extends State<CompactCalendarWidget> {
  CalendarFormat _calendarFormat = CalendarFormat.week;
  DateTime rangeStart = DateTime(2024, 6, 15);
  DateTime rangeEnd = DateTime(2024, 6, 20);

  @override
  Widget build(BuildContext context) {
    return TableCalendar(
      onFormatChanged: (format) {
        _calendarFormat = format;
        setState(() {});
      },
      calendarFormat: _calendarFormat,
      firstDay: rangeStart,
      lastDay: rangeEnd,
      focusedDay: rangeStart,
      calendarBuilders: CalendarBuilders(
        defaultBuilder: (context, date, _) {
          return Container(
            margin: const EdgeInsets.all(4),
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              color: kPrimaryColor,
            ),
            child: Center(
              child: Text(
                date.day.toString(),
                style: const TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

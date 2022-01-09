import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:flutter_todo/provider/calendar.dart';

import 'package:flutter_todo/widgets/todo/calendar_header.dart';
import 'package:flutter_todo/widgets/todo/calendar_footer.dart';

class TodoCalendar extends StatefulWidget {
  const TodoCalendar({Key? key}) : super(key: key);

  @override
  _TodoCalendarState createState() => _TodoCalendarState();
}

class _TodoCalendarState extends State<TodoCalendar> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CalendarHeader(),
        TableCalendar(
          selectedDayPredicate: (day) {
            return isSameDay(context.watch<CalendarData>().selectedDay, day);
          },
          onDaySelected: (selectedDay, focusedDay) {
            context.read<CalendarData>().changeSelectedDay(selectedDay);
            context.read<CalendarData>().changeFocusedDay(focusedDay);
          },
          onPageChanged: (focusedDay) {
            context.read<CalendarData>().changeFocusedDay(focusedDay);
          },
          onFormatChanged: (format) {
            if (context.watch<CalendarData>().calendarFormat != format) {
              context.read<CalendarData>().changeCalendarFormat(format);
            }
          },
          firstDay: DateTime.utc(2022, 1, 1),
          lastDay: DateTime.utc(2022, 4, 1),
          focusedDay: context.watch<CalendarData>().focusedDay,
          calendarFormat: context.watch<CalendarData>().calendarFormat,
          currentDay: DateTime.now().add(Duration(hours: 9)),
          headerVisible: false,
        ),
        CalendarFotter(),
      ],
    );
  }
}

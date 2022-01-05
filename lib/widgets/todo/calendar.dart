import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:flutter_todo/provider/todo.dart';

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
            return isSameDay(context.watch<TodoData>().selectedDay, day);
          },
          onDaySelected: (selectedDay, focusedDay) {
            context.read<TodoData>().changeSelectedDay(selectedDay);
            context.read<TodoData>().changeFocusedDay(focusedDay);
          },
          onPageChanged: (focusedDay) {
            context.read<TodoData>().changeFocusedDay(focusedDay);
          },
          onFormatChanged: (format) {
            if (context.watch<TodoData>().calendarFormat != format) {
              context.read<TodoData>().changeCalendarFormat(format);
            }
          },
          firstDay: DateTime.utc(2022, 1, 1),
          lastDay: DateTime.utc(2022, 4, 1),
          focusedDay: context.watch<TodoData>().focusedDay,
          calendarFormat: context.watch<TodoData>().calendarFormat,
          currentDay: DateTime.now().add(Duration(hours: 9)),
          headerVisible: false,
        ),
        CalendarFotter(),
      ],
    );
  }
}

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:flutter_todo/provider/todo.dart';

import 'package:flutter_todo/widgets/todo/calendar_header.dart';

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
            return isSameDay(context.watch<Todo>().selectedDay, day);
          },
          onDaySelected: (selectedDay, focusedDay) {
            context.read<Todo>().changeSelectedDay(selectedDay);
            context.read<Todo>().changeFocusedDay(focusedDay);
          },
          onPageChanged: (focusedDay) {
            context.read<Todo>().changeFocusedDay(focusedDay);
          },
          onFormatChanged: (format) {
            if (context.watch<Todo>().calendarFormat != format) {
              context.read<Todo>().changeCalendarFormat(format);
            }
          },
          firstDay: DateTime.utc(2022, 1, 1),
          lastDay: DateTime.utc(2022, 4, 1),
          focusedDay: context.watch<Todo>().focusedDay,
          calendarFormat: context.watch<Todo>().calendarFormat,
          currentDay: DateTime.now().add(Duration(hours: 9)),
          // headerVisible: false,
        ),
      ],
    );
  }
}

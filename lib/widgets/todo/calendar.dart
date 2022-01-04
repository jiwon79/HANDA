import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:flutter_todo/provider/todo.dart';

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
        Text(DateFormat('yyyy-MM-dd').format(context.watch<Todo>().selectedDay)),
        TableCalendar(
          selectedDayPredicate: (day) {
            return isSameDay(context.watch<Todo>().selectedDay, day);
          },
          onDaySelected: (selectedDay, focusedDay) {
            print(selectedDay);
            print(focusedDay);
            context.read<Todo>().changeSelectedDay(selectedDay);
            context.read<Todo>().changeFocusedDay(focusedDay);
          },
          onPageChanged: (focusedDay) {
            context.read<Todo>().changeFocusedDay(focusedDay);
          },
          firstDay: DateTime.utc(2022, 1, 1),
          lastDay: DateTime.utc(2022, 4, 1),
          focusedDay: context.watch<Todo>().focusedDay,
        ),
      ],
    );
  }
}

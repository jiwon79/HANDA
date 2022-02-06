import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:intl/intl.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:flutter_todo/provider/calendar.dart';

class Calendar extends StatelessWidget {
  const Calendar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TableCalendar(
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
      startingDayOfWeek: StartingDayOfWeek.monday,
      currentDay: DateTime.now().add(Duration(hours: 9)),
      headerVisible: false,
      calendarBuilders: CalendarBuilders(
        dowBuilder: (context, day) {
          final text = DateFormat.E().format(day);
          return Center(
            child: Text(text,
              style: TextStyle(
                fontSize: 12,
                fontFamily: 'noto',
                fontWeight: FontWeight.w700,
                color: dayColor(day),
              )
            ),
          );
        },
        defaultBuilder: (context, day, focusedDay) {
          return Container(
            color: Colors.blue,
            margin: EdgeInsets.all(3),
            child: Center(
              child: Text(day.day.toString()),
            ),
          );
        },
        // todayBuilder: (context, day, focusedDay) {
        //   return Center(
        //     child: Text(day.day.toString()),
        //   );
        // },
        // selectedBuilder: (context, day, focusedDay) {
        //   return Center(
        //     child: Text(day.day.toString()),
        //   );
        // },
      ),
    );
  }
}

Color dayColor(DateTime day) {
  switch (day.weekday) {
    case DateTime.saturday:
      return Color(0xff232D88);
    case DateTime.sunday:
      return Color(0xffc33232);
    default:
      return Colors.black;
  }
}

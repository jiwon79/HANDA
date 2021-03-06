import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

class CalendarData with ChangeNotifier {
  DateTime _selectedDay = DateTime.now().add(Duration(hours: 9));
  DateTime _focusedDay = DateTime.now().add(Duration(hours: 9));
  CalendarFormat _calendarFormat = CalendarFormat.week;

  DateTime get selectedDay => _selectedDay;
  DateTime get focusedDay => _focusedDay;
  CalendarFormat get calendarFormat => _calendarFormat;

  void changeSelectedDay(day) {
    _selectedDay = day;
    notifyListeners();
  }

  void changeFocusedDay(day) {
    _focusedDay = day;
    notifyListeners();
  }

  void changeCalendarFormat(format) {
    if (format == '월') _calendarFormat = CalendarFormat.month;
    if (format == '2주') _calendarFormat = CalendarFormat.twoWeeks;
    if (format == '주') _calendarFormat = CalendarFormat.week;
    notifyListeners();
  }
}
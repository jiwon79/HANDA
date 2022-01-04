import 'package:flutter/material.dart';

class Todo with ChangeNotifier {
  DateTime _selectedDay = DateTime.now().add(Duration(hours: 9));
  DateTime _focusedDay = DateTime.now().add(Duration(hours: 9));
  DateTime get selectedDay => _selectedDay;
  DateTime get focusedDay => _focusedDay;

  void changeSelectedDay(day) {
    _selectedDay = day;
    notifyListeners();
  }

  void changeFocusedDay(day) {
    _focusedDay = day;
    notifyListeners();
  }
}

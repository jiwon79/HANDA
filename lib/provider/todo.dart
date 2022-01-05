import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

class TodoData with ChangeNotifier {
  DateTime _selectedDay = DateTime.now().add(Duration(hours: 9));
  DateTime _focusedDay = DateTime.now().add(Duration(hours: 9));
  CalendarFormat _calendarFormat = CalendarFormat.week;

  DateTime get selectedDay => _selectedDay;
  DateTime get focusedDay => _focusedDay;
  CalendarFormat get calendarFormat => _calendarFormat;

  List<Todo> _todos = [
    Todo(name: '자기'),
    Todo(name: '잠자기'),
    Todo(name: '낮잠자기'),
    Todo(name: '저녘에 잠자리에 들기'),
    Todo(name: '잠 푹 자기'),
  ];

  List<Todo> get todos => _todos;

  int get todoCount {
    return _todos.length;
  }

  void addTodo(String newTodoName) {
    _todos.add(Todo(name: newTodoName));
    notifyListeners();
  }

  void updateTodo(Todo todo) {
    todo.toggleDone();
    notifyListeners();
  }

  void deleteTodo(Todo todo) {
    _todos.remove(todo);
    notifyListeners();
  }

  void changeSelectedDay(day) {
    _selectedDay = day;
    notifyListeners();
  }

  void changeFocusedDay(day) {
    _focusedDay = day;
    notifyListeners();
  }

  void changeCalendarFormat(format) {
    if (format == 'month') _calendarFormat = CalendarFormat.month;
    if (format == 'two weeks') _calendarFormat = CalendarFormat.twoWeeks;
    if (format == 'week') _calendarFormat = CalendarFormat.week;
    notifyListeners();
  }
}

class Todo {
  final String name;
  bool isDone;

  Todo({this.name = 'aa', this.isDone = false});

  void toggleDone() {
    isDone = !isDone;
  }
}

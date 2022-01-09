import 'package:flutter/material.dart';

class TodoData with ChangeNotifier {
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
}

class Todo {
  final String name;
  bool isDone;

  Todo({this.name = 'aa', this.isDone = false});

  void toggleDone() {
    isDone = !isDone;
  }
}

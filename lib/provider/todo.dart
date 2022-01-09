import 'package:flutter/material.dart';
import 'package:flutter_todo/models/todo_model.dart';

class TodoData with ChangeNotifier {
  List<Todo> _todos = [
    Todo(name: '자기', isDone: false),
    Todo(name: '잠자기', isDone: false),
    Todo(name: '낮잠자기', isDone: false),
    Todo(name: '저녘에 잠자리에 들기', isDone: false),
    Todo(name: '잠 푹 자기', isDone: false),
  ];

  List<Todo> get todos => _todos;

  int get todoCount {
    return _todos.length;
  }

  void addTodo(String newTodoName) {
    _todos.add(Todo(name: newTodoName, isDone: false));
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
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_todo/models/todo_model.dart';
import 'package:flutter_todo/services/todo_api.dart';

class TodoData with ChangeNotifier {
  List<Todo> _todos = [];
  List<Todo> get todos => _todos;

  Future getTodoList() async {
    Response<dynamic> response =  await TodoApi().getTodoData();
    _todos = response.data.todoList;
  }

  int get todoCount {
    return _todos.length;
  }

  void addTodo() {
    _todos.add(Todo(name: 'new', isDone: false, isEditing: true, id: '11'));
    notifyListeners();
  }

  void updateTodo(Todo todo) {
    todo.toggleDone();
    notifyListeners();
  }

  void updateTodoName(Todo todo, String updateName) {
    todo.updateName(updateName);
    todo.toggleEditing();
    notifyListeners();
  }

  void deleteTodo(Todo todo) {
    _todos.remove(todo);
    notifyListeners();
  }

}
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_todo/models/todo_model.dart';
import 'package:flutter_todo/services/todo_api.dart';
import 'package:intl/intl.dart';

class TodoData with ChangeNotifier {
  Map<String, List<Todo>> _todoMap= {};
  List<Todo> _todos = [];

  Map<String, List<Todo>> get todoMap => _todoMap;
  List<Todo> get todos => _todos;

  Future getTodoList() async {
    Response<dynamic> response =  await TodoApi().getTodoData();
    for (Todo todo in response.data.todoList) {
      if (_todoMap[todo.dueDate] == null) {
        _todoMap[todo.dueDate] = [todo];
      } else {
        _todoMap[todo.dueDate]!.add(todo);
      }
    }
    _todos = response.data.todoList;
  }

  int get todoCount {
    return _todos.length;
  }

  int get todoDoneCount {
    return _todos.where((Todo element) => element.isDone).length;
  }

  List<Todo> getTodosSelectedDay(DateTime date) {
    String dateFormat = DateFormat('yyyy-MM-dd').format(date);

    if (_todoMap[dateFormat] == null) {
      return [];
    }
    return _todoMap[dateFormat]!;
  }



  void addTodo(DateTime date) async {
    var requestData = {
      'title': 'new',
      'due_date': DateFormat('yyyy-MM-dd').format(date),
    };
    var todoResponse = await TodoApi().addTodoRequest(requestData);
    print(todoResponse);

    _todos.add(Todo(
        name: todoResponse.data.name,
        isDone: todoResponse.data.isDone,
        isEditing: true,
        id: todoResponse.data.id,
        dueDate: todoResponse.data.dueDate,
    ));
    notifyListeners();
  }

  void updateTodo(Todo todo) async {
    Map<String, dynamic> requestData = {
      'title': todo.name,
      'due_date': todo.dueDate,
      'is_done': !todo.isDone,
    };
    todo.toggleDone();
    notifyListeners();
    await TodoApi().updateTodoRequest(todo.id, requestData);
  }

  void updateTodoName(Todo todo, String updateName) async {
    Map<String, dynamic> requestData = {
      'title': updateName,
      'due_date': todo.dueDate,
      'is_done': todo.isDone,
    };
    todo.updateName(updateName);
    todo.toggleEditing();
    notifyListeners();
    await TodoApi().updateTodoRequest(todo.id, requestData);
  }

  void deleteTodo(Todo todo) async {
    _todos.remove(todo);
    notifyListeners();
    await TodoApi().deleteTodoRequest(todo.id);
  }
}
import 'package:dio/dio.dart';
import 'package:flutter_todo/models/todo_model.dart';
import 'package:flutter_todo/services/http_service.dart';

class TodoApi {
  late HttpService http;

  TodoApi() {
    http = HttpService();
  }

  Future getTodoData() async {
    late Response response;
    late TodoListResponse todoListResponse;
    try {
      response = await http.getRequest('/users/me/todos');
      if (response.statusCode == 200) {
        todoListResponse = TodoListResponse.fromJson(response.data);
        response.data = todoListResponse;
      }
      return response;
    } on DioError catch (e) {
      print(e.response);
      throw(Exception('UnExpected error!!!'));
    }
  }


  Future addTodoRequest(data) async {
    late Response response;
    late Todo todoResponse;
    try {
      response = await http.postRequest('/todos/', data);
      if (response.statusCode == 201) {
        todoResponse = Todo.fromJson(response.data);
        response.data = todoResponse;
      }
      return response;
    } on DioError catch (e) {
      print(e.response);
      throw(Exception('UnExpected error!!!'));
    }
  }

  Future deleteTodoRequest(String todoId) async {
    late Response response;
    try {
      response = await http.deleteRequest('/todos/'+todoId);
      if (response.statusCode == 204) {

      } else if (response.statusCode == 401) {
        print('delete request unauthorized');
      }
      return response;
    } on DioError catch (e) {
      print(e.response);
      throw(Exception('UnExpected error!!!'));
    }
  }
}
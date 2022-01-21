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
    late TodoResponse todoResponse;
    try {
      response = await http.getRequest('/users/me/todos');
      if (response.statusCode == 200) {
        todoResponse = TodoResponse.fromJson(response.data);
        response.data = todoResponse;
      }
      return response;
    } on DioError catch (e) {
      print(e.response);
      throw(Exception('UnExpected error!!!'));
    }
  }
}
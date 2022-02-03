import 'package:dio/dio.dart';
import 'package:flutter_todo/models/auth_model.dart';
import 'package:flutter_todo/services/http_service.dart';

class AuthApi {
  late HttpService http;

  AuthApi() {
    http = HttpService();
  }

  Future registerRequest(data) async {
    late Response response;
    late RegisterResponse registerResponse;
    try {
      response = await http.postRequest("/auth/register", data);

      if (response.statusCode == 201) {
        registerResponse = RegisterResponse.fromJson(response.data);
        response.data = registerResponse;
      } else {
        print("There is some problem status code not 201");
      }
      return response;
    } on DioError catch (e) {
      print(e.response);
      print(e.response!.statusCode);
    }
  }

  Future<Response> loginRequest(data) async {
    late Response response;
    late LoginResponse loginResponse;
    try {
      response = await http.postRequest('/auth/login', data);
      if (response.statusCode == 200) {
        loginResponse = LoginResponse.fromJson(response.data);
        response.data = loginResponse;
      }
      return response;
    } on DioError catch (e) {
      print(e.response);
      throw(Exception('UnExpected error!!!'));
    }
  }
}
import 'package:dio/dio.dart';
import 'package:flutter_todo/models/auth_model.dart';
import 'package:flutter_todo/services/http_service.dart';

class AuthApi {
  late HttpService http;

  AuthApi() {
    http = HttpService();
  }

  Future registerApi(data) async {
    late Response response;
    late RegisterResponse registerResponse;
    try {
      response = await http.postRequest("/auth/register", data);
      print(response);

      if (response.statusCode == 201) {
        registerResponse = RegisterResponse.fromJson(response.data);
        return registerResponse;
      } else {
        print("There is some problem status code not 201");
        return response.statusCode;
      }
    } on DioError catch (e) {
      print(e.response);
      print(e.response!.statusCode);
    }
  }
}
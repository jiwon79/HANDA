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

      if (response.statusCode == 200) {
        registerResponse = RegisterResponse.fromJson(response.data);
        return registerResponse;
      } else {
        print("There is some problem status code not 200");
        return null;
      }
    } on Exception catch (e) {
      print(e);
    }
  }
}
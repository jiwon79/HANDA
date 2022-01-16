import 'package:dio/dio.dart';
import 'package:dio/dio.dart';
import 'package:flutter_todo/models/user_model.dart';
import 'package:flutter_todo/services/http_service.dart';

class UserApi {
  late HttpService http;

  UserApi() {
    http = HttpService();
  }
  // late Response response;
  // late RegisterResponse registerResponse;
  // try {
  // response = await http.postRequest("/auth/register", data);
  //
  // if (response.statusCode == 201) {
  // registerResponse = RegisterResponse.fromJson(response.data);
  // return registerResponse;
  // } else {
  // print("There is some problem status code not 201");
  // return response.statusCode;
  // }
  // } on DioError catch (e) {
  // print(e.response);
  // print(e.response!.statusCode);
  // }

  Future getMyData() async {
    late Response response;
    late MyDataResponse myDateResponse;

    try {
      response = await http.getRequest('/users/me');
      return response;
    } on DioError catch(e) {
      print(e.response);

    }
  }
}
import 'package:dio/dio.dart';
import 'package:flutter_todo/models/user_model.dart';
import 'package:flutter_todo/services/http_service.dart';

class UserApi {
  late HttpService http;

  UserApi() {
    http = HttpService();
  }

  Future getMyData() async {
    late Response response;
    late UserData userDataResponse;

    try {
      response = await http.getRequest('/users/me');
      if (response.statusCode == 200) {
        userDataResponse = UserData.fromJson(response.data);
        response.data = userDataResponse;
      }
      return response;
    } on DioError catch(e) {
      print(e.response);
      throw(Exception('UnExpected error!!!'));
    }
  }
}
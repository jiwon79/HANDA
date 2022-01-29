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
    late MyDataResponse myDateResponse;

    try {
      response = await http.getRequest('/users/me');
      if (response.statusCode == 200) {
        myDateResponse = MyDataResponse.fromJson(response.data);
        response.data = myDateResponse;
      }
      return response;
    } on DioError catch(e) {
      print(e.response);
      throw(Exception('UnExpected error!!!'));
    }
  }
}
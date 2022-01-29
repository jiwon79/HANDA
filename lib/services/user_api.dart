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
    late User userDataResponse;

    try {
      response = await http.getRequest('/users/me');
      if (response.statusCode == 200) {
        userDataResponse = User.fromJson(response.data);
        response.data = userDataResponse;
      }
      return response;
    } on DioError catch(e) {
      print(e.response);
      throw(Exception('UnExpected error!!!'));
    }
  }

  Future getMyFollowingList() async {
    late Response response;
    late UserList followingListResponse;

    try {
      response = await http.getRequest('/users/me/followings');
      if (response.statusCode == 200) {
        followingListResponse = UserList.fromJson(response.data);
        response.data = followingListResponse;
      }
      return response;
    } on DioError catch(e) {
      print(e.response);
      throw(Exception('UnExpected error!!!'));
    }
  }

  Future getMyFollowerList() async {
    late Response response;
    late UserList followerListResponse;

    try {
      response = await http.getRequest('/users/me/followers');
      if (response.statusCode == 200) {
        followerListResponse = UserList.fromJson(response.data);
        response.data = followerListResponse;
      }
      return response;
    } on DioError catch(e) {
      print(e.response);
      throw(Exception('UnExpected error!!!'));
    }
  }
}
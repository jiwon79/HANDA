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
      Map<String, bool> parameters = {'detail': true};
      response = await http.getRequest(endPoint: '/users/me', parameters: parameters);
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
      response = await http.getRequest(endPoint: '/users/me/followings');
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
      response = await http.getRequest(endPoint: '/users/me/followers');
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

  Future followRequest(data) async {
    late Response response;
    late User followResponse;

    try {
      response = await http.putRequest('/users/follow', data);
      if (response.statusCode == 200) {
        followResponse = User.fromJson(response.data);
        response.data = followResponse;
      }
      return response;
    } on DioError catch(e) {
      print(e.response);
      throw(Exception('UnExpected error!!!'));
    }
  }

  Future unFollowRequest(data) async {
    late Response response;
    late User unFollowResponse;

    try {
      response = await http.putRequest('/users/unfollow', data);
      if (response.statusCode == 200) {
        unFollowResponse = User.fromJson(response.data);
        response.data = unFollowResponse;
      }
      return response;
    } on DioError catch(e) {
      print(e.response);
      throw(Exception('UnExpected error!!!'));
    }
  }
}
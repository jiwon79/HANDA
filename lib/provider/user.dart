import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_todo/models/user_model.dart';
import 'package:flutter_todo/services/user_api.dart';

class UserData with ChangeNotifier {
  User _user = User(
    username: '',
    nickname: '',
    is_verified: false,
    registered_at: '',
    detail: emptyUserDetail,
  );

  User get user => _user;
  List<User> _followingList = [];
  List<User> get followingList => _followingList;
  List<User> _followerList = [];
  List<User> get followerList => _followerList;

  int get followingCount {
    return _followingList.length;
  }

  int get followerCount {
    return _followerList.length;
  }

  Future getMyData() async {
    Response<dynamic> userResponse =  await UserApi().getMyData();
    _user = userResponse.data;
  }

  Future getFollowings() async {
    Response<dynamic> followingListResponse =  await UserApi().getMyFollowingList();
    _followingList = followingListResponse.data.userList;
    return 'get followers';
  }

  Future getFollowers() async {
    Response<dynamic> followerListResponse =  await UserApi().getMyFollowerList();
    _followerList = followerListResponse.data.userList;
    return 'get followings';
  }
}
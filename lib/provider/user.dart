import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_todo/models/user_model.dart';
import 'package:flutter_todo/services/user_api.dart';

class UserData with ChangeNotifier {
  User _user = User(
      username: '',
      nickname: '',
      is_verified: false,
      registered_at: ''
  );
  User get user => _user;
  List<User> _followingList = [];
  List<User> get followingList => _followingList;
  List<User> _followerList = [];
  List<User> get followerList => _followerList;

  Future getMyData() async {
    Response<dynamic> response =  await UserApi().getMyData();
    _user = response.data;
  }
}
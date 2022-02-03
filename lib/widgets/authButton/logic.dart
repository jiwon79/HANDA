import 'package:flutter/material.dart';
import 'package:flutter_todo/widgets/common/alert_widget.dart';
import 'package:provider/provider.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import 'package:flutter_todo/utils/enums.dart';
import 'package:flutter_todo/provider/todo.dart';
import 'package:flutter_todo/provider/user.dart';
import 'package:flutter_todo/services/auth_api.dart';


void authButtonLogic(BuildContext context, AuthAction action, data) {
  void landingLoginLogic(BuildContext context) {
    Navigator.pushNamed(context, '/landing/login');
  }

  void landingRegisterLogic(BuildContext context) {
    Navigator.pushNamed(context, '/landing/register');
  }

  void loginLogic(BuildContext context, data) async {
    var response = await AuthApi().loginRequest(data);
    if (response.statusCode == 200) {
      final storage = FlutterSecureStorage();
      await storage.write(key: 'token', value: response.data.access_token);
      await Provider.of<TodoData>(context, listen: false).getTodoList();
      await Provider.of<UserData>(context, listen: false).getMyData();
      Navigator.pushNamedAndRemoveUntil(context, '/main', (route) => false);
    } else if (response.statusCode == 404) {
      alertWidget(
        context: context,
        title: '로그인 오류',
        content: '아이디가 잘못되었습니다.'
      );
    } else if (response.statusCode == 401) {
      alertWidget(
          context: context,
          title: '로그인 오류',
          content: '비밀번호가 잘못되었습니다.'
      );
    }
  }

  void afterRegisterAction(context) {
    Navigator.popUntil(context, (route) => route.isFirst);
    Navigator.pushNamed(context, '/landing/login');
  }

  void registerLogic(BuildContext context, data) async {
    Map<String, dynamic> requestData = {
      'username': data['username'],
      'email': data['email'],
      'nickname': data['nickname'],
      'password': data['password'],
    };

    var response = await AuthApi().registerRequest(requestData);

    if (response.statusCode == 201) {
      alertWidget(
          context: context,
          title: '회원가입이 되었습니다.',
          onPress: afterRegisterAction,
      );
    } else if (response.statusCode == 400) {
      alertWidget(
          context: context,
          title: '회원가입 오류',
          content: '아이디 혹은 이메일이 이미 존재합니다.'
      );
    } else {
      alertWidget(
          context: context,
          title: '알 수 없는 오류',
          content: '회원가입을 한번 더 부탁드립니다.'
      );
    }
  }

  switch (action) {
    case AuthAction.landingLogin:
      return landingLoginLogic(context);
    case AuthAction.landingRegister:
      return landingRegisterLogic(context);
    case AuthAction.login:
      return loginLogic(context, data);
    case AuthAction.register:
      return registerLogic(context, data);
    default:
      return;
  }
}
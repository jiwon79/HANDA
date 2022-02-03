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

  switch (action) {
    case AuthAction.landingLogin:
      return landingLoginLogic(context);
    case AuthAction.landingRegister:
      return landingRegisterLogic(context);
    case AuthAction.login:
      return loginLogic(context, data);
    default:
      return;
  }
}
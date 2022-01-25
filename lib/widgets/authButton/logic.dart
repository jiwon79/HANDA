import 'package:flutter/material.dart';

import 'package:flutter_todo/utils/enums.dart';
import 'package:flutter_todo/provider/todo.dart';
import 'package:provider/provider.dart';
import 'package:flutter_todo/services/auth_api.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';


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
      Navigator.pushNamedAndRemoveUntil(context, '/main', (route) => false);
    } else if (response.statusCode == 404) {
      showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: Text('로그인 오류'),
              content: Text('아이디가 잘못되었습니다.'),
              actions: [
                TextButton(
                  child: Text("확인"),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                )
              ],
            );
          }
      );
    } else if (response.statusCode == 401) {
      showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: Text('로그인 오류'),
              content: Text('비밀번호가 잘못되었습니다.'),
              actions: [
                TextButton(
                  child: Text("확인"),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                )
              ],
            );
          }
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
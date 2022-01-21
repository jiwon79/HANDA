import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:flutter_todo/provider/todo.dart';
import 'package:provider/provider.dart';
import 'package:flutter_todo/services/auth_api.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _idController = TextEditingController();
  final TextEditingController _pwController = TextEditingController();

  void login(context) async {
      var data = {
        'username': _idController.text,
        'password': _pwController.text,
      };

      var response = await AuthApi().loginApi(data);
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('login page'),
        ),
        body: Column(
          children: [
            TextField(
              decoration: InputDecoration(
                  labelText: '아이디'
              ),
              controller: _idController,
            ),
            TextField(
              decoration: InputDecoration(
                  labelText: '비밀번호'
              ),
              controller: _pwController,
            ),
            TextButton(
              child: Text('로그인'),
              onPressed: () {
                login(context);
              },
            )
          ],
        )
    );
  }
}
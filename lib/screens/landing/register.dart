import 'package:flutter/material.dart';
import 'package:flutter_todo/models/auth_model.dart';
import 'package:flutter_todo/services/auth_api.dart';
import 'package:flutter_todo/widgets/common/textfield_widget.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  Map<String, dynamic> _userData = {
    'username': '',
    'nickname': '',
    'email': '',
    'password': '',
    're_password': '',
  };

  Function handleState(state) {
    void handleStateFunction(text) {
      setState(() {
        _userData[state] = text;
        print(_userData);
      });
    };
    return handleStateFunction;
  }

  RegisterResponse? registerResponse;
  bool isLoading = false;

  void register () async {
    Map<String, dynamic> data = {
      'username': _userData['username'],
      'email': _userData['email'],
      'nickname': _userData['nickname'],
      'password': _userData['password'],
    };
    var response = await AuthApi().registerRequest(data);

    if (response == 400) {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('회원가입 오류'),
            content: Text('아이디 혹은 이메일이 이미 존재합니다.'),
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
    } else {
      showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              content: Text('회원가입이 되었습니다.'),
              actions: [
                TextButton(
                  child: Text("확인"),
                  onPressed: () {
                    Navigator.pop(context);
                    Navigator.pop(context);
                    Navigator.pushNamed(context, '/landing/login');
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
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: Text('회원가입'),
      ),
      body: Container(
        padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
        child: Column(
          children: [
            TextFieldWidget(label: '이름', onChanged: handleState('username')),
            TextFieldWidget(
              label: '아이디',
              onChanged: handleState('nickname')
            ),
            Text('아이디 중복 확인이 되지 않았습니다.'),
            TextFieldWidget(label: '이메일 입력', onChanged: handleState('email')),
            TextFieldWidget(label: '비밀번호 입력', onChanged: handleState('password')),
            TextFieldWidget(label: '비밀번호 확인', onChanged: handleState('re_password')),
            Text(_userData['password'] == _userData['re_password']
              ? '비밀번호가 일치'
              : '비밀번호가 불일치'
            ),
            TextButton(
              child: Text('회원가입'),
              onPressed: () {
                register();
              },
            )
          ],
        ),
      )
    );
  }
}
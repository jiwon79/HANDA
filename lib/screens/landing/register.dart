import 'package:flutter/material.dart';
import 'package:flutter_todo/models/auth_model.dart';
import 'package:flutter_todo/services/auth_api.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _idController = TextEditingController();
  final TextEditingController _mailController = TextEditingController();
  final TextEditingController _pwController = TextEditingController();
  final TextEditingController _checkPwController = TextEditingController();

  bool _isCheckedPw = false;
  bool _isOverlapId = true;
  List<String> pwDialog = ['비밀번호가 일치하지 않습니다.', '비빌번호가 일치합니다.'];

  void checkIsSamePw (String text) {
    setState(() {
      if (_pwController.text == _checkPwController.text) {
        _isCheckedPw = true;
      } else {
        _isCheckedPw = false;
      }
    });
  }

  RegisterResponse? registerResponse;
  bool isLoading = false;

  void register () async {
    var data = {
      'username': _nameController.text,
      'email': _mailController.text,
      'nickname': _idController.text,
      'password': _pwController.text,
    };
    var response = await AuthApi().registerApi(data);

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
        body: Column(
          children: [
            TextField(
              decoration: InputDecoration(
                  labelText: '이름'
              ),
              controller: _nameController,
            ),
            TextField(
              decoration: InputDecoration(
                  labelText: '아이디'
              ),
              controller: _idController,
            ),
            Text(_isOverlapId ? '아이디가 중복' : '아이디 중복 아님'),
            TextField(
              decoration: InputDecoration(
                  labelText: '이메일'
              ),
              controller: _mailController,
              onChanged: checkIsSamePw,
            ),
            TextField(
              decoration: InputDecoration(
                  labelText: '비밀번호'
              ),
              controller: _pwController,
            ),
            TextField(
              decoration: InputDecoration(
                  labelText: '비밀번호 확인'
              ),
              controller: _checkPwController,
              onChanged: checkIsSamePw,
            ),
            Text(_isCheckedPw ? '비밀번호가 일치' : '비밀번호가 불일치'),
            // Text(isLoading.toString()),
            OutlinedButton(
              child: Text('회원가입'),
              onPressed: () {
                register();
              },
            )
          ],
        )
    );
  }
}
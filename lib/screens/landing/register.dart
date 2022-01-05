import 'package:flutter/material.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('회원가입'),
        ),
        body: Column(
          children: [
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
            OutlinedButton(
              child: Text('로그인'),
              onPressed: () {
                print(_idController.text);
              },
            )
          ],
        )
    );
  }
}
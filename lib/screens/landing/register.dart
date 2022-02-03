import 'package:flutter/material.dart';
import 'package:flutter_todo/models/auth_model.dart';
import 'package:flutter_todo/services/auth_api.dart';
import 'package:flutter_todo/widgets/common/alert_widget.dart';
import 'package:flutter_todo/widgets/common/suffix_button.dart';
import 'package:flutter_todo/widgets/common/textField_widget.dart';

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
  bool _isOverlapId = true;

  Function handleState(state) {
    void handleStateFunction(text) {
      setState(() {
        _userData[state] = text;
      });
    }
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

    if (response == 201) {
      alertWidget(
          context: context,
          title: '회원가입이 되었습니다.',
          onPress: () {
            Navigator.pop(context);
            Navigator.pop(context);
            Navigator.pushNamed(context, '/landing/login');
          }
      );
    } else if (response == 400) {
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

  void checkNicknameIsOverlap() {
    print(1);
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: Text('회원가입'),
      ),
      // TODO: padding 이 기본적으로 20, 0, 20, 0인 Container 만들기
      body: Container(
        padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
        child: Column(
          children: [
            TextFieldWidget(label: '이름', onChanged: handleState('username')),
            TextFieldWidget(
              label: '아이디',
              onChanged: handleState('nickname'),
              suffix: SuffixButton(
                content: '아이디 중복 확인',
                onPress: checkNicknameIsOverlap,
              ),
            ),
            Text('아이디 중복 확인이 되지 않았습니다.'),
            TextFieldWidget(label: '이메일 입력', onChanged: handleState('email')),
            TextFieldWidget(label: '비밀번호 입력', onChanged: handleState('password')),
            TextFieldWidget(label: '비밀번호 확인', onChanged: handleState('re_password')),
            Text(_userData['password'] == _userData['re_password']
              ? '비밀번호가 일치합니다.'
              : '비밀번호가 일치하지 않습니다.'
            ),
            TextButton(
              child: Text('회원가입'),
              onPressed: () {
                register();
              },
            ),
            Text('이미 게정을 가지고 계신가요?'),
            TextButton(
              onPressed: () {
                Navigator.popUntil(context, (route) => route.isFirst);
                Navigator.pushNamed(context, '/landing/login');
              },
              child: Text('로그인하러 가기')
            )
          ],
        ),
      )
    );
  }
}
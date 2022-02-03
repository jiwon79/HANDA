import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:flutter_todo/services/auth_api.dart';
import 'package:flutter_todo/utils/enums.dart';
import 'package:flutter_todo/widgets/authButton/auth_button.dart';
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
    'nickname': '',
    'username': '',
    'email': '',
    'password': '',
    're_password': '',
  };
  bool?  _isAvailableUsername;

  Function handleState(state) {
    void handleStateFunction(text) {
      setState(() {
        _userData[state] = text;
      });
    }
    return handleStateFunction;
  }

  void handleUsername(text) {
    setState(() {
      _userData['username'] = text;
      _isAvailableUsername = null;
    });
  }

  void checkNicknameIsOverlap() async {
    Map<String, String> requestData = {};
    if (_userData['username'] != '') {
      requestData['username'] = _userData['username'];
    }
    if (_userData['email'] != '') {
      requestData['email'] = _userData['email'];
    }

    Response response = await AuthApi().checkAvailable(requestData);
    if (response.statusCode == 200) {
      if (response.data['is_available']) {
        setState(() {
          _isAvailableUsername = true;
        });
      } else {
        setState(() {
          _isAvailableUsername = false;
        });
      }
    } else if (response.statusCode == 422) {
      if (response.data['detail'][0]['type'] == 'value_error.email') {
        alertWidget(context: context, title: '이메일 형식이 잘못되었습니다.');
      }
    } else {
      alertWidget(context: context, title: '다시 확인해주세요.');
    }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: Text('회원가입',
          style: TextStyle(
            color: Colors.black,
            fontFamily: 'noto',
            fontWeight: FontWeight.w500,
            letterSpacing: -1.6,
          ),
        ),
        centerTitle: true,
        backgroundColor: Color(0xfff8f8fa),
        elevation: 0,
        iconTheme: IconThemeData(
          color: Colors.black
        ),
      ),
      // TODO: padding 이 기본적으로 20, 0, 20, 0인 Container 만들기
      body: Container(
        padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
        color: Color(0xfff8f8fa),
        child: Column(
          children: [
            TextFieldWidget(label: '이름', onChanged: handleState('nickname')),
            TextFieldWidget(
              label: '아이디',
              onChanged: handleUsername,
              suffix: SuffixButton(
                content: '아이디 중복 확인',
                onPress: checkNicknameIsOverlap,
              ),
            ),
            Text(_isAvailableUsername == null
              ? '아이디 중복 확인이 되지 않았습니다'
              : _isAvailableUsername!
              ? '아이디가 중복되지 않습니다.'
              : '아이디가 중복되었습니다.'
            ),
            TextFieldWidget(label: '이메일 입력', onChanged: handleState('email')),
            TextFieldWidget(label: '비밀번호 입력', onChanged: handleState('password')),
            TextFieldWidget(label: '비밀번호 확인', onChanged: handleState('re_password')),
            Text(_userData['password'] == _userData['re_password']
              ? '비밀번호가 일치합니다.'
              : '비밀번호가 일치하지 않습니다.'
            ),
            AuthButton(
              action: AuthAction.register,
              data: _userData,
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
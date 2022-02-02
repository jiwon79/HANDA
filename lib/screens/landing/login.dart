import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:flutter_todo/widgets/authButton/auth_button.dart';
import 'package:flutter_todo/utils/enums.dart';
import 'package:flutter_todo/widgets/common/textfield_widget.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  Map<String, dynamic> _userData = {
    'username': '',
    'password': '',
  };

  void handleUsername(text) {
    setState(() {
      _userData['username'] = text;
    });
  }

  void handlePassword(text) {
    setState(() {
      _userData['password'] = text;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        body: Container(
          padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
          color: Color(0xfff8f8fa),
          child: Column(
            children: [
              Container(
                margin: EdgeInsets.fromLTRB(0, 80, 0, 20),
                child: Center(
                  child: SvgPicture.asset(
                    'assets/images/logo.svg',
                    height: 25,
                    color: Colors.black,
                  )
                ),
              ),
              TextFieldWidget(label: '아이디', onChanged: handleUsername),
              TextFieldWidget(label: '비밀번호', onChanged: handlePassword),
              AuthButton(
                action: AuthAction.login,
                data: _userData,
              ),
              Row(
                children: [
                  Text('계정이 없으신가요?'),
                  TextButton(
                    onPressed: () {
                      Navigator.pushNamed(context, '/landing/register');
                    },
                    child: Text('회원가입')
                  )
                ],
              )
            ],
          ),
        )
    );
  }
}
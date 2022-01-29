import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:flutter_todo/widgets/authButton/auth_button.dart';
import 'package:flutter_todo/utils/enums.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _idController = TextEditingController();
  final TextEditingController _pwController = TextEditingController();

  Map<String, dynamic> _userData = {
    'username': '',
    'password': '',
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('login page'),
        ),
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
              TextField(
                decoration: InputDecoration(
                    labelText: '아이디'
                ),
                controller: _idController,
                onChanged: (text) {
                  setState(() {
                    _userData['username'] = text;
                  });
                },
              ),
              TextField(
                decoration: InputDecoration(
                    labelText: '비밀번호'
                ),
                controller: _pwController,
                onChanged: (text) {
                  setState(() {
                    _userData['password'] = text;
                  });
                },
              ),
              AuthButton(
                action: AuthAction.login,
                data: _userData,
              ),
            ],
          ),
        )
    );
  }
}
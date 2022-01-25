import 'package:flutter/material.dart';

import 'package:flutter_todo/utils/enums.dart';
import 'package:flutter_todo/widgets/authButton/content.dart';
import 'package:flutter_todo/widgets/authButton/style.dart';
import 'package:flutter_todo/widgets/authButton/logic.dart';


class AuthButton extends StatelessWidget {
  const AuthButton({
    Key? key,
    required this.action
  }) : super(key: key);

  final AuthAction action;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      height: 40,
      child: ElevatedButton(
        child: authButtonContent(action),
        onPressed: () {
          authButtonLogic(context, action);
          // Navigator.pushNamed(context, '/landing/login');
        },
        style: authButtonStyle(action)
      ),
    );
  }
}

void authButtonLogic(BuildContext context, AuthAction action) {
  switch (action) {
    case AuthAction.landingLogin:
      return AuthLogic().landingLoginLogic(context);
    case AuthAction.landingRegister:
      return AuthLogic().landingRegisterLogic(context);
    default:
      return;
  }
}

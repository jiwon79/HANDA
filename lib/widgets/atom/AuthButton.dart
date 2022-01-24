import 'package:flutter/material.dart';
import 'package:flutter_todo/utils/auth_logic.dart';

class AuthButton extends StatelessWidget {
  const AuthButton({
    Key? key,
    required this.action
  }) : super(key: key);

  final AuthAction action;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
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
      ),
    );
  }
}

enum AuthAction {
  landingLogin,
  landingRegister,
  login,
  loginWithApple,
  loginWithGoogle,
  register,
  findId,
  findPassword
}

Widget authButtonContent(AuthAction action) {
  TextStyle blackTextStyle = TextStyle(
      color: Color(0xff191919),
      fontSize: 16,
      fontFamily: 'noto',
      fontWeight: FontWeight.w600
  );

  TextStyle whiteTextStyle = TextStyle(
    color: Colors.white,
    fontSize: 16,
    fontFamily: 'noto',
    fontWeight: FontWeight.w700,
  );

  switch (action) {
    case AuthAction.landingLogin:
      return Text('로그인', style: whiteTextStyle);
    case AuthAction.landingRegister:
      return Text('회원가입', style: blackTextStyle);
    default:
      return Text('');
  }
}

ButtonStyle authButtonStyle(AuthAction action) {
  ButtonStyle orangeButtonStyle = ButtonStyle(
      backgroundColor: MaterialStateProperty.resolveWith((states) {
        if (states.contains(MaterialState.disabled)) {
          return Colors.grey;
        } else {
          return Color(0xffE4581B);
        }
      })
  );

  switch (action) {
    case AuthAction.landingLogin:
      return orangeButtonStyle;
    default:
      return ButtonStyle();
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

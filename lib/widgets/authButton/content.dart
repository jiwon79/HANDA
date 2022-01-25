import 'package:flutter/material.dart';
import 'package:flutter_todo/utils/enums.dart';

Widget authButtonContent(AuthAction action) {
  TextStyle blackTextStyle = TextStyle(
      color: Color(0xff191919),
      fontSize: 16,
      fontFamily: 'noto',
      fontWeight: FontWeight.w700
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
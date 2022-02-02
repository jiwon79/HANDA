import 'package:flutter/material.dart';
import 'package:flutter_todo/utils/enums.dart';

ButtonStyle authButtonStyle(AuthAction action) {
  ButtonStyle orangeButtonStyle = ButtonStyle(
    backgroundColor: MaterialStateProperty.resolveWith((states) {
      if (states.contains(MaterialState.disabled)) {
        return Colors.grey;
      } else {
        return Color(0xffE4581B);
      }
    }),
    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
      RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(0),
      )
    )
  );

  ButtonStyle whiteButtonStyle = ButtonStyle(
    backgroundColor: MaterialStateProperty.resolveWith((states) {
      if (states.contains(MaterialState.disabled)) {
        return Colors.grey;
      } else {
        return Color(0xffF9F9F9);
      }
    }),
    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
      RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(0),
      )
    )
  );

  switch (action) {
    case AuthAction.landingLogin:
      return orangeButtonStyle;
    case AuthAction.landingRegister:
      return whiteButtonStyle;
    case AuthAction.login:
      return orangeButtonStyle;
    default:
      return ButtonStyle();
  }
}
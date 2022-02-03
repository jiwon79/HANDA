import 'package:flutter/material.dart';
import 'package:flutter_todo/utils/enums.dart';

ButtonStyle authButtonStyle(AuthAction action) {
  ButtonStyle orangeButtonStyle(bool isRounded) {
    return ButtonStyle(
        backgroundColor: MaterialStateProperty.resolveWith((states) {
          if (states.contains(MaterialState.disabled)) {
            return Colors.grey;
          } else {
            return Color(0xffE4581B);
          }
        }),
        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(isRounded ? 20 : 0),
            )
        )
    );
  }

  ButtonStyle whiteButtonStyle(bool isRounded) {
    return ButtonStyle(
        backgroundColor: MaterialStateProperty.resolveWith((states) {
          if (states.contains(MaterialState.disabled)) {
            return Colors.grey;
          } else {
            return Color(0xffF9F9F9);
          }
        }),
        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(isRounded ? 20 : 0),
            )
        )
    );
  }

  switch (action) {
    case AuthAction.landingLogin:
      return orangeButtonStyle(false);
    case AuthAction.landingRegister:
      return whiteButtonStyle(false);
    case AuthAction.login:
      return orangeButtonStyle(false);
    case AuthAction.register:
      return orangeButtonStyle(true);
    default:
      return ButtonStyle();
  }
}
import 'package:flutter/cupertino.dart';

class AuthLogic {
  void landingLoginLogic(BuildContext context) {
    Navigator.pushNamed(context, '/landing/login');
  }

  void landingRegisterLogic(BuildContext context) {
    Navigator.pushNamed(context, '/landing/register');
  }
}
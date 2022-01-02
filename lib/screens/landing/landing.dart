import 'package:flutter/material.dart';

class LandingPage extends StatelessWidget {
  const LandingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      decoration: BoxDecoration(
        image: DecorationImage(
            image: AssetImage('assets/images/landing_background.png'),
            fit: BoxFit.cover),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Center(
            child: Text('handa'),
          ),
          Text('완벽한 실천을 위한 \n완벽한 플래너'),
          TextButton(
            child: Text('로그인'),
            onPressed: () {
              Navigator.pushNamed(context, '/landing/login');
            },
          ),
          TextButton(
            child: Text('회원가입'),
            onPressed: () {
              Navigator.pushNamed(context, '/landing/login');
            },
          )
        ],
      ),
    ));
  }
}

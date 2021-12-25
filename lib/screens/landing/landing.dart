import 'package:flutter/material.dart';

class LandingPage extends StatelessWidget {
  const LandingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('landing paege'),
        ),
        body: TextButton(
          child: Text('navigation'),
          onPressed: () {
            Navigator.pushNamed(context, '/landing/login');
          },
        ));
  }
}

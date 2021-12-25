import 'package:flutter/material.dart';

class LandingPage extends StatelessWidget {
  const LandingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Landing PAGE',
      home: Scaffold(
        appBar: AppBar(
          title: Text('login page'),
        ),
        body: Container()
      )
    );
  }
}
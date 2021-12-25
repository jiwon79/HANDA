import 'package:flutter/material.dart';
import 'package:flutter_todo/screens/landing/landing.dart';
import 'package:flutter_todo/screens/landing/login.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/landing',
      routes: {
        '/landing': (context) => LandingPage(),
        '/landing/login': (context) => LoginPage(),
      },
    );
  }
}

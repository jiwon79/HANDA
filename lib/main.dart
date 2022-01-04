import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_todo/provider/todo.dart';
import 'package:flutter_todo/screens/landing/landing.dart';
import 'package:flutter_todo/screens/landing/login.dart';
import 'package:flutter_todo/screens/landing/register.dart';
import 'package:flutter_todo/screens/main_navigator.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => Todo()),
      ],
      child: MyApp(),
    )
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/landing',
      routes: {
        '/landing': (context) => LandingPage(),
        '/landing/login': (context) => LoginPage(),
        '/landing/register': (context) => RegisterPage(),
        '/main': (context) => MainNavigator(),
      },
    );
  }
}

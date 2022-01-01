import 'package:flutter/material.dart';

class LandingPage extends StatelessWidget {
  const LandingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: [
        Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/images/landing_background.png'),
              fit: BoxFit.cover
              ),
            )
          ),
        TextButton(
          child: Text('nav'),
          onPressed: () {
            Navigator.pushNamed(context, '/landing/login');
          },
        ),
      ],
    )
  );
  }
}

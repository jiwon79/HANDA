import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_todo/widgets/authButton/auth_button.dart';
import 'package:flutter_todo/utils/enums.dart';

class LandingPage extends StatelessWidget {
  const LandingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: Container(
        padding: EdgeInsets.fromLTRB(20, 100, 20, 0),
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/landing_background.png'),
            fit: BoxFit.cover
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Center(
              child: SvgPicture.asset(
                'assets/images/logo.svg',
                height: 25,
                color: Colors.white,
              )
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '완벽한 실천을 위한 \n완벽한 플래너',
                  style: TextStyle(
                    fontSize: 32,
                    color: Colors.white,
                    fontFamily: 'noto',
                    fontWeight: FontWeight.w700,
                  ),
                ),
                Container(
                  margin: EdgeInsets.fromLTRB(0, 94, 0, 9),
                    child: AuthButton(action: AuthAction.landingLogin)
                ),
                Container(
                  margin: EdgeInsets.fromLTRB(0, 9, 0, 75),
                  child: AuthButton(action: AuthAction.landingRegister)
                ),
              ],
            )
          ],
        ),
      )
    );
  }
}

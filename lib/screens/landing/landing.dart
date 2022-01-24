import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_todo/widgets/atom/AuthButton.dart';


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
            fit: BoxFit.cover),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Center(
              child: SvgPicture.asset(
                'assets/images/logo.svg',
                height: 25,
                color: Colors.white,
              )
            ),
            Container(
              margin: EdgeInsets.fromLTRB(0, 200, 0, 0),
              child: Text(
                '완벽한 실천을 위한 \n완벽한 플래너',
                style: TextStyle(
                  fontSize: 32,
                  color: Colors.white,
                  fontFamily: 'noto',
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
            // Center(
            //   child: Container(
            //     width: MediaQuery.of(context).size.width,
            //     height: 40,
            //     margin: EdgeInsets.fromLTRB(0, 94, 0, 9),
            //     child: ElevatedButton(
            //       child: Text(
            //           '로그인',
            //         style: TextStyle(
            //           fontFamily: 'noto',
            //           fontWeight: FontWeight.w700,
            //           fontSize: 16
            //         ),
            //       ),
            //       onPressed: () {
            //         Navigator.pushNamed(context, '/landing/login');
            //       },
            //       style: ButtonStyle(
            //         backgroundColor: MaterialStateProperty.resolveWith((states) {
            //           if (states.contains(MaterialState.disabled)) {
            //             return Colors.grey;
            //           } else {
            //             return Color(0xffE4581B);
            //           }
            //         })
            //       )
            //     ),
            //   ),
            // ),
            AuthButton(action: AuthAction.landingLogin),
            AuthButton(action: AuthAction.landingRegister),
            Center(
              child: Container(
                height: 40,
                width: MediaQuery.of(context).size.width,
                margin: EdgeInsets.fromLTRB(0, 9, 0, 9),
                child: ElevatedButton(
                  child: Text(
                    '회원가입',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 16,
                      fontFamily: 'noto',
                      fontWeight: FontWeight.w700
                    ),
                  ),
                  onPressed: () {
                    Navigator.pushNamed(context, '/landing/register');
                  },
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.resolveWith((states) {
                      if (states.contains(MaterialState.disabled)) {
                        return Colors.grey;
                      } else {
                        return Color(0xffF9F9F9);
                      }
                    }),
                  )
                ),
              ),
            ),
          ],
        ),
      )
    );
  }
}

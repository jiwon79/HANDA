import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class LogoBanner extends StatelessWidget {
  const LogoBanner({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color(0xffffffff),
      width: MediaQuery.of(context).size.width,
      height: 50,
      child: Center(
        child: SvgPicture.asset(
          'assets/images/logo.svg',
          height: 15,
          color: Colors.black,
        )
      ),
    );
  }
}

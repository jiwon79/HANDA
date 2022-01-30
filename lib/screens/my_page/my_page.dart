import 'package:flutter/material.dart';
import 'package:flutter_todo/widgets/atom/logo_banner.dart';
import 'package:flutter_todo/widgets/my_page/my_profile.dart';

class MyPage extends StatelessWidget {
  const MyPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color(0xfff8f8fa),
      child: Column(
        children: [
          LogoBanner(),
          MyProfile(),
        ],
      ),
    );
  }
}

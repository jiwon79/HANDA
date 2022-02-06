import 'package:flutter/material.dart';
import 'package:flutter_todo/widgets/calendar/footer_icon.dart';

class CalendarFooter extends StatelessWidget {
  const CalendarFooter({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        FooterIcon(color: Color(0xffDFF0FC)),
        Text('50% 이하', style: footerTextStyle),
        FooterIcon(color: Color(0xffbde4ff)),
        Text('50% 이상', style: footerTextStyle),
        FooterIcon(
          color: Color(0xff87C8F6),
          child: Icon(Icons.check,
            size: 15,
            color: Colors.white,
          )
        ),
        Text('완료', style: footerTextStyle),
        FooterIcon(color: Color(0xffFAAEAE),),
        Text('미완료', style: footerTextStyle,),
      ],
    );
  }
}

TextStyle footerTextStyle = TextStyle(
  fontSize: 12,
  fontFamily: 'noto',
  fontWeight: FontWeight.w500,
);
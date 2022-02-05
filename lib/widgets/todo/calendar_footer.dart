import 'package:flutter/material.dart';

class CalendarFooter extends StatelessWidget {
  const CalendarFooter({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Container(
          width: 18,
          height: 18,
          margin: EdgeInsets.fromLTRB(13, 0, 3, 0),
          decoration: BoxDecoration(
            color: Color(0xffDFF0FC),
            borderRadius: BorderRadius.circular(5)
          ),
        ),
        Text('50% 이하',
          style: TextStyle(
            fontSize: 12,
            fontFamily: 'noto',
            fontWeight: FontWeight.w500,
          ),
        ),
        Container(
          width: 18,
          height: 18,
          margin: EdgeInsets.fromLTRB(13, 0, 3, 0),
          decoration: BoxDecoration(
              color: Color(0xffbde4ff),
              borderRadius: BorderRadius.circular(5)
          ),
        ),
        Text('50% 이상',
          style: TextStyle(
            fontSize: 12,
            fontFamily: 'noto',
            fontWeight: FontWeight.w500,
          ),
        ),
        Container(
          width: 18,
          height: 18,
          margin: EdgeInsets.fromLTRB(13, 0, 3, 0),
          decoration: BoxDecoration(
              color: Color(0xff87C8F6),
              borderRadius: BorderRadius.circular(5)
          ),
        ),
        Text('50% 완료',
          style: TextStyle(
            fontSize: 12,
            fontFamily: 'noto',
            fontWeight: FontWeight.w500,
          ),
        ),
        Container(
          width: 18,
          height: 18,
          margin: EdgeInsets.fromLTRB(13, 0, 3, 0),
          decoration: BoxDecoration(
              color: Color(0xffFAAEAE),
              borderRadius: BorderRadius.circular(5)
          ),
        ),
        Text('미완료',
          style: TextStyle(
            fontSize: 12,
            fontFamily: 'noto',
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }
}
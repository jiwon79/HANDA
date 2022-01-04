import 'package:flutter/material.dart';

class CalendarFotter extends StatelessWidget {
  const CalendarFotter({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text('50% 이하'),
        Text('50% 이상'),
        Text('50% 완료'),
        Text('미완료'),
      ],
    );
  }
}
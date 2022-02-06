import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:flutter_todo/provider/calendar.dart';

class CalendarHeader extends StatefulWidget {
  const CalendarHeader({Key? key}) : super(key: key);

  @override
  _CalendarHeaderState createState() => _CalendarHeaderState();
}

class _CalendarHeaderState extends State<CalendarHeader> {
  final List<String> _valueList = ['월', '2주', '주'];
  String _selectedValue = '주';

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            Text(DateFormat('yyyy년 MM월').format(context.watch<CalendarData>().selectedDay),
              style: TextStyle(
                fontSize: 14,
                fontFamily: 'noto',
                fontWeight: FontWeight.w700,
              ),
            ),
            Container(
              margin: EdgeInsets.fromLTRB(5, 0, 0, 0),
              child: Row(
                children: [
                  Icon(Icons.favorite,
                    color: Colors.pink,
                    size: 14
                  ),
                  Text('32',
                    style: TextStyle(
                      fontSize: 12,
                      fontFamily: 'noto',
                      fontWeight: FontWeight.w700
                    ),
                  ),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.fromLTRB(5, 0, 0, 0),
              child: Row(
                children: [
                  Icon(Icons.check_box,
                    size: 14,
                  ),
                  Text('16',
                    style: TextStyle(
                        fontSize: 12,
                        fontFamily: 'noto',
                        fontWeight: FontWeight.w700
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
        DropdownButton<String>(
          value: _selectedValue,
          items: _valueList.map((value) {
            return DropdownMenuItem(
              value: value,
              child: Text(value),
            );
          }).toList(),
          onChanged: (value) {
            context.read<CalendarData>().changeCalendarFormat(value);
            setState(() {
              _selectedValue = value!;
            });
          },
        ),
      ],
    );
  }
}

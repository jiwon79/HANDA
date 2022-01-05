import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:flutter_todo/provider/todo.dart';

class CalendarHeader extends StatefulWidget {
  const CalendarHeader({Key? key}) : super(key: key);

  @override
  _CalendarHeaderState createState() => _CalendarHeaderState();
}

class _CalendarHeaderState extends State<CalendarHeader> {
  final List<String> _valueList = ['month', 'two weeks', 'week'];
  String _selectedValue = 'week';

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(DateFormat('yyyy년 MM월').format(context.watch<TodoData>().selectedDay)),
        Icon(Icons.health_and_safety),
        Text('32'),
        Icon(Icons.check_box),
        Text('16'),
        DropdownButton<String>(
          value: _selectedValue,
          items: _valueList.map((value) {
            return DropdownMenuItem(
              value: value,
              child: Text(value),
            );
          }).toList(),
          onChanged: (value) {
            context.read<TodoData>().changeCalendarFormat(value);
            setState(() {
              _selectedValue = value!;
            });
          },
        ),
      ],
    );
  }
}

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_todo/provider/calendar.dart';
import 'package:flutter_todo/provider/todo.dart';

import 'package:flutter_todo/widgets/calendar/calendar.dart';
import 'package:flutter_todo/widgets/calendar/calendar_footer.dart';
import 'package:flutter_todo/widgets/calendar/calendar_header.dart';
import 'package:flutter_todo/widgets/todo/todo_list.dart';

class TodoPage extends StatefulWidget {
  const TodoPage({Key? key}) : super(key: key);

  @override
  _TodoPageState createState() => _TodoPageState();
}

class _TodoPageState extends State<TodoPage> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
        padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
        color: Color(0xffF8F8FA),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('나의 To Do List',
              style: TextStyle(
                fontSize: 21,
                fontFamily: 'noto',
                fontWeight: FontWeight.w700,
              ),
            ),
            CalendarHeader(),
            Calendar(),
            CalendarFooter(),
            Consumer<TodoData>(builder: (context, todoData, child) {
              return TextButton(
                onPressed: () {
                  todoData.addTodo(context.read<CalendarData>().selectedDay);
                },
                child: Text('할일 추가'),
              );
            }),
            TextButton(onPressed: () {
              Provider.of<TodoData>(context, listen: false).getTodoList();
            }, child: Text('불러오기')),
            TodoList(),
          ],
        ),
      ),
      onTap: () {
        FocusScope.of(context).unfocus();
      },
    );
  }
}

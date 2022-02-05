import 'package:flutter/material.dart';
import 'package:flutter_todo/provider/calendar.dart';
import 'package:flutter_todo/widgets/todo/calendar.dart';
import 'package:flutter_todo/widgets/todo/todo_list.dart';
import 'package:flutter_todo/provider/todo.dart';
import 'package:provider/provider.dart';

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
          children: [
            Text('나의 To Do List'),
            TodoCalendar(),
            Consumer<TodoData>(builder: (context, todoData, child) {
              return TextButton(
                onPressed: () {
                  todoData.addTodo(context.read<CalendarData>().selectedDay);
                },
                child: Text('할일 추가'),
              );
            }),
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

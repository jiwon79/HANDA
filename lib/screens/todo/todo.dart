import 'package:flutter/material.dart';
import 'package:flutter_todo/widgets/todo/calendar.dart';
import 'package:flutter_todo/widgets/todo/todo_list.dart';

class TodoPage extends StatefulWidget {
  const TodoPage({Key? key}) : super(key: key);

  @override
  _TodoPageState createState() => _TodoPageState();
}

class _TodoPageState extends State<TodoPage> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text('나의 To Do List'),
        TodoCalendar(),
        TodoList(),
      ],
    );
  }
}

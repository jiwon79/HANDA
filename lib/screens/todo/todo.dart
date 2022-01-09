import 'package:flutter/material.dart';
import 'package:flutter_todo/services/user_api.dart';
import 'package:flutter_todo/widgets/todo/calendar.dart';
import 'package:flutter_todo/widgets/todo/todo_list.dart';

class TodoPage extends StatefulWidget {
  const TodoPage({Key? key}) : super(key: key);

  @override
  _TodoPageState createState() => _TodoPageState();
}

class _TodoPageState extends State<TodoPage> {

  void getData () async {
    var response = await UserApi().getMyData();
    print(response);
  }
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text('나의 To Do List'),
        TodoCalendar(),
        TodoList(),
        TextButton(
            onPressed: () {
              getData();
            },
            child: Text('버튼')
        ),
      ],
    );
  }
}

import 'package:flutter/material.dart';

class TodoItem extends StatelessWidget {
  const TodoItem(
      {Key? key,
      required this.todoName,
      required this.isChecked,
      required this.checkboxCallback,
      required this.longPressCallback})
      : super(key: key);

  final String todoName;
  final bool isChecked;
  final Function checkboxCallback;
  final Function longPressCallback;

  @override
  Widget build(BuildContext context) {
    return Text(todoName);
  }
}

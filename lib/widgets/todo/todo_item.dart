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
    return Row(
      children: [
        Checkbox(value: isChecked, onChanged: (value) {
          checkboxCallback(value);
        }),
        Text(todoName),
        IconButton(
            onPressed: (){
              showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      title: Text(todoName),
                      content: Wrap(
                        direction: Axis.horizontal,
                        spacing: 10,
                        runSpacing: 40,
                        children: <Widget>[
                          TextButton(
                              onPressed: () {},
                              child: Column(
                                children: [
                                  Icon(Icons.add),
                                  Text('To Do 수정하기'),
                                ],
                              )
                          )
                        ],
                      ),
                    );
                  }
              );
            },
            icon: Icon(Icons.more_horiz)
        )
      ],
    );
  }
}

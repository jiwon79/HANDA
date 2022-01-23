import 'package:flutter/material.dart';

class TodoItem extends StatefulWidget {
  const TodoItem(
      {Key? key,
        required this.todoName,
        required this.isChecked,
        required this.isEditing,
        required this.checkboxCallback,
        required this.deleteCallback,
        required this.editedCallback,
      })
      : super(key: key);

  final String todoName;
  final bool isChecked;
  final bool isEditing;
  final Function checkboxCallback;
  final Function deleteCallback;
  final Function editedCallback;

  @override
  _TodoItemState createState() => _TodoItemState();
}

class _TodoItemState extends State<TodoItem> {

  @override
  Widget build(BuildContext context) {
    final TextEditingController _taskController = TextEditingController(text: widget.todoName);

    return Row(
      children: [
        Checkbox(value: widget.isChecked, onChanged: (value) {
          widget.checkboxCallback(value);
        }),
        widget.isEditing
            ? Container(
              width: 100,
              child: TextField(
                autofocus: true,
                controller: _taskController,
                onSubmitted: (input) {
                  widget.editedCallback(input);
                  print(input);
                },
                decoration: InputDecoration(
                  // labelText: todoName,
                    hintText: widget.todoName
                ),
              ),
        )
            : Text(widget.todoName),
        IconButton(
            onPressed: (){
              showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      title: Text(widget.todoName),
                      content: Wrap(
                        direction: Axis.horizontal,
                        spacing: 10,
                        runSpacing: 40,
                        children: <Widget>[
                          TextButton(
                              onPressed: () {
                                Navigator.pop(context);
                                widget.editedCallback(widget.todoName);
                              },
                              child: Column(
                                children: [
                                  Icon(Icons.add),
                                  Text('To Do 수정하기'),
                                ],
                              )
                          ),
                          TextButton(
                              onPressed: () async {
                                await widget.deleteCallback();
                                Navigator.pop(context);
                              },
                              child: Column(
                                children: [
                                  Icon(Icons.clear),
                                  Text('To Do 삭제하기')
                                ],
                              ))
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
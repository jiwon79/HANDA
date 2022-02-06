import 'package:flutter/material.dart';
import 'package:flutter_todo/models/todo_model.dart';

class TodoItem extends StatefulWidget {
  const TodoItem(
      {Key? key,
        required this.todo,
        required this.checkboxCallback,
        required this.deleteCallback,
        required this.editCallback,
        required this.updateCallback,
      })
      : super(key: key);

  final Todo todo;
  final Function checkboxCallback;
  final Function deleteCallback;
  final Function editCallback;
  final Function updateCallback;

  @override
  _TodoItemState createState() => _TodoItemState();
}

class _TodoItemState extends State<TodoItem> {

  @override
  Widget build(BuildContext context) {
    final TextEditingController _taskController = TextEditingController(text: widget.todo.name);

    return Container(
      height: 40,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Checkbox(
            value: widget.todo.isDone,
            onChanged: (value) {
              widget.checkboxCallback(value);
            }
          ),
          widget.todo.isEditing
          ? Container(
            width: 100,
            child: TextField(
              autofocus: true,
              controller: _taskController,
              onSubmitted: (input) {
                widget.updateCallback(input);
                print(input);
              },
              decoration: InputDecoration(
                // labelText: todoName,
                  hintText: widget.todo.name
              ),
            ),
          )
          : Text(widget.todo.name),
          IconButton(
              onPressed: (){
                showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        title: Text(widget.todo.name),
                        content: Wrap(
                          direction: Axis.horizontal,
                          spacing: 10,
                          runSpacing: 40,
                          children: <Widget>[
                            TextButton(
                                onPressed: () {
                                  Navigator.pop(context);
                                  widget.editCallback();
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
      ),
    );
  }
}
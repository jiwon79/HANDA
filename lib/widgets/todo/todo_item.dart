import 'package:flutter/material.dart';
import 'package:flutter_todo/models/todo_model.dart';
import 'package:flutter_todo/widgets/todo/alert_todo_modal.dart';

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
                alertTodoModal(
                  context: context,
                  todoName: widget.todo.name,
                  editCallback: widget.editCallback,
                  deleteCallback: widget.deleteCallback
                );
              },
              icon: Icon(Icons.more_horiz)
          )
        ],
      ),
    );
  }
}
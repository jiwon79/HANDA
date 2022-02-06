import 'package:flutter/material.dart';
import 'package:flutter_todo/widgets/todo/todo_modal_button.dart';

void alertTodoModal({
  required context,
  required todoName,
  required editCallback,
  required deleteCallback,
}) {
  showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(
                  Radius.circular(17.0)
              )
          ),
          contentPadding: EdgeInsets.fromLTRB(15, 12, 15, 5),
          content: Container(
            height: 180,
            width: 300,
            child: Column(
              children: [
                Text(todoName),
                Wrap(
                  direction: Axis.horizontal,
                  spacing: 10,
                  runSpacing: 10,
                  children: [
                    TodoModalButton(
                        icon: Icon(Icons.edit_outlined),
                        title: 'To Do 수정',
                        action: editCallback
                    ),
                    TodoModalButton(
                      icon: Icon(Icons.restore_from_trash_outlined),
                      title: '삭제',
                      action: deleteCallback
                    ),
                    TodoModalButton(
                        icon: Icon(Icons.edit_outlined),
                        title: 'To Do 수정',
                        action: editCallback
                    ),
                    TodoModalButton(
                        icon: Icon(Icons.edit_outlined),
                        title: 'To Do 수정',
                        action: editCallback
                    ),
                  ]
                )

              ],
            ),
          ),
        );
      }
  );
}
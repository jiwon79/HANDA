import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_todo/provider/todo.dart';
import 'todo_item.dart';

class TodoList extends StatelessWidget {
  const TodoList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<TodoData>(builder: (context, todoData, child) {
      return Expanded(
        child: ListView.builder(
          itemBuilder: (context, index) {
            final todo = todoData.todos[index];
            return TodoItem(
              todoName: todo.name,
              isChecked: todo.isDone,
              isEditing: todo.isEditing,
              checkboxCallback: (bool checkboxState) {
                todoData.updateTodo(todo);
              },
              longPressCallback: () {
                todoData.deleteTodo(todo);
              },
              editedCallback: (String updateName) {
                todoData.updateTodoName(todo, updateName);
              }
            );
          },
          itemCount: todoData.todoCount,
        )
      );
    });
  }
}

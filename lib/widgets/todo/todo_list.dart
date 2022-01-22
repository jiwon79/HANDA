import 'package:flutter/material.dart';
import 'package:flutter_todo/provider/calendar.dart';
import 'package:provider/provider.dart';
import 'package:flutter_todo/provider/todo.dart';
import 'todo_item.dart';

class TodoList extends StatelessWidget {
  const TodoList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<TodoData>(builder: (context, todoData, child) {
      DateTime selectedDay = Provider.of<CalendarData>(context).selectedDay;
      final selectedTodos = Provider.of<TodoData>(context).getTodosSelectedDay(selectedDay);
      return Expanded(
        child: ListView.builder(
          itemBuilder: (context, index) {
            final todo = selectedTodos[index];
            return TodoItem(
              todoName: todo.name,
              isChecked: todo.isDone,
              isEditing: todo.isEditing,
              checkboxCallback: (bool checkboxState) {
                todoData.updateTodo(todo);
              },
              deleteCallback: () {
                todoData.deleteTodo(todo);
              },
              editedCallback: (String updateName) {
                todoData.updateTodoName(todo, updateName);
              }
            );
          },
          itemCount: selectedTodos.length,
        )
      );
    });
  }
}

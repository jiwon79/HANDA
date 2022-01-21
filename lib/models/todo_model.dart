class Todo {
  Todo({
    required this.name,
    required this.isDone,
    this.isEditing = false,
    this.dueDate = '2022-01-18',
  });

  String name;
  bool isDone = false;
  bool isEditing;
  String dueDate;

  void toggleDone() {
    isDone = !isDone;
  }

  void toggleEditing() {
    isEditing = !isEditing;
  }

  void updateName(String updateName) {
    name = updateName;
  }

  factory Todo.fromJson(Map<String, dynamic> json) => Todo(
      name: json['name'],
      isDone: json['is_done'],
  );

}

class TodoResponse {
  TodoResponse({
    required this.todoList,
  });

  List<Todo> todoList;

  factory TodoResponse.fromJson(List<dynamic> jsonList) => TodoResponse(
      todoList: jsonList.map((json) => Todo.fromJson(json)).toList(),
  );
}
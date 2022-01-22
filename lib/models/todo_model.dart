class Todo {
  Todo({
    required this.name,
    required this.isDone,
    this.isEditing = false,
    required this.dueDate,
    required this.id,
  });

  String name;
  bool isDone = false;
  bool isEditing;
  String dueDate;
  String id;

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
    name: json['title'],
    isDone: json['is_done'],
    dueDate: json['due_date'],
    id: json['id'],
  );
}

class TodoListResponse {
  TodoListResponse({
    required this.todoList,
  });

  List<Todo> todoList;

  factory TodoListResponse.fromJson(List<dynamic> jsonList) => TodoListResponse(
      todoList: jsonList.map((json) => Todo.fromJson(json)).toList(),
  );
}


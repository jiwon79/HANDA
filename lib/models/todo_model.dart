class Todo {
  Todo({
    required this.name,
    required this.isDone,
    this.isEditing = false,
    this.dueDate = '2022-01-18',
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

class TodoResponse {
  TodoResponse({
    required this.todoList,
  });

  List<Todo> todoList;

  factory TodoResponse.fromJson(List<dynamic> jsonList) => TodoResponse(
      todoList: jsonList.map((json) => Todo.fromJson(json)).toList(),
  );
}
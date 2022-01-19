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
}
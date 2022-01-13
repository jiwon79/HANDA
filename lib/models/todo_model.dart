class Todo {
  Todo({
    required this.name,
    required this.isDone,
    required this.isEditing,
  });

  String name;
  bool isDone = false;
  bool isEditing;

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
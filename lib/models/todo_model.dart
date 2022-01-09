class Todo {
  Todo({
    required this.name,
    required this.isDone,
  });

  String name;
  bool isDone = false;

  void toggleDone() {
    isDone = !isDone;
  }
}
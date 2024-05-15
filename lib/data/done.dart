class Task {
  String title,deskripsi;
  bool isDone;

  Task({required this.title, required this.isDone,required this.deskripsi});

  void toggleDone(Task task) {
    isDone = !isDone;
  }
}
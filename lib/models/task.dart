class Task {

  final String name;
  final String date;

  bool isDone;

  Task({this.name, this.isDone=false, this.date});

  void toggleDone() {
    isDone = !isDone;
  }
}
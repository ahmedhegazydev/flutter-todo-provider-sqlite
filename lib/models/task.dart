class Task {
  final int id;
  final String name;
  final String date;

  bool isDone;

  Task({this.id, this.name, this.isDone=false, this.date});

  void toggleDone() {
    isDone = !isDone;
  }
  Map<String, dynamic>toMap() {
    return {
      'id': id,
      'title': name,
      'date': date,
      'iscomplete': isDone,
    };
  }
}
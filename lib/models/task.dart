class Task {
  final int id;
  final String name;
  final String date;
  final String time;
  bool isDone;

  Task({this.id, this.name, this.isDone=false, this.date, this.time});

  void toggleDone() {
    isDone = !isDone;
  }
  Map<String, dynamic>toMap() {
    return {
      'id': id,
      'title': name,
      'date': date,
      'iscomplete': isDone,
      'time':time,
    };
  }
}
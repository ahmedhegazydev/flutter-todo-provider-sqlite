import 'package:flutter/foundation.dart';
import 'task.dart';
import 'dart:collection';

class TaskData extends ChangeNotifier {

  List<Task> _tasks = [
    Task(name: 'Buy coffee'),
    Task(name: 'Go Shopping'),
    Task(name: 'Go Sleep'),
    Task(name: 'Go play'),
    Task(name: 'watch cartoon'),
    Task(name: 'play'),
    Task(name: 'learn'),
    Task(name: 'write'),
  ];

  UnmodifiableListView<Task> get tasks {
    return UnmodifiableListView(_tasks);
  }

  int get taskCount{
    return _tasks.length;
  }

  void addTask(String newTaskTitle) {
    final task = Task(name: newTaskTitle);
    _tasks.add(task);
    notifyListeners();
  }

  void updateTask(Task task) {
    task.toggleDone();
    notifyListeners();
  }

  void deleteTask(Task task) {
    _tasks.remove(task);
    notifyListeners();
  }
}
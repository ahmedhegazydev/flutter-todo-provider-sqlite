import 'package:flutter/foundation.dart';
import 'task.dart';
import 'dart:collection';
import 'package:todoye/database/database_connection.dart';

class TaskData extends ChangeNotifier {

  final TaskDatabaseManager taskDatabaseManager = new TaskDatabaseManager();

  List<Task> _tasks = [];

  UnmodifiableListView<Task> get tasks {
    return UnmodifiableListView(_tasks);

  }

  fetchTasks() {
    taskDatabaseManager.getTasks().then((tasks) {
       _tasks = tasks;
       notifyListeners();
    });
  }

  int get taskCount{
    return _tasks.length;
  }

  addTask(String newTaskTitle, String newDate){
    final task =  Task(name: newTaskTitle, date: newDate);
    taskDatabaseManager.insertTask(task);
    fetchTasks();
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
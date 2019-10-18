import 'package:flutter/foundation.dart';
import 'task.dart';
import 'dart:collection';
import 'package:todoye/database/database_connection.dart';

class TaskData extends ChangeNotifier {

  final TaskDatabaseManager taskDatabaseManager = new TaskDatabaseManager();


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

  addTask(String newTaskTitle, String newDate){
    final task =  Task(name: newTaskTitle, date: newDate);
    taskDatabaseManager.insertTask(task);
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
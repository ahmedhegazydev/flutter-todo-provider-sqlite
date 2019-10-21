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


  int get taskCount{
    return _tasks.length;
  }

  fetchTasks() {
    taskDatabaseManager.getTasks().then((tasks){
      _tasks = tasks;
      notifyListeners();
    });
  }
  
  
  addTask(String newTaskTitle, String newDate){
    final task =  Task(name: newTaskTitle, date: newDate);
    taskDatabaseManager.insertTask(task);
    fetchTasks();
  }

  void updateTask(Task task) {
    task.toggleDone();
    taskDatabaseManager.updateTask(task);
    notifyListeners();
  }

  void deleteTask(int id) {
    taskDatabaseManager.deleteTask(id);
    notifyListeners();
  }
  void remove(int taskId) {
    _tasks.removeAt(taskId);
  }
}
import 'dart:async';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:todoye/models/task.dart';



class TaskDatabaseManager {
  Database _database;

  Future openDb()async {
    if(_database ==null) {
      _database = await openDatabase(
          join(await getDatabasesPath(), 'task_database.db'),
          version: 1,
          onCreate: (Database db, int version) async {
            await db.execute(
                'CREATE TABLE tasks (id INTEGER PRIMARY KEY autoincrement, title TEXT, date TEXT, iscomplete BOOL )');
          }
      );
    }
  }

  Future<void> insertTask(Task task) async {
    await openDb();
    await _database.insert('tasks', task.toMap());
  }

  Future<List<Task>>getTasks() async {
    await openDb();
    final List<Map<String, dynamic>>maps = await _database.query('tasks');

    return List.generate(maps.length, (i){
      return Task(
        id: maps[i]['id'],
        name: maps[i]['title'],
        date:maps[i]['date'],
        isDone: maps[i]['iscomplete'] == 1 ? true: false,

      );
    });
  }



  Future<void>deleteTask(int id) async {
    await openDb();
    await _database.delete('tasks', where: 'id = ?', whereArgs: [id]);
  }

}





















import 'package:flutter/material.dart';
import 'package:todoye/models/task.dart';
import 'package:todoye/constants.dart';

class TaskListTile extends StatelessWidget {
  const TaskListTile({
    Key key,
    @required this.tasks,
    this.index,
  }) : super(key: key);
  final index;
  final List<Task> tasks;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        tasks[index].name,
        style: TextStyle(color: Colors.white),
      ),
      subtitle: Text(
        '09:30-11:00am',
        style: TextStyle(
          letterSpacing: 2.0,
          fontSize: 15.0,
          color: Color(kBorderTileColor),
        ),
      ),
      leading: Checkbox(
        activeColor: Colors.red,
        checkColor: Colors.greenAccent,
        onChanged: (value){
          //TODO: add checkbox options here
        },
        value: false,
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:todoye/constants.dart';

class TaskListTile extends StatelessWidget {
  const TaskListTile(
      {this.taskTitle,
      this.isChecked,
      this.checkboxCallback,
      this.deleteCallback});

  final String taskTitle;
  final bool isChecked;
  final Function checkboxCallback;
  final Function deleteCallback;


  @override
  Widget build(BuildContext context) {
    return Dismissible(
      background: Container(
        decoration: BoxDecoration(color: Colors.white),
        child: Icon(
          Icons.delete,
          color: Colors.red,
        ),
      ),
      key: Key(taskTitle),
      onDismissed: (direction) {
        deleteCallback();

        Scaffold.of(context)
            .showSnackBar(SnackBar(content: Text("$taskTitle removed.")));
      },
      child: ListTile(
        title: Text(
          '$taskTitle',
          style: TextStyle(
            decoration: isChecked ? TextDecoration.lineThrough : null,
            color: Colors.white,
            fontSize: 20.0,
            letterSpacing: 2.0,
          ),
        ),
        subtitle: Text(
          '09:30-11:00am',
          style: TextStyle(
            letterSpacing: 2.0,
            fontSize: 15.0,
            fontWeight: FontWeight.bold,
            color: Color(kBorderTileColor),
          ),
        ),
        leading: Checkbox(
          activeColor: Color(kBorderTileColor),
          checkColor: Colors.greenAccent,
          onChanged: checkboxCallback,
          value: isChecked,
        ),
      ),
    );
  }
}

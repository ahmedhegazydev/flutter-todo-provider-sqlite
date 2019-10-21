import 'package:flutter/material.dart';
import 'package:todoye/constants.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class TaskListTile extends StatelessWidget {
  const TaskListTile({
    this.taskTime,
    this.taskTitle,
    this.isChecked,
    this.checkboxCallback,
    this.deleteCallback,
  });
  final String taskTime;
  final String taskTitle;
  final bool isChecked;
  final Function checkboxCallback;
  final Function deleteCallback;

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      background: Row(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          Container(
            color: Color(kPrimaryColor),
            padding: EdgeInsets.symmetric(horizontal: 20.0),
            child: Row(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: Icon(
                    FontAwesomeIcons.check,
                    color: Colors.blue,
                  ),
                ),
                Icon(
                  Icons.delete,
                  color: Colors.red,
                ),
              ],
            ),
          ),
        ],
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
          '$taskTime',
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

import 'package:flutter/material.dart';
import 'package:todoye/models/task.dart';
import 'package:todoye/constants.dart';
import 'task_list_tile.dart';

class TaskListView extends StatelessWidget {
  const TaskListView({
    Key key,
    @required this.tasks,
  }) : super(key: key);

  final List<Task> tasks;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: tasks.length,
        itemBuilder: (context, index) {
          return Container(
            decoration: BoxDecoration(
                border: Border(
                    bottom: BorderSide(
              width: 1.0,
              color: Color(kBorderTileColor),
              //TODO: reduce the color opacity
            ))),
            child: new TaskListTile(tasks: tasks, index: index),
          );
        });
  }
}

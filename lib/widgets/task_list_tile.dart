import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:todoye/constants.dart';

class TaskListTile extends StatelessWidget {
  const TaskListTile({
    this.taskTime,
    this.taskTitle,
    this.isChecked,
    this.checkboxCallback,
    this.deleteCallback,
    this.editCallback,
  });

  final String taskTime;
  final String taskTitle;
  final bool isChecked;
  final Function checkboxCallback;
  final Function deleteCallback;
  final Function editCallback;

  @override
  Widget build(final BuildContext buildContext) {
    return Slidable(
      key: const ValueKey(0),
      startActionPane: ActionPane(
        motion: const ScrollMotion(),
        dismissible: DismissiblePane(onDismissed: () {
          deleteTask(buildContext);
        }),
        children: [
          SlidableAction(
            onPressed: (_) {
              deleteTask(buildContext);
            },
            backgroundColor: Color(0xFFFE4A49),
            foregroundColor: Colors.white,
            icon: Icons.delete,
            label: 'Delete',
          ),
          SlidableAction(
            onPressed: (_) {
              editCallback();
            },
            backgroundColor: Color(0xFF21B7CA),
            foregroundColor: Colors.white,
            icon: Icons.edit,
            label: 'Edit',
          ),
        ],
      ),
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
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
          softWrap: false,
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

  void deleteTask(BuildContext buildContext) {
    deleteCallback();
    Scaffold.of(buildContext)
        .showSnackBar(SnackBar(content: Text("$taskTitle removed.")));
  }
}

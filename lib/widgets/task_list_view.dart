import 'package:flutter/material.dart';
import 'package:morpheus/page_routes/morpheus_page_route.dart';
import 'package:todoye/models/ActionType.dart';
import 'package:todoye/models/task.dart';
import 'package:todoye/screens/create_task_screen.dart';
import 'task_list_tile.dart';
import 'package:provider/provider.dart';
import 'package:todoye/provider/task_data.dart';

class TaskListView extends StatefulWidget {
  @override
  _TaskListViewState createState() => _TaskListViewState();
}

class _TaskListViewState extends State<TaskListView> {
  @override
  Widget build(BuildContext context) {
    return Consumer<TaskData>(
      builder: (context, taskData, child) {
        return ListView.separated(
            itemCount: taskData.taskCount,
            separatorBuilder: (BuildContext context, int index) =>
                Divider(height: 1),
            itemBuilder: (context, index) {
              final _parentKey = GlobalKey();

              return TaskListTile(
                key: _parentKey,
                taskTime: taskData.tasks[index].time,
                taskTitle: taskData.tasks[index].name,
                isChecked: taskData.tasks[index].isDone,
                checkboxCallback: (checkboxState) {
                  taskData.updateTask(taskData.tasks[index]);
                },
                deleteCallback: () {
                  taskData.deleteTask(taskData.tasks[index].id);
                  setState(() {
                    taskData.remove(index);
                  });
                },
                editCallback: () {
                  // Navigator.push(
                  //   context,
                  //   MaterialPageRoute(
                  //     builder: (context) => CreateTaskScreen(
                  //         taskActionType: ActionType.Edit,
                  //         taskToEdit: taskData.tasks[index]),
                  //   ),
                  // );

                  _handleTap(context, _parentKey, taskData.tasks[index]);
                },
              );
            });
      },
    );
  }

  void _handleTap(BuildContext context, GlobalKey parentKey, Task task) {
    Navigator.of(context).push(MorpheusPageRoute(
      builder: (context) =>
          CreateTaskScreen(taskActionType: ActionType.Edit, taskToEdit: task),
      parentKey: parentKey,
    ));
  }
}

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todoye/models/task_data.dart';

class ListBoxTitle extends StatelessWidget {
  const ListBoxTitle({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Text(
        'Today (${Provider.of<TaskData>(context).taskCount})',
        style: TextStyle(
          fontSize: 20.0,
          fontWeight: FontWeight.bold,
          color: Colors.white,
        ),
      ),
    );
  }
}

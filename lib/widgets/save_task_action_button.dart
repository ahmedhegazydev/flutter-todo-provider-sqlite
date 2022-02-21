import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todoye/constants.dart';

import '../models/ActionType.dart';
import '../provider/task_data.dart';
import '../screens/create_task_screen.dart';

class SaveActionButton extends StatelessWidget {

  const SaveActionButton({
    Key key, this.saveCallback,

  }) : super(key: key);
  final Function saveCallback;


  @override
  Widget build(BuildContext context) {
    return  IconButton(
      icon: Icon(Icons.done),
      color: Colors.white,
      onPressed: () {
       saveCallback();
      },
    );

  }
}

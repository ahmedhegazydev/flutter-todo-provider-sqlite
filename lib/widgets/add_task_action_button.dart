import 'package:flutter/material.dart';
import 'package:todoye/constants.dart';

import '../screens/create_task_screen.dart';

class AddActionButton extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.symmetric(vertical: 8, horizontal: 12),

        child: IconButton(
          icon: Icon(Icons.add),
          color: Colors.white,
          onPressed: () {
            Navigator.pushNamed(context, CreateTaskScreen.id);
          },
        ));

  }
}

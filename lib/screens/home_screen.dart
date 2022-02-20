import 'package:flutter/material.dart';
import 'package:todoye/constants.dart';
import 'package:todoye/widgets/task_list_view.dart';
import 'package:todoye/widgets/list_box_title.dart';

import '../widgets/add_task_action_button.dart';

class HomeScreen extends StatelessWidget {
  static const String id = 'home_screen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        actions: [AddActionButton()],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(
                top: 20.0,
                left: 20.0,
                right: 20.0,
                bottom: 20.0,
              ),
              child: Container(
                decoration: BoxDecoration(
                  color: Color(kLightBackgroundColor),
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20.0),
                    topRight: Radius.circular(20.0),
                    bottomLeft: Radius.circular(20.0),
                    bottomRight: Radius.circular(20.0),
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    ListBoxTitle(),
                    Expanded(
                      child: new TaskListView(),
                    )
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}

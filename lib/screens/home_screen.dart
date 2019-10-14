import 'package:flutter/material.dart';
import 'package:todoye/constants.dart';
import 'package:todoye/models/task.dart';
import 'package:todoye/screens/create_task_screen.dart';
import 'package:todoye/widgets/task_list_view.dart';
import 'package:todoye/widgets/user_intro_section.dart';
import 'package:todoye/widgets/list_box_title.dart';

class HomeScreen extends StatelessWidget {
  final List<Task> tasks = [
    Task(name: 'Buy coffee'),
    Task(name: 'Go Shopping'),
    Task(name: 'Go Shopping'),
    Task(name: 'Go Shopping'),
    Task(name: 'Go Shopping'),
    Task(name: 'Go Shopping'),
    Task(name: 'Go Shopping'),
    Task(name: 'Go Shopping'),
  ];

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      endDrawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              child: Text('Drawer Header'),
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
            ),
            ListTile(
              title: Text('Item 1'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: Text('Item 2'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
      backgroundColor: Color(kPrimaryColor),
      appBar: AppBar(
        elevation: 0.0,
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Color(kFloatingActionButtonColor),
        child: Icon(
          Icons.add,
          color: Colors.white,
          size: 30.0,
        ),
        onPressed: (){
          Navigator.push(context, MaterialPageRoute(
              builder:(context)=> CreateTaskScreen() ));
        },
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          new UserIntroSection(),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(
                top: 20.0,
                left: 20.0,
                right: 20.0,
              ),
              child: Container(
                decoration: BoxDecoration(
                  color: Color(kLightBackgroundColor),
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20.0),
                    topRight: Radius.circular(20.0),
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    new ListBoxTitle(),
                    Expanded(
                      child: new TaskListView(tasks: tasks),
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

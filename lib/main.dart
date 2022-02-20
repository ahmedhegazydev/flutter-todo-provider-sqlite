import 'package:flutter/material.dart';
import 'package:todoye/constants.dart';
import 'package:todoye/models/ActionType.dart';
import 'package:todoye/provider/task_data.dart';
import 'package:todoye/screens/create_task_screen.dart';
import 'package:todoye/screens/home_screen.dart';
import 'package:provider/provider.dart';
import 'package:todoye/screens/welcome_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var taskData = TaskData();
    taskData.fetchTasks();

    return MultiProvider(
      providers: [
        //TaskData Provider
        ChangeNotifierProvider(create: (context) => taskData),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,

        title: 'To-Do',
        theme: ThemeData.dark().copyWith(
          appBarTheme: AppBarTheme(
            backgroundColor: Colors.transparent,
            elevation: 0,
          ),
          primaryColor: kPrimaryColor,
          scaffoldBackgroundColor: kPrimaryColor,
        ),

        initialRoute: WelcomeScreen.id,
        // initialRoute: HomeScreen.id,

        routes: {
          WelcomeScreen.id: (context) => WelcomeScreen(),
          HomeScreen.id: (context) => HomeScreen(),
          CreateTaskScreen.id: (context) => CreateTaskScreen(
                taskActionType: ActionType.Add,
              ),
        },
      ),
    );
  }
}

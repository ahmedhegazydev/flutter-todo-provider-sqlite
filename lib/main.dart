import 'package:flutter/material.dart';
import 'package:todoye/constants.dart';
import 'package:todoye/models/task_data.dart';
import 'package:todoye/screens/home_screen.dart';
import 'package:provider/provider.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      builder: (context) {
        var taskData = TaskData();
        taskData.fetchTasks();
        return taskData;
      },
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Todoye',
        theme: ThemeData.dark().copyWith(
          primaryColor: Color(kPrimaryColor),
          scaffoldBackgroundColor: Color(kPrimaryColor),
          floatingActionButtonTheme: FloatingActionButtonThemeData(
            backgroundColor: Color(kFloatingActionButtonColor),
          ),
          dividerTheme: DividerThemeData(
            color: Color(kLightBackgroundColor),
          ),
          brightness: Brightness.dark,

        ),
        home: HomeScreen(),

      ),
    );
  }
}

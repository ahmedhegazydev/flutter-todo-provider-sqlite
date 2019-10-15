import 'package:flutter/material.dart';
import 'package:todoye/constants.dart';
import 'package:todoye/models/task_data.dart';
import 'package:todoye/screens/home_screen.dart';
import 'package:provider/provider.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      builder: (context) => TaskData(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Todoye',
        theme: ThemeData(
          primaryColor: Color(kPrimaryColor)
        ),
        home: HomeScreen(),

      ),
    );
  }
}

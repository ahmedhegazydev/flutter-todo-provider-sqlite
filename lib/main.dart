import 'package:flutter/material.dart';
import 'package:todoye/constants.dart';
import 'package:todoye/screens/HomeScreen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Todoye',
      theme: ThemeData(
        primaryColor: Color(kPrimaryColor)
      ),
      home: HomeScreen(),

    );
  }
}

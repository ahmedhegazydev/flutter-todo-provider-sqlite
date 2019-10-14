import 'package:flutter/material.dart';
import 'package:todoye/constants.dart';
import 'package:todoye/screens/home_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      builder: (context, child) =>
          MediaQuery(data: MediaQuery.of(context).copyWith(alwaysUse24HourFormat: false), child: child),
      debugShowCheckedModeBanner: false,
      title: 'Todoye',
      theme: ThemeData(
        primaryColor: Color(kPrimaryColor)
      ),
      home: HomeScreen(),

    );
  }
}

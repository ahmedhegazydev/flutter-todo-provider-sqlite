import 'package:flutter/material.dart';
import 'package:todoye/screens/home_screen.dart';

class WelcomeScreen extends StatelessWidget {
  static const String id = 'welcome_screen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Center(
          child: FlatButton(
            onPressed: () {
              Navigator.pushNamed(context, HomeScreen.id);
            },
            child: Text('welcome Screen'),
          ),
        ),
      ),
    );
  }
}

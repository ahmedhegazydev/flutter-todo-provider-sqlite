import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Center(
          child: FlatButton(
            onPressed: () {
              print('You Login');
            },
            child: Text('Login Screen'),
          ),
        ),
      ),
    );
  }
}

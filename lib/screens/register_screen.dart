import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:todoye/constants.dart';

class RegisterScreen extends StatefulWidget {
  static const String id = 'register_screen';

  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final TextEditingController _emailTextController = TextEditingController();
  final TextEditingController _passwordTextController = TextEditingController();

  bool _taskTitleValidate = false;
  bool _obscureText = true;

  String emailText;
  String passwordText;

  void _toggleObscure() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Icon(
            Icons.apps,
            size: 50.0,
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 40.0, vertical: 10.0),
            child: TextField(
              keyboardType: TextInputType.emailAddress,
              autofocus: true,
              style: kInputTextStyle,
              controller: _emailTextController,
              onChanged: (value) {
                emailText = value;
                print(value);

              },
              decoration: InputDecoration(
                errorText: _taskTitleValidate ? 'Email Can\' Be Empty' : null,
                labelText: 'Email',
                labelStyle: kInputLabelTextStyle,
                suffixIcon: IconButton(
                  icon: Icon(
                    Icons.close,
                    color: Colors.white,
                  ),
                  onPressed: () {
                    WidgetsBinding.instance.addPostFrameCallback(
                            (_) => _emailTextController.clear());
                  },
                ),
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 40.0, vertical: 10.0),
            child: TextField(
              obscureText: _obscureText,
              autofocus: true,
              style: kInputTextStyle,
              controller: _passwordTextController,
              onChanged: (value) {
                print(value);
                passwordText = value;
              },
              decoration: InputDecoration(
                errorText:
                _taskTitleValidate ? 'Password Can\' Be Empty' : null,
                labelText: 'Password',
                labelStyle: kInputLabelTextStyle,
                suffixIcon: IconButton(
                  icon: Icon(
                    _obscureText ? Icons.visibility : Icons.visibility_off,
                    color: Colors.white,
                  ),
                  onPressed: _toggleObscure,
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 40.0, vertical: 20.0),
            child: Container(

              decoration: BoxDecoration(
                  color: Color(kFloatingActionButtonColor)
              ),
              child: FlatButton(
                onPressed: (){
                  print('You presses Register Button');
                },
                child: Text('REGISTER', style: TextStyle(color: Colors.white, fontSize: 20.0),),
              ),
            ),
          )
        ],
      ),
    );
  }
}

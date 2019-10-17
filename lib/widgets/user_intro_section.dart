import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class UserIntroSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    DateTime _currentDate = new DateTime.now();
    String formatedDate = new DateFormat.MMMMEEEEd().format(_currentDate);
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            'Hello Sindy',
            style: TextStyle(
              fontSize: 40.0,
              color: Colors.white,
            ),
          ),
          Text(
            '$formatedDate',
            style: TextStyle(
              fontSize: 20.0,
              color: Colors.white,
            ),
          )
        ],
      ),
    );
  }
}

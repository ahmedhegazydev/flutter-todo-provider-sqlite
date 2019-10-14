import 'package:flutter/material.dart';
import 'package:todoye/constants.dart';

class TimePicker extends StatelessWidget {
  TimePicker({this.icon, this.selectedTime, this.onPress});
  final IconData icon;
  final String selectedTime;
  final Function onPress;

  @override
  Widget build(BuildContext context) {
    return FlatButton(
      padding: EdgeInsets.symmetric(vertical: 10.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Icon(
            icon,
            color: Color(kBorderTileColor),
          ),
          SizedBox(
            width: 50.0,
          ),
          Text(
            selectedTime,
            style: kInputTextStyle,
          ),
        ],
      ),
      onPressed: onPress,
    );
  }
}

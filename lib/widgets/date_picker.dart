import 'package:flutter/material.dart';
import 'package:todoye/constants.dart';

class DatePicker extends StatelessWidget {
  DatePicker({
    this.formatedDate,
    this.selectedDate,
  });

  final String formatedDate;
  final Function selectedDate;

  @override
  Widget build(BuildContext context) {
    return FlatButton(
      padding: EdgeInsets.only(top: 30.0, bottom: 10.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Icon(
            Icons.calendar_today,
            color: Color(kBorderTileColor),
          ),
          SizedBox(
            width: 50.0,
          ),
          Text(
            '$formatedDate',
            style: kInputTextStyle,
          ),
          SizedBox(
            width: 50.0,
          ),
          // Text(
          //   'All Day',
          //   style: TextStyle(color: Color(kBorderTileColor)),
          // ),
        ],
      ),
      onPressed: () {
        selectedDate(context);
      },
    );
  }
}

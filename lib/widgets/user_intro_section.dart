import 'package:flutter/material.dart';

class UserIntroSection extends StatelessWidget {
  const UserIntroSection({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
            'Thrusday, 27 April',
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

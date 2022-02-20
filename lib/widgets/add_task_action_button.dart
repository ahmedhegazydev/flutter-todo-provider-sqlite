import 'package:flutter/material.dart';
import 'package:todoye/constants.dart';

import '../screens/create_task_screen.dart';

class AddActionButton extends StatelessWidget {
  // AddActionButton({
  //   this.formatedDate,
  //   this.selectedDate,
  // });

  // final String formatedDate;
  // final Function selectedDate;

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.symmetric(vertical: 8, horizontal: 12),

        // child: ElevatedButton(
        //   style: ElevatedButton.styleFrom(
        //     onPrimary: Colors.white,
        //     // onPrimary: Colors.grey,
        //     primary: isFormValid ? null : Colors.grey.shade700,
        //   ),
        //   onPressed: addOrUpdateNote,
        //   child: Text('Done'),
        // ),

        child: IconButton(
          icon: Icon(Icons.add),
          color: Colors.white,
          onPressed: () {
            Navigator.pushNamed(context, CreateTaskScreen.id);
          },
        ));

  }
}

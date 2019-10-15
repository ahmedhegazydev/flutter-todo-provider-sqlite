import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todoye/constants.dart';
import 'package:intl/intl.dart';
import 'package:todoye/models/task_data.dart';
import 'package:todoye/widgets/date_picker.dart';
import 'package:todoye/widgets/time_picker.dart';
import 'package:todoye/models/task.dart';


class CreateTaskScreen extends StatefulWidget {
  @override
  _CreateTaskScreenState createState() => _CreateTaskScreenState();
}

class _CreateTaskScreenState extends State<CreateTaskScreen> {
  final TextEditingController _taskTitleController = TextEditingController();

  String taskTitle = '';
  DateTime _currentDate = new DateTime.now();
  TimeOfDay _currentTime = new TimeOfDay.now();

  String timeText = 'Set A Time';

  ///Time picker

  @override
  Widget build(BuildContext context) {


    Future<Null> selectTime(BuildContext context) async {
      TimeOfDay selectedTime = await showTimePicker(
        context: context,
        initialTime: _currentTime,
      );

      MaterialLocalizations localizations = MaterialLocalizations.of(context);
      String formattedTime = localizations.formatTimeOfDay(selectedTime,
          alwaysUse24HourFormat: false);

      if (formattedTime != null) {
        setState(() {
          timeText = formattedTime;
        });
      }
    }

    ///Date Picker
    ///Selected Date
    String formatedDate = new DateFormat.yMMMd().format(_currentDate);
    Future<Null> selectedDate(BuildContext context) async {
      final DateTime _selectDate = await showDatePicker(
          context: context,
          initialDate: _currentDate,
          firstDate: DateTime(2019),
          lastDate: DateTime(2021),
          builder: (context, child) {
            return SingleChildScrollView(
              child: child,
            );
          });
      if (_selectDate != null) {
        setState(() {
          _currentDate = _selectDate;
        });
      }
    }

    return Scaffold(
      backgroundColor: Color(kPrimaryColor),
      appBar: AppBar(
        elevation: 0.0,
        title: Text('Create a Task'),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(
            right: 20.0,
            left: 20.0,
            top: 20.0,
          ),
          child: Container(
            decoration: BoxDecoration(
              color: Color(kLightBackgroundColor),
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20.0),
                topRight: Radius.circular(20.0),
              ),
            ),
            padding: EdgeInsets.symmetric(
              horizontal: 20.0,
              vertical: 20.0,
            ),
            child: Column(
              children: <Widget>[
                TextField(
                  style: kInputTextStyle,
                  controller: _taskTitleController,
                  onChanged: (value) {
                    taskTitle = value;
                  },
                  decoration: InputDecoration(
                    labelText: 'Add Task',
                    labelStyle: kInputLabelTextStyle,
                    suffixIcon: IconButton(
                      icon: Icon(
                        Icons.close,
                        color: Colors.white,
                      ),
                      onPressed: () {
                        WidgetsBinding.instance.addPostFrameCallback(
                            (_) => _taskTitleController.clear());
                      },
                    ),
                  ),
                ),
                DatePicker(
                  formatedDate: formatedDate,
                  selectedDate: selectedDate,
                ),
                TimePicker(
                  icon: Icons.access_time,
                  selectedTime: '$timeText',
                  onPress: () {
                    selectTime(context);
                  },
                ),
                FlatButton(
                  child: Text(
                    "LET'S GO",
                    style: TextStyle(fontSize: 30.0, color: Colors.white),
                  ),
                  onPressed: (){
                     Provider.of<TaskData>(context).addTask(taskTitle);
                     Navigator.pop(context);
                    },
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todoye/constants.dart';
import 'package:intl/intl.dart';
import 'package:todoye/provider/task_data.dart';
import 'package:todoye/widgets/date_picker.dart';
import 'package:todoye/widgets/time_picker.dart';

import '../models/ActionType.dart';
import '../models/task.dart';

class CreateTaskScreen extends StatefulWidget {
  static const String id = 'create_task_screen';

  final ActionType taskActionType = null;
  final Task taskToEdit = null;

  @override
  _CreateTaskScreenState createState() => _CreateTaskScreenState();

  const CreateTaskScreen({
    Key key,
    taskActionType,
    taskToEdit,
  }) : super(key: key);
}

class _CreateTaskScreenState extends State<CreateTaskScreen> {
  final TextEditingController _taskTitleController = TextEditingController();

  // final Task taskToEdit;

  // _CreateTaskScreenState({
  //   this.taskActionType,
  //   this.taskToEdit,
  // });
  // ActionType taskActionType;

  String taskTitle = '';
  bool _taskTitleValidate = false;
  DateTime _currentDate = new DateTime.now();
  TimeOfDay _currentTime = new TimeOfDay.now();

  TimeOfDay selectedTime;
  String formattedTime;
  String timeText;

  @override
  Widget build(BuildContext context) {
    /// Time Picker
    MaterialLocalizations localizations = MaterialLocalizations.of(context);

    String formatedDate = "";
    print(ActionType.Add.name);
    String addOrEdit =
        widget.taskActionType == ActionType.Add ? "Create " : "Edit";
    switch (widget.taskActionType) {
      case ActionType.Edit:
        _taskTitleController.text = widget.taskToEdit.name;
        timeText = widget.taskToEdit.time;
        formatedDate = widget.taskToEdit.date;
        break;
      default:
        formatedDate = new DateFormat.yMMMd().format(_currentDate);
        break;
    }

    ///Date Picker
    if (timeText == null)
      timeText = localizations.formatTimeOfDay(_currentTime,
          alwaysUse24HourFormat: false);
    Future<Null> selectedDate(BuildContext context) async {
      final DateTime _selectDate = await showDatePicker(
          context: context,
          initialDate: _currentDate,
          firstDate: DateTime(2010),
          lastDate: DateTime(2025),
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
      backgroundColor: (kPrimaryColor),
      appBar: AppBar(
        elevation: 0.0,
        actions: [
          IconButton(
            icon: Icon(Icons.done),
            color: Colors.white,
            onPressed: () {
              setState(() {
                taskTitle.isEmpty
                    ? _taskTitleValidate = true
                    : _taskTitleValidate = false;
              });
              if (_taskTitleValidate == true) {
                return;
              }
              Provider.of<TaskData>(context, listen: false)
                  .addTask(taskTitle, formatedDate, timeText);
              Navigator.pop(context);
            },
          )
        ],
        title: Text('$addOrEdit a Task'),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(
            right: 20.0,
            left: 20.0,
            top: 20.0,
            bottom: 20.0,
          ),
          child: Container(
            decoration: BoxDecoration(
              color: Color(kLightBackgroundColor),
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20.0),
                topRight: Radius.circular(20.0),
                bottomRight: Radius.circular(20.0),
                bottomLeft: Radius.circular(20.0),
              ),
            ),
            padding: EdgeInsets.symmetric(
              horizontal: 20.0,
              vertical: 20.0,
            ),
            child: Column(
              children: <Widget>[
                TextField(
                  autofocus: true,
                  style: kInputTextStyle,
                  controller: _taskTitleController,
                  onChanged: (value) {
                    taskTitle = value;
                  },
                  decoration: InputDecoration(
                    errorText:
                        _taskTitleValidate ? 'Title Can\' Be Empty' : null,
                    labelText: '$addOrEdit Task',
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
                  onPress: () async {
                    showTimePicker(
                      context: context,
                      initialTime: _currentTime,
                    ).then(
                      (TimeOfDay value) => setState(
                        () {
                          timeText = localizations.formatTimeOfDay(value,
                              alwaysUse24HourFormat: false);
                        },
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

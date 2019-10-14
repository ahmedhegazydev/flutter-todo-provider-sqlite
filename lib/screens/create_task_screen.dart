import 'package:flutter/material.dart';
import 'package:todoye/constants.dart';
import 'package:intl/intl.dart';

class CreateTaskScreen extends StatefulWidget {
  @override
  _CreateTaskScreenState createState() => _CreateTaskScreenState();
}

class _CreateTaskScreenState extends State<CreateTaskScreen> {
  final TextEditingController _taskTitleController = TextEditingController();
  String taskTitle = '';

  DateTime _currentDate = new DateTime.now();


  @override
  Widget build(BuildContext context) {

    String _formatedDate = new DateFormat.yMMMd().format(_currentDate);

    Future<Null> _selectedDate(BuildContext context) async{

      final DateTime _selectDate = await showDatePicker(
          context: context,
          initialDate: _currentDate,
          firstDate: DateTime(2019),
          lastDate: DateTime(2021),
          builder: (context,child) {
            return SingleChildScrollView(child: child,);
          }

      );
      if(_selectDate != null) {
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
              color: Colors.white,
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
                  controller: _taskTitleController,
                  onChanged: (value) {
                    taskTitle = value;
                  },
                  decoration: InputDecoration(
                      labelText: 'Add Task',
                      suffixIcon: IconButton(
                        icon: Icon(Icons.close),
                        onPressed: () {
                          WidgetsBinding.instance.addPostFrameCallback(
                              (_) => _taskTitleController.clear());
                        },
                      )),
                ),
                FlatButton(
                  padding: EdgeInsets.only(top: 30.0, bottom: 10.0),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      Icon(Icons.calendar_today),
                      SizedBox(
                        width: 50.0,
                      ),
                      Text('$_formatedDate'),
                      SizedBox(
                        width: 100.0,
                      ),
                      Text('All Day'),
                    ],
                  ),
                  onPressed: () {
                    _selectedDate(context);
                  },
                ),
                FlatButton(
                  padding: EdgeInsets.symmetric(vertical: 10.0),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      Icon(Icons.access_time),
                      SizedBox(
                        width: 50.0,
                      ),
                      Text('Thrusday at 10:00pm until'),
                    ],
                  ),
                  onPressed: () {
                    //TODO: add function here
                  },
                ),
                FlatButton(
                  padding: EdgeInsets.symmetric(vertical: 10.0),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      Icon(Icons.access_time),
                      SizedBox(
                        width: 50.0,
                      ),
                      Text('Thrusday at 12:00pm'),
                    ],
                  ),
                  onPressed: () {
                    //TODO: add function here
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

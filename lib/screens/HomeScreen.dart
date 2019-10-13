import 'package:flutter/material.dart';
import 'package:todoye/constants.dart';
import 'package:todoye/models/task.dart';




class HomeScreen extends StatelessWidget {

  final List<Task>tasks = [
    Task(name: 'Buy coffee'),
    Task(name: 'Go Shopping'),
    Task(name: 'Go Shopping'),
    Task(name: 'Go Shopping'),
    Task(name: 'Go Shopping'),
    Task(name: 'Go Shopping'),
    Task(name: 'Go Shopping'),
    Task(name: 'Go Shopping'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(kPrimaryColor),
      appBar: AppBar(
        elevation: 0.0,
        actions: <Widget>[
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Icon(
              Icons.menu,
              size: 30.0,
            ),
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Color(kFloatingActionButtonColor),
        child: Icon(
          Icons.add,
          color: Colors.white,
          size: 30.0,
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
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
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(
                top: 20.0,
                left: 20.0,
                right: 20.0,
              ),
              child: Container(
                decoration: BoxDecoration(
                  color: Color(kLightBackgroundColor),
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20.0),
                    topRight: Radius.circular(20.0),
                  ),
                ),
                child: Column(

                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[

                    Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Text(
                        'Today (7)',
                        style: TextStyle(
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ),

                    Expanded(
                      child: ListView.builder(
                          itemCount: tasks.length,
                          itemBuilder: (context, index) {
                            return Container(

                              decoration: BoxDecoration(
                                border: Border(
                                  bottom: BorderSide(
                                    width: 1.0,
                                    color: Color(kBorderTileColor),
                                    //TODO: reduce the color opacity
                                  )
                                )
                              ),
                              child: ListTile(
                                title: Text(
                                    tasks[index].name,
                                  style: TextStyle(color: Colors.white

                                  ),
                                ),
                                subtitle: Text(
                                    '09:30-11:00am',
                                  style: TextStyle(
                                    letterSpacing: 2.0,
                                      fontSize: 15.0,
                                      color: Color(kBorderTileColor),),
                                ),
                                leading: Checkbox(
                                  value: false,
                                ),
                              ),
                            );
                          }
                      ),
                    )

                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}

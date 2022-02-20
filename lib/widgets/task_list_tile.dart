import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:todoye/constants.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class TaskListTile extends StatelessWidget {
  const TaskListTile({
    this.taskTime,
    this.taskTitle,
    this.isChecked,
    this.checkboxCallback,
    this.deleteCallback,
    this.editCallback,
  });

  final String taskTime;
  final String taskTitle;
  final bool isChecked;
  final Function checkboxCallback;
  final Function deleteCallback;
  final Function editCallback;

  @override
  Widget build(final BuildContext buildContext) {
    DismissDirection directionVar;

    return Slidable(
      // Specify a key if the Slidable is dismissible.
      key: const ValueKey(0),

      // The start action pane is the one at the left or the top side.
      startActionPane: ActionPane(
        // A motion is a widget used to control how the pane animates.
        motion: const ScrollMotion(),

        // A pane can dismiss the Slidable.
        dismissible: DismissiblePane(onDismissed: () {
          deleteTask(buildContext);
        }),

        // All actions are defined in the children parameter.
        children: [
          // A SlidableAction can have an icon and/or a label.
          SlidableAction(
            onPressed: (_) {
              deleteTask(buildContext);
            },
            backgroundColor: Color(0xFFFE4A49),
            foregroundColor: Colors.white,
            icon: Icons.delete,
            label: 'Delete',
          ),
          SlidableAction(
            onPressed: (_) {
              editCallback();
            },
            backgroundColor: Color(0xFF21B7CA),
            foregroundColor: Colors.white,
            // icon: Icons.share,
            icon: Icons.edit,
            label: 'Edit',
          ),
        ],
      ),

      // The end action pane is the one at the right or the bottom side.
      // endActionPane: const ActionPane(
      //   motion: ScrollMotion(),
      //   children: [
      //     SlidableAction(
      //       // An action can be bigger than the others.
      //       flex: 2,
      //       // onPressed: doNothing,
      //       backgroundColor: Color(0xFF7BC043),
      //       foregroundColor: Colors.white,
      //       icon: Icons.archive,
      //       label: 'Archive',
      //     ),
      //     SlidableAction(
      //       // onPressed: doNothing,
      //       backgroundColor: Color(0xFF0392CF),
      //       foregroundColor: Colors.white,
      //       icon: Icons.save,
      //       label: 'Save',
      //     ),
      //   ],
      // ),

      // The child of the Slidable is what the user sees when the
      // component is not dragged.
      child: ListTile(
        title: Text(
          '$taskTitle',
          style: TextStyle(
            decoration: isChecked ? TextDecoration.lineThrough : null,
            color: Colors.white,
            fontSize: 20.0,
            letterSpacing: 2.0,
          ),
        ),
        subtitle: Text(
          '$taskTime',
          style: TextStyle(
            letterSpacing: 2.0,
            fontSize: 15.0,
            fontWeight: FontWeight.bold,
            color: Color(kBorderTileColor),
          ),
        ),
        leading: Checkbox(
          activeColor: Color(kBorderTileColor),
          checkColor: Colors.greenAccent,
          onChanged: checkboxCallback,
          value: isChecked,
        ),
      ),
    );

    // return Dismissible(
    //   background: Row(
    //     crossAxisAlignment: CrossAxisAlignment.stretch,
    //     mainAxisAlignment: MainAxisAlignment.end,
    //     children: <Widget>[
    //       Container(
    //         color: kPrimaryColor,
    //         padding: EdgeInsets.symmetric(horizontal: 20.0),
    //         child: Row(
    //           children: <Widget>[
    //             Padding(
    //               padding: const EdgeInsets.symmetric(horizontal: 20.0),
    //               child: Icon(
    //                 FontAwesomeIcons.check,
    //                 color: Colors.blue,
    //               ),
    //             ),
    //             Icon(
    //               Icons.delete,
    //               color: Colors.red,
    //             ),
    //           ],
    //         ),
    //       ),
    //     ],
    //   ),
    //   key: Key(taskTitle),
    //   onDismissed: (direction) {
    //     directionVar = direction;
    //     if (directionVar == DismissDirection.endToStart) {
    //       deleteCallback();
    //       Scaffold.of(context)
    //           .showSnackBar(SnackBar(content: Text("$taskTitle removed.")));
    //     } else if (directionVar == DismissDirection.startToEnd) {
    //       editCallback();
    //     }
    //   },
    //   child: ListTile(
    //     title: Text(
    //       '$taskTitle',
    //       style: TextStyle(
    //         decoration: isChecked ? TextDecoration.lineThrough : null,
    //         color: Colors.white,
    //         fontSize: 20.0,
    //         letterSpacing: 2.0,
    //       ),
    //     ),
    //     subtitle: Text(
    //       '$taskTime',
    //       style: TextStyle(
    //         letterSpacing: 2.0,
    //         fontSize: 15.0,
    //         fontWeight: FontWeight.bold,
    //         color: Color(kBorderTileColor),
    //       ),
    //     ),
    //     leading: Checkbox(
    //       activeColor: Color(kBorderTileColor),
    //       checkColor: Colors.greenAccent,
    //       onChanged: checkboxCallback,
    //       value: isChecked,
    //     ),
    //   ),
    // );
  }

  void deleteTask(BuildContext buildContext) {
    deleteCallback();
    Scaffold.of(buildContext)
        .showSnackBar(SnackBar(content: Text("$taskTitle removed.")));
  }
}

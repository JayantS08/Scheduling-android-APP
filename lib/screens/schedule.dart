import 'package:task/screens/first.dart';
import 'package:task/utils/remove_button.dart';
import 'package:flutter/material.dart';
import '../utils/decoration.dart';
import '../utils/is_completed.dart';
import '../services/controller.dart';
import 'package:task/utils/deadline.dart';
import 'package:task/utils/rouded_button.dart';

class Schedule extends StatefulWidget {
  final List list;
  final int index;

  Schedule({this.list, this.index});

  @override
  _ScheduleState createState() => _ScheduleState();
}

class _ScheduleState extends State<Schedule> {
  // Key to make the form's validation
  GlobalKey<FormState> _globalKey = GlobalKey<FormState>();

  Map<String, dynamic> _task = {'Completed': false};

  final _dateController = TextEditingController();
  final _titleController = TextEditingController();
  final _descriptionController = TextEditingController();

  // Constructor function
  void initState() {
    super.initState();

    if (widget.index != null) {
      _task = widget.list[widget.index];

      _titleController.text = _task['Title'];
      _descriptionController.text = _task['Description'];
      _dateController.text = _task['Deadline'];

    } else {
      _task['DeadLine'] = false;
    }
  }

  // Validator For Title (required):
  String _titleValidator(String value) {
    if (value.isEmpty) {
      return "Missing Title!";
    }
    // if it returns null, the field is valid
    return null;
  }

  _selectCompleted(bool value) {
    setState(() {
      _task['Completed'] = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.index == null ? 'New Schedule' : 'Edit Schedule'),
        actions: <Widget>[
          FlatButton(
            child: Row(
              children: <Widget>[
                Icon(Icons.person,color: Color(0xFFF1F3F6),),
                SizedBox(width: 2,),
                Text("LogOut",style: TextStyle(color: Color(0xFFF1F3F6))),
              ],
            ),
            onPressed: ()
            {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => FirstPage()),
              );
            },
          )
        ],
        backgroundColor: Color(0xFF4D70A6),
      ),
      body: SingleChildScrollView(
        child: Form(
          key: _globalKey,
          child: Container(
            padding: EdgeInsets.all(10.0),
            child: Center(
              child: Column(
                children: <Widget>[
                  SizedBox(height: 15,),
                  Align(
                    child: Text(
                      "  Details",
                      style: TextStyle(
                          color: Color(0xFF4D70A6),
                          fontSize: 14,
                          fontWeight: FontWeight.bold),
                      textAlign: TextAlign.left,
                    ),
                    alignment: Alignment.centerLeft,
                  ),
                  SizedBox(height: 5,),
                  Align(
                    child: Container(
                      width: 60,
                      height: 3,
                      color: Color(0xFF4D70A6),
                    ),
                    alignment: Alignment.centerLeft,
                  ),

                  SizedBox(height: 20,),
                  TextFormField(
                    decoration: decoration('Title', 'Schedule\'s title'),
                    maxLength: 100,
                    controller: _titleController,
                    validator: _titleValidator,
                    onSaved: (value) {
                      _task['Title'] = value;
                    },
                  ),
                  SizedBox(height: 15.0),
                  TextFormField(
                    decoration:
                        decoration('Description', 'Describe the Schedule'),
                    maxLines: 4,
                    maxLength: 400,
                    controller: _descriptionController,
                    onSaved: (value) {
                      _task['Description'] = value;
                    },
                  ),
                  SizedBox(height: 15.0),
                  Deadline(
                    controller: _dateController,
                    deadline: _task['Deadline'],
                    onSave: (value) {
                      _task['Deadline'] = value;
                    },
                  ),
                  SizedBox(height: 20.0),
                  isCompleted(_selectCompleted, _task['Completed']),
                  SizedBox(height: 48.0),
                  Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        removeButton(context, widget.list, widget.index),
                        RoundedButton(
                          color: Color(0xFF4D70A6),
                          text: widget.index == null
                              ? "Save Schedule"
                              : "Edit Schedule",

                          onPress: () {
                            if (_globalKey.currentState.validate()) {
                              _globalKey.currentState.save();
                              if (widget.index == null) {
                                newTodo(widget.list,_task).then((data) {Navigator.of(context).pop();});
                              } else {
                                editTodo(widget.list, widget.index,_task).then((data) {Navigator.of(context).pop();});
                              }
                            }
                          },
                        ),
                      ]),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

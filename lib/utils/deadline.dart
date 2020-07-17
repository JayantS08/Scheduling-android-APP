import 'package:flutter/material.dart';
import 'decoration.dart';

class Deadline extends StatefulWidget {
  final TextEditingController controller;
  String deadline;
  Function onSave;

  Deadline({this.controller, this.deadline, this.onSave});

  _DeadlineState createState() => _DeadlineState();
}

class _DeadlineState extends State<Deadline> {

  DateTime pickedDate;
  final _dateFormat =
      RegExp('(0?[1-9]|1[0-2])\/(0?[1-9]|1[0-9]|2[0-9]|3[0-1])\/[0-9]{4}');

  // Opens the DatePiker
  Future _selectDate() async {
    DateTime picked = await showDatePicker(
        context: context,
        initialDate: pickedDate ?? DateTime.now(),
        firstDate: DateTime.now().subtract( Duration(days: 30)),
        lastDate: DateTime.now().add( Duration(days: 30)));
    if (picked != null)
      setState(() {
        widget.controller.text = "${picked.month}/${picked.day}/${picked.year}";
        pickedDate = picked;
      });
  }


  String _deadlineValidator(String value) {
    if (!_dateFormat.hasMatch(value) && value != '') {
      return "Invalid Date Format!";
    }

    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Expanded(
          child: TextFormField(
            decoration: decoration('Deadline', ''),
            textAlign: TextAlign.center,
            controller: widget.controller,
            keyboardType: TextInputType.datetime,
            validator: _deadlineValidator,
            onSaved: widget.onSave,
          ),
        ),
        Container(
          width: 59.0,
          height: 59.0,
          child: RaisedButton(
            onPressed: _selectDate,
            child: Icon(Icons.date_range),
            color: Color(0xFF4D70A6),
          ),
        )
      ],
    );
  }
}


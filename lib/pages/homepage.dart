// ignore_for_file: prefer_const_constructors, curly_braces_in_flow_control_structures, avoid_unnecessary_containers

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class AgeCalculator extends StatefulWidget {
  @override
  _AgeCalculatorState createState() => _AgeCalculatorState();
}

class _AgeCalculatorState extends State<AgeCalculator> {
  var _selectedDate = DateTime.now();
  var _formattedDate = '';
  var _age = '';

  Future _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: _selectedDate,
        firstDate: DateTime(1900, 1),
        lastDate: DateTime.now());
    if (picked != null && picked != _selectedDate)
      setState(() {
        _selectedDate = picked;
        _formattedDate = DateFormat.yMd().format(_selectedDate);
        _age = calculateAge(_selectedDate);
      });
  }

  String calculateAge(DateTime birthDate) {
    DateTime currentDate = DateTime.now();
    int age = currentDate.year - birthDate.year;
    int month1 = currentDate.month;
    int month2 = birthDate.month;
    if (month2 > month1) {
      age--;
    } else if (month1 == month2) {
      int day1 = currentDate.day;
      int day2 = birthDate.day;
      if (day2 > day1) {
        age--;
      }
    }
    return age.toString();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text('Age Calculator')),
        shadowColor: Colors.purpleAccent,
      ),
      body: Center(
        child: Container(
          height: MediaQuery.of(context).size.height / 2,
          child: Column(
            children: <Widget>[
              InkWell(
                child: Container(
                  height: 40,
                  width: 170,
                  color: Colors.purple,
                  child: Center(
                      child: Text(
                    'Select Date of Birth',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                  )),
                ),
                onTap: () {
                  _selectDate(context);
                },
              ),
              SizedBox(height: 20.0),
              Text('Selected Date in MM/DD/YYYY is: $_formattedDate'),
              SizedBox(height: 20.0),
              Center(child: Text('Your Age is:')),
              SizedBox(height: 20),
              Container(
                  height: 50,
                  width: MediaQuery.of(context).size.width / 2,
                  color: Colors.purple,
                  child: Center(
                      child: Text(
                    '$_age Years',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  )))
            ],
          ),
        ),
      ),
    );
  }
}

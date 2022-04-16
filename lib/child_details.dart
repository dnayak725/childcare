// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:shared_preferences/shared_preferences.dart';

class ChildDetails extends StatefulWidget {
  final String name;
  final String lname;
  final String gender;
  final String phone;
  final String id;
  final String age;
  final String height;
  final String weight;
  // final String age;

  const ChildDetails(this.name, this.lname, this.gender, this.phone, this.id,
      this.age, this.height, this.weight);

  @override
  _ChildDetailsState createState() => _ChildDetailsState();
}

class _ChildDetailsState extends State<ChildDetails> {
  @override
  var bmiValue;
  GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFE1E4E8),
      appBar: AppBar(
        // ignore: prefer_const_literals_to_create_immutables

        title: Padding(
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
          child: Text("child Details"),
        ),
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: <Color>[Color(0xFF238A83), Color(0xFF0A918A)]),
          ),
        ),
      ),
      key: _scaffoldKey,
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(15),
            child: Container(
              alignment: Alignment.centerLeft,
              child: Text(
                "Child Details",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
              ),
            ),
          ),
          // Card(
          //   elevation: 0,
          //   margin: EdgeInsets.all(1),
          //   child: Padding(
          //     padding: const EdgeInsets.all(5),
          //     child: ListTile(
          //       leading: Text(
          //         'ID',
          //         style: TextStyle(fontWeight: FontWeight.w600),
          //       ),
          //       trailing: Text(
          //         widget.id,
          //       ),
          //     ),
          //   ),
          // ),
          Card(
            elevation: 0,
            margin: EdgeInsets.all(1),
            child: Padding(
              padding: const EdgeInsets.all(5),
              child: ListTile(
                leading: Text(
                  'Full Name',
                  style: TextStyle(fontWeight: FontWeight.w600),
                ),
                trailing: Text(
                  "${widget.name} ${widget.lname}",
                ),
              ),
            ),
          ),
          Card(
            elevation: 0,
            margin: EdgeInsets.all(1),
            child: Padding(
              padding: const EdgeInsets.all(5),
              child: ListTile(
                leading: Text(
                  'Gender',
                  style: TextStyle(fontWeight: FontWeight.w600),
                ),
                trailing: Text(
                  widget.gender,
                ),
              ),
            ),
          ),
          Card(
            elevation: 0,
            margin: EdgeInsets.all(1),
            child: Padding(
              padding: const EdgeInsets.all(5),
              child: ListTile(
                leading: Text(
                  'Phone Number',
                  style: TextStyle(fontWeight: FontWeight.w600),
                ),
                trailing: Text(
                  widget.phone,
                ),
              ),
            ),
          ),
          Card(
            elevation: 0,
            margin: EdgeInsets.all(1),
            child: Padding(
              padding: const EdgeInsets.all(5),
              child: ListTile(
                leading: Text(
                  'Age',
                  style: TextStyle(fontWeight: FontWeight.w600),
                ),
                trailing: Text(
                  widget.age,
                ),
              ),
            ),
          ),

          Card(
            elevation: 0,
            margin: EdgeInsets.all(1),
            child: Padding(
              padding: const EdgeInsets.all(5),
              child: ListTile(
                leading: Text(
                  'Height',
                  style: TextStyle(fontWeight: FontWeight.w600),
                ),
                trailing: Text(
                  widget.height,
                ),
              ),
            ),
          ),
          Card(
            elevation: 0,
            margin: EdgeInsets.all(1),
            child: Padding(
              padding: const EdgeInsets.all(5),
              child: ListTile(
                leading: Text(
                  'Weight',
                  style: TextStyle(fontWeight: FontWeight.w600),
                ),
                trailing: Text(
                  widget.weight,
                ),
              ),
            ),
          ),
          Card(
            elevation: 0,
            margin: EdgeInsets.all(1),
            child: Padding(
              padding: const EdgeInsets.all(5),
              child: ListTile(
                  leading: Text(
                    'Health Condition',
                    style: TextStyle(fontWeight: FontWeight.w600),
                  ),
                  trailing: Container(
                    height: 12,
                    width: 12,
                    decoration: BoxDecoration(
                      color: bmiValue <= 18
                          ? Colors.yellow
                          : bmiValue <= 28
                              ? Colors.green
                              : Colors.red,
                      borderRadius: BorderRadius.circular(50),
                    ),
                  )),
            ),
          ),
        ],
      ),
    );
  }

  void initState() {
    _calculateHealth();

    // TODO: implement initState
    super.initState();
  }

  _calculateHealth() {
    var height = double.parse(widget.height) / 3.281;
    var finalHeight = height * height;
    var weight = double.parse(widget.weight);
    var BMI = weight / finalHeight;
    var a = BMI < 20;
    setState(() {
      bmiValue = BMI;
    });
    print(BMI);
    print(a);
  }
}

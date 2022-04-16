// ignore_for_file: prefer_const_constructors

import 'package:childcare/add_child.dart';
import 'package:childcare/child_all.dart';
import 'package:childcare/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFE1E4E8),
      appBar: AppBar(
        backgroundColor: Color(0xFF37395f),
        // ignore: prefer_const_literals_to_create_immutables

        title: Text("CHILDCARE"),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 10),
                child: SizedBox(
                  height: 100, //height of button
                  width: double.infinity, //width of button
                  child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        // ignore: prefer_const_constructors
                        primary: Colors.blueAccent, //background color of button
                        //border width and color
                        elevation: 3, //elevation of button
                        shape: RoundedRectangleBorder(
                            //to set border radius to button
                            borderRadius: BorderRadius.circular(6.0)),
                        //content padding inside button
                      ),
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => AddChild()));
                      },
                      child: Text(
                        "New Child Entry",
                        style: TextStyle(fontSize: 22, letterSpacing: 1),
                      )),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 10),
                child: SizedBox(
                  height: 100, //height of button
                  width: double.infinity, //width of button
                  child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        // ignore: prefer_const_constructors
                        primary: Colors.purple, //background color of button
                        //border width and color
                        elevation: 3, //elevation of button
                        shape: RoundedRectangleBorder(
                            //to set border radius to button
                            borderRadius: BorderRadius.circular(6.0)),
                        //content padding inside button
                      ),
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => ChildAll()));
                      },
                      child: Text(
                        "View All Child",
                        style: TextStyle(fontSize: 22, letterSpacing: 1),
                      )),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 10),
                child: SizedBox(
                  height: 100, //height of button
                  width: double.infinity, //width of button
                  child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        // ignore: prefer_const_constructors
                        primary: Colors.pinkAccent, //background color of button
                        //border width and color
                        elevation: 3, //elevation of button
                        shape: RoundedRectangleBorder(
                            //to set border radius to button
                            borderRadius: BorderRadius.circular(6.0)),
                        //content padding inside button
                      ),
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => ChildAll()));
                      },
                      child: Text(
                        "Vaccine Notification",
                        style: TextStyle(fontSize: 22, letterSpacing: 1),
                      )),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 10),
                child: SizedBox(
                  height: 100, //height of button
                  width: double.infinity, //width of button
                  child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        // ignore: prefer_const_constructors
                        primary: Colors.indigo, //background color of button
                        //border width and color
                        elevation: 3, //elevation of button
                        shape: RoundedRectangleBorder(
                            //to set border radius to button
                            borderRadius: BorderRadius.circular(6.0)),
                        //content padding inside button
                      ),
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => ChildAll()));
                      },
                      child: Text(
                        "Exit Child",
                        style: TextStyle(fontSize: 22, letterSpacing: 1),
                      )),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 10),
                child: SizedBox(
                  height: 100, //height of button
                  width: double.infinity, //width of button
                  child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        // ignore: prefer_const_constructors
                        primary: Colors.red, //background color of button
                        //border width and color
                        elevation: 3, //elevation of button
                        shape: RoundedRectangleBorder(
                            //to set border radius to button
                            borderRadius: BorderRadius.circular(6.0)),
                        //content padding inside button
                      ),
                      onPressed: () async {
                        {
                          SharedPreferences sharedPreferences =
                              await SharedPreferences.getInstance();
                          sharedPreferences.remove("userstatus");

                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => LoginScreen()));
                        }
                      },
                      child: Text(
                        "Logout",
                        style: TextStyle(fontSize: 22, letterSpacing: 1),
                      )),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

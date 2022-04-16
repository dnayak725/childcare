import 'package:childcare/home_screen.dart';
import 'package:childcare/login_screen.dart';
import 'package:flutter/material.dart';
import 'dart:io';
import 'dart:async';
import 'package:shared_preferences/shared_preferences.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

late String finalStatus = "null";

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    print(finalStatus);
    getValidationData().whenComplete(() async => Timer(
          Duration(seconds: 3),
          finalStatus != 'null'
              ? () => Navigator.push(context,
                  MaterialPageRoute(builder: (context) => HomeScreen()))
              : () => Navigator.push(context,
                  MaterialPageRoute(builder: (context) => LoginScreen())),
        ));
  }

  Future getValidationData() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    var obtainStatus = sharedPreferences.getString("userstatus");
    print(obtainStatus);
    setState(() {
      finalStatus = obtainStatus!;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        alignment: Alignment.center,
        color: Color(0xFF37395f),
        child: Text(
          "CHILDCARE",
          style: TextStyle(
              fontSize: 30, fontWeight: FontWeight.bold, color: Colors.white),
        ),
      ),
    );
  }
}

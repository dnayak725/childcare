// ignore_for_file: prefer_const_constructors

import 'dart:convert';

import 'package:childcare/Api_service/service.dart';
import 'package:childcare/Models/child_data.dart';
import 'package:childcare/child_details.dart';
import 'package:childcare/edit_child.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class ChildAll extends StatefulWidget {
  const ChildAll({Key? key}) : super(key: key);

  @override
  State<ChildAll> createState() => _ChildAllState();
}

class _ChildAllState extends State<ChildAll> {
  @override
  // ChildResponse? allchildData;
  // _childallData() {
  //   final service = ChildAllData();
  //   service.childdata().then((data) async {
  //     setState(() {
  //       allchildData = data;

  //       print(data);
  //     });
  //   });
  // }
  List allData = [];
  List _foundUsers = [];

  timeStamp() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    var token = sharedPreferences.getString("userstatus");
    final response = await http.get(
      Uri.parse('https://childcare.pythonanywhere.com/staff-children'),
      headers: {"Authorization": "Bearer ${token}"},
    );

    if (response.statusCode == 200) {
      // If server returns an OK response, parse the JSON.
      var jsonResponse = json.decode(response.body);
      setState(() {
        allData = jsonResponse;
      });
      print(jsonResponse[0]['userId']);
      return jsonResponse;
    } else {
      // If that response was not OK, throw an error.
      throw Exception('Failed to load post');
    }
  }

  void initState() {
    timeStamp();
    _foundUsers = allData;
    // TODO: implement initState
    super.initState();
  }

  Widget build(BuildContext context) {
    print(allData);
    return Scaffold(
      backgroundColor: Color(0xFFE1E4E8),
      appBar: AppBar(
        backgroundColor: Color(0xFF37395f),
        // ignore: prefer_const_literals_to_create_immutables

        title: Text("CHILDCARE"),
      ),
      body: allData.length != 0
          ? Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(15),
                  child: Container(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "Child List",
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
                    ),
                  ),
                ),
                // Padding(
                //   padding: const EdgeInsets.only(
                //       left: 20, top: 1, bottom: 1, right: 20),
                //   child: Container(
                //     decoration: BoxDecoration(
                //       borderRadius: BorderRadius.circular(14),
                //       color: Colors.white,
                //       // ignore: prefer_const_literals_to_create_immutables
                //       boxShadow: [
                //         BoxShadow(color: Colors.grey, spreadRadius: 1),
                //       ],
                //     ),
                //     height: 50,
                //     child: Row(
                //       children: <Widget>[
                //         Padding(
                //           padding: const EdgeInsets.only(right: 15, left: 10),
                //           child: Stack(
                //             // ignore: prefer_const_literals_to_create_immutables
                //             children: [
                //               GestureDetector(
                //                 onTap: () => {},
                //                 // ignore: prefer_const_constructors
                //                 child: Icon(
                //                   Icons.search_outlined,
                //                   color: Colors.black54,
                //                   size: 22,
                //                 ),
                //               ),
                //             ],
                //           ),
                //         ),
                //         Expanded(
                //           child: Container(
                //             child: TextFormField(
                //               onChanged: (value) {
                //                 _runFilter(value);
                //               },
                //               controller: _searchController,
                //               // ignore: unnecessary_new
                //               decoration: new InputDecoration(
                //                   border: InputBorder.none,
                //                   focusedBorder: InputBorder.none,
                //                   enabledBorder: InputBorder.none,
                //                   errorBorder: InputBorder.none,
                //                   disabledBorder: InputBorder.none,
                //                   hintText: "Search"),
                //             ),
                //           ),
                //         ),
                //       ],
                //     ),
                //   ),
                // ),
                ListTile(
                    leading: Text(
                      "Edit",
                      style: TextStyle(fontWeight: FontWeight.w600),
                    ),
                    trailing: Text(
                      "Reg No",
                      style: TextStyle(fontWeight: FontWeight.w600),
                    ),
                    title: Center(
                        child: Text(
                      "Child Name",
                      style: TextStyle(fontWeight: FontWeight.w600),
                    ))),
                Expanded(
                    child: allData.isNotEmpty
                        ? ListView.builder(
                            physics: ScrollPhysics(),
                            itemCount: allData.length,
                            itemBuilder: (BuildContext context, int index) {
                              return Card(
                                margin: EdgeInsets.all(1),
                                child: Padding(
                                  padding: const EdgeInsets.all(5),
                                  child: ListTile(
                                      leading: GestureDetector(
                                          onTap: () {
                                            Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                    builder: (context) =>
                                                        EditChild(
                                                          // allData[index]['user']
                                                          //         ['id']
                                                          //     .toString(),
                                                          allData[index]['user']
                                                              ['first_name'],
                                                          allData[index]['user']
                                                              ['last_name'],
                                                          allData[index]
                                                              ['gender'],
                                                          allData[index]
                                                              ['phone'],

                                                          allData[index]['id']
                                                              .toString(),
                                                          allData[index]['age']
                                                              .toString(),
                                                          allData[index]
                                                                  ['height']
                                                              .toString(),
                                                          allData[index]
                                                                  ['weight']
                                                              .toString(),
                                                          allData[index][
                                                              'registration_number'],
                                                        )));
                                          },
                                          child: Icon(Icons.edit)),
                                      trailing: Text(
                                        allData[index]['registration_number']
                                            .toString(),
                                        style: TextStyle(
                                            color: Colors.green,
                                            fontSize: 15,
                                            fontWeight: FontWeight.w600),
                                      ),
                                      title: Center(
                                        child: GestureDetector(
                                          onTap: () {
                                            Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                    builder: (context) =>
                                                        ChildDetails(
                                                          // allData[index]['user']
                                                          //         ['id']
                                                          //     .toString(),
                                                          allData[index]['user']
                                                              ['first_name'],
                                                          allData[index]['user']
                                                              ['last_name'],
                                                          allData[index]
                                                              ['gender'],
                                                          allData[index]
                                                              ['phone'],
                                                          allData[index]['id']
                                                              .toString(),
                                                          allData[index]['age']
                                                              .toString(),
                                                          allData[index]
                                                                  ['height']
                                                              .toString(),
                                                          allData[index]
                                                                  ['weight']
                                                              .toString(),
                                                        )));
                                          },
                                          child: Text(
                                            allData[index]['user']['first_name']
                                                .toString(),
                                            style: TextStyle(
                                                color: Color(0xFF0A918A)),
                                          ),
                                        ),
                                      )),
                                ),
                              );
                            })
                        : Container(
                            child: Text("No Data Found"),
                          )),
              ],
            )
          : Center(
              child: Container(
                child: CircularProgressIndicator(),
              ),
            ),
    );
  }

  final _searchController = TextEditingController();
  void _runFilter(String enteredKeyword) {
    List results = [];
    if (enteredKeyword.isEmpty) {
      // if the search field is empty or only contains white-space, we'll display all users
      results = allData;
    } else {
      results = allData
          .where((user) =>
              user["name"].toLowerCase().contains(enteredKeyword.toLowerCase()))
          .toList();
      // we use the toLowerCase() method to make it case-insensitive
    }

    // Refresh the UI
    setState(() {
      _foundUsers = results;
    });
  }
}

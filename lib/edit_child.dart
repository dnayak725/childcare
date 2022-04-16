// ignore_for_file: prefer_const_constructors

import 'dart:io';

import 'package:childcare/Api_service/service.dart';
import 'package:childcare/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:image_picker/image_picker.dart';

class EditChild extends StatefulWidget {
  final String fname;
  final String lname;
  final String gender;
  final String phone;
  final String id;
  final String age;
  final String height;
  final String weight;
  final String regNumber;

  // final String age;

  const EditChild(this.fname, this.lname, this.gender, this.phone, this.id,
      this.age, this.height, this.weight, this.regNumber);

  @override
  _EditChildState createState() => _EditChildState();
}

class _EditChildState extends State<EditChild> {
  final fnameController = TextEditingController();
  final lnameController = TextEditingController();
  final genderController = TextEditingController();
  final phoneController = TextEditingController();
  final regController = TextEditingController();
  final ageController = TextEditingController();
  final weightController = TextEditingController();
  final heightController = TextEditingController();
  final vaccineController = TextEditingController();

  final formGlobalKey = GlobalKey<FormState>();
  // apiLoginCall() {
  //   final service = AddChildData();

  //   service.AddChild(
  //     {
  //       "firstName": fnameController.text,
  //       "lastName": lnameController.text,
  //       "gender": genderController.text,
  //       "phone": phoneController.text,
  //       "age": ageController.text,
  //       "weight": weightController.text,
  //       "height": heightController.text,
  //       "registrationNumber": regController.text,
  //       "vacine": vaccineController.text,
  //     },
  //   ).then(
  //     (value) async {
  //       if (value.message == "Child Create Successfully") {
  //         Navigator.push(
  //             context, MaterialPageRoute(builder: (context) => HomeScreen()));
  //       } else {
  //         print(value.message);
  //         _scaffoldKey.currentState!
  //             .showSnackBar(SnackBar(content: Text(value.message)));
  //       }
  //     },
  //   );
  // }
  updateChild() {
    final service = EditChildData();

    service.editchild(
      {
        "firstName": fnameController.text,
        "lastName": lnameController.text,
        "gender": genderController.text,
        "phone": phoneController.text,
        "age": ageController.text,
        "weight": weightController.text,
        "height": heightController.text,
        "registrationNumber": regController.text,
        "vacine": vaccineController.text,
        "image": Profileimage.toString(),
        "id": widget.id.toString(),
      },
    ).then(
      (value) async {
        if (value.message == "Child Update Successfully") {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => HomeScreen()));
        } else {
          print(value.message);
          _scaffoldKey.currentState!
              .showSnackBar(SnackBar(content: Text("Something went wrong")));
        }
      },
    );
  }

// image field
  File? Profileimage;
  Future _pickImage() async {
    final image = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (image == null) return;
    final imageTemporary = File(image.path);
    print(imageTemporary);
    setState(() {
      this.Profileimage = imageTemporary;
    });
  }

  @override
  GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF37395f),
        // ignore: prefer_const_literals_to_create_immutables

        title: Text("Edit Child"),
      ),
      backgroundColor: Color(0xFFE1E4E8),
      key: _scaffoldKey,
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            // ignore: prefer_const_literals_to_create_immutables
            children: [
              Container(
                // ignore: unnecessary_new
                decoration: new BoxDecoration(

                    // ignore: unnecessary_new
                    borderRadius: new BorderRadius.only(
                  topLeft: const Radius.circular(40.0),
                  topRight: const Radius.circular(40.0),
                )),

                child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: Form(
                    key: formGlobalKey,
                    child: Column(
                      children: [
                        TextFormField(
                          controller: fnameController,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'plese enter First Name';
                            }
                            return null;
                          },
                          decoration: InputDecoration(
                            contentPadding: EdgeInsets.symmetric(
                                vertical: 18, horizontal: 20),
                            hintText: "Enter First Name",
                            border: borderStyle(),
                            enabledBorder: borderStyle(),
                            focusedBorder: borderStyle(),
                            filled: true,
                            fillColor: Colors.white,
                          ),
                        ),
                        const SizedBox(height: 20),
                        TextFormField(
                          controller: lnameController,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'plese enter Last Name';
                            }
                            return null;
                          },
                          decoration: InputDecoration(
                            contentPadding: EdgeInsets.symmetric(
                                vertical: 18, horizontal: 20),
                            hintText: "Enter Last Name",
                            border: borderStyle(),
                            enabledBorder: borderStyle(),
                            focusedBorder: borderStyle(),
                            filled: true,
                            fillColor: Colors.white,
                          ),
                        ),
                        const SizedBox(height: 20),
                        TextFormField(
                          controller: genderController,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'plese enter Gender';
                            }
                            return null;
                          },
                          decoration: InputDecoration(
                            contentPadding: EdgeInsets.symmetric(
                                vertical: 18, horizontal: 20),
                            hintText: "Enter Gender",
                            border: borderStyle(),
                            enabledBorder: borderStyle(),
                            focusedBorder: borderStyle(),
                            filled: true,
                            fillColor: Colors.white,
                          ),
                        ),
                        const SizedBox(height: 20),
                        TextFormField(
                          keyboardType: TextInputType.number,
                          controller: phoneController,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'plese enter Phone Number';
                            }
                            return null;
                          },
                          decoration: InputDecoration(
                            contentPadding: EdgeInsets.symmetric(
                                vertical: 18, horizontal: 20),
                            hintText: "Enter Phone Number",
                            border: borderStyle(),
                            enabledBorder: borderStyle(),
                            focusedBorder: borderStyle(),
                            filled: true,
                            fillColor: Colors.white,
                          ),
                        ),
                        const SizedBox(height: 20),
                        TextFormField(
                          keyboardType: TextInputType.number,
                          controller: ageController,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'plese enter Age';
                            }
                            return null;
                          },
                          decoration: InputDecoration(
                            contentPadding: EdgeInsets.symmetric(
                                vertical: 18, horizontal: 20),
                            hintText: "Enter Age",
                            border: borderStyle(),
                            enabledBorder: borderStyle(),
                            focusedBorder: borderStyle(),
                            filled: true,
                            fillColor: Colors.white,
                          ),
                        ),
                        const SizedBox(height: 20),
                        TextFormField(
                          keyboardType: TextInputType.number,
                          controller: weightController,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'plese enter Weight';
                            }
                            return null;
                          },
                          decoration: InputDecoration(
                            contentPadding: EdgeInsets.symmetric(
                                vertical: 18, horizontal: 20),
                            hintText: "Enter Weight",
                            border: borderStyle(),
                            enabledBorder: borderStyle(),
                            focusedBorder: borderStyle(),
                            filled: true,
                            fillColor: Colors.white,
                          ),
                        ),
                        const SizedBox(height: 20),
                        TextFormField(
                          keyboardType: TextInputType.number,
                          controller: heightController,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'plese enter Height';
                            }
                            return null;
                          },
                          decoration: InputDecoration(
                            contentPadding: EdgeInsets.symmetric(
                                vertical: 18, horizontal: 20),
                            hintText: "Enter Height",
                            border: borderStyle(),
                            enabledBorder: borderStyle(),
                            focusedBorder: borderStyle(),
                            filled: true,
                            fillColor: Colors.white,
                          ),
                        ),
                        const SizedBox(height: 20),
                        TextFormField(
                          keyboardType: TextInputType.number,
                          controller: regController,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'plese enter Reg Number';
                            }
                            return null;
                          },
                          decoration: InputDecoration(
                            contentPadding: EdgeInsets.symmetric(
                                vertical: 18, horizontal: 20),
                            hintText: "Enter Reg Number",
                            border: borderStyle(),
                            enabledBorder: borderStyle(),
                            focusedBorder: borderStyle(),
                            filled: true,
                            fillColor: Colors.white,
                          ),
                        ),
                        GestureDetector(
                            onTap: () {
                              _pickImage();
                            },
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Align(
                                alignment: Alignment.center,
                                child: Container(
                                  height: 50,
                                  width: 50,
                                  decoration: BoxDecoration(
                                    color: Color(0xFF37395f),
                                    borderRadius: BorderRadius.circular(50),
                                  ),
                                  child: Icon(
                                    Icons.image,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            )),
                        Padding(
                          padding: const EdgeInsets.only(top: 20),
                          child: SizedBox(
                            height: 50, //height of button
                            width: double.infinity, //width of button
                            child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  // ignore: prefer_const_constructors
                                  primary: Color(
                                      0xFF37395f), //background color of button
                                  //border width and color
                                  elevation: 3, //elevation of button
                                  shape: RoundedRectangleBorder(
                                      //to set border radius to button
                                      borderRadius: BorderRadius.circular(40)),
                                  //content padding inside button
                                ),
                                onPressed: () {
                                  // if (formGlobalKey.currentState!.validate()) {
                                  if (formGlobalKey.currentState!.validate()) {
                                    updateChild();
                                  }
                                },
                                child: Text(
                                  "Update Child",
                                  style: TextStyle(fontSize: 17),
                                )),
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void initState() {
    _updateValue();

    // TODO: implement initState
    super.initState();
  }

  _updateValue() {
    fnameController.text = widget.fname;
    lnameController.text = widget.lname;
    genderController.text = widget.gender;
    phoneController.text = widget.phone;
    ageController.text = widget.age;
    weightController.text = widget.weight;
    heightController.text = widget.height;
    regController.text = widget.regNumber;
  }

  OutlineInputBorder borderStyle() {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(40),
      borderSide: BorderSide(
        color: Color(0xFFbfc6cb),
        style: BorderStyle.solid,
        width: 0.5,
      ),
    );
  }
}

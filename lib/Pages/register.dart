import 'dart:math';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

//import 'package:loginpage/login.dart';

import 'package:snackbar/snackbar.dart';

class MyReg extends StatefulWidget {
  const MyReg({Key? key}) : super(key: key);

  @override
  State<MyReg> createState() => _MyRegState();
}

class _MyRegState extends State<MyReg> {
  final _nameController = TextEditingController();
  final _mobilenumberController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();

  //final _usertypeController = TextEditingController();
  final _referenceController = TextEditingController();

  //final _divisionController = TextEditingController();
  //var db = FirebaseFirestore.instance;


  Future submit_details(String name, String email, int number, String division,
      String ref, String user) async {
    //await FirebaseFirestore.instance.collection('user').add({
    final userId = FirebaseAuth.instance.currentUser!.uid;
    await FirebaseFirestore.instance.collection('users').doc(userId).collection('subcollection').add({
      'Name': name,
      'Email': email,
      'Mobile Number': number,
      'Division': division,
      'Reference': ref,
      'Usertype': user,
    });
    /* await FirebaseFirestore.instance.collection('Users').add({
      'Name': name,
      'Email':email,
      'Mobile Number':number,
      'Division': division,
      'Reference':ref,
      'Usertype': user,
    });*/

  }

  Future signup() async {
    if (checkpassword()) {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: _emailController.text.trim(),
        password: _passwordController.text.trim(),
      );
      showDialog(context: context, builder: (context) {
        return Center(child: CircularProgressIndicator());
      });
      submit_details(
          _nameController.text.trim(),
          _emailController.text.trim(),
          int.parse(_mobilenumberController.text.trim()),
          divisionChoose.trim(),
          _referenceController.text.trim(),
          valueChoose.trim()
      );
      Navigator.of(context).pop();
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text("Successfully Signed Up")));
    } else {
      //Toast.show("Didn't Signed Up");
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text("Unable to Sign Up")));
    }
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _passwordController.dispose();
    _emailController.dispose();
    _confirmPasswordController.dispose();
    _referenceController.dispose();
    _mobilenumberController.dispose();
    _nameController.dispose();
  }

  String valueChoose = "Sign Up as:";
  List<String> usertype = <String>[
    'Sign Up as:',
    'Contracter',
    'Engineer',
    'Other'
  ];
  String divisionChoose = 'Select Division:';
  List<String> selectdivisiion = ['Select Division:', '1', '2', '3'];

  bool checkpassword() {
    if (_passwordController.text.trim() ==
        _confirmPasswordController.text.trim()) {
      return true;
    } else {
      return false;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage('assets/images/register.png'))),
        child: Scaffold(
          appBar: AppBar(
            title: Text(
              'Registration',
              style: TextStyle(),
            ),
            backgroundColor: Colors.grey,
          ),
          backgroundColor: Colors.white70,
          body: Stack(
            children: [
              SingleChildScrollView(
                child: Container(
                  padding: EdgeInsets.only(
                      left: MediaQuery
                          .of(context)
                          .size
                          .width * 0.1,
                      top: MediaQuery
                          .of(context)
                          .size
                          .height * 0.01,
                      right: MediaQuery
                          .of(context)
                          .size
                          .width * 0.1),
                  child: Column(
                    children: [
                      Container(
                        padding: EdgeInsets.only(
                            left: MediaQuery
                                .of(context)
                                .size
                                .width * 0.08,
                            top: MediaQuery
                                .of(context)
                                .size
                                .height * 0.05),
                        child: Text("Create Account ",
                            style: TextStyle(
                              fontSize: 40,
                              color: Colors.teal,
                            )),
                      ),
                      SizedBox(height: MediaQuery
                          .of(context)
                          .size
                          .height * 0.03,),
                      TextField(
                        controller: _nameController,
                        style: TextStyle(fontSize: 20),
                        decoration: InputDecoration(
                            hintText: "Name:",
                            fillColor: Colors.teal,
                            icon: Icon(
                                Icons.near_me_rounded
                            ),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(30))),
                      ),
                      SizedBox(
                        height: MediaQuery
                            .of(context)
                            .size
                            .height * 0.02,
                      ),
                      TextField(
                        controller: _emailController,
                        style: TextStyle(fontSize: 20),
                        decoration: InputDecoration(
                            hintText: "Email:",
                            fillColor: Colors.teal,
                            icon: Icon(
                                Icons.email_rounded
                            ),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(30))),
                      ),
                      SizedBox(
                        height: MediaQuery
                            .of(context)
                            .size
                            .height * 0.02,
                      ),
                      TextField(
                        controller: _mobilenumberController,
                        style: TextStyle(fontSize: 20),
                        decoration: InputDecoration(
                            hintText: "Mobile Number",
                            fillColor: Colors.teal,
                            icon: Icon(
                                Icons.phone_android_rounded
                            ),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(30))),
                      ),
                      SizedBox(
                        height: MediaQuery
                            .of(context)
                            .size
                            .height * 0.02,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Icon(
                              color: Colors.black38,
                              Icons.people
                          ),
                          Container(
                              height: 60,
                              width: 300,
                              alignment: Alignment.centerLeft,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(30),
                                  border: Border.all(color: Colors.black38)
                              ),
                              padding: EdgeInsets.all(16),

                              child: DropdownButton(
                                iconSize: 30,
                                borderRadius: BorderRadius.circular(30),
                                hint: Text("Register As: ", style: TextStyle(
                                  fontSize: 30,

                                ),),
                                items: usertype.map((valueitem) {
                                  return DropdownMenuItem(
                                      child: Text(valueitem),
                                      value: valueitem
                                  );
                                }).toList(),
                                onChanged: <String>(newvalue) {
                                  setState(() {
                                    valueChoose = newvalue;
                                  });
                                },
                                value: valueChoose,
                              )),
                        ],
                      ),
                      SizedBox(
                        height: MediaQuery
                            .of(context)
                            .size
                            .height * 0.02,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Icon(Icons.area_chart_rounded, color: Colors.black38),
                          Container(
                              height: 60,
                              width: 300,
                              alignment: Alignment.centerLeft,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(30),
                                  border: Border.all(color: Colors.black38)
                              ),
                              padding: EdgeInsets.all(16),

                              child: DropdownButton(

                                iconSize: 30,
                                borderRadius: BorderRadius.circular(30),
                                hint: Text(
                                  "Select Division: ", style: TextStyle(
                                  fontSize: 30,

                                ),),
                                items: selectdivisiion.map((valueitem) {
                                  return DropdownMenuItem(
                                      child: Text(valueitem),
                                      value: valueitem
                                  );
                                }).toList(),
                                onChanged: <String>(newvalue) {
                                  setState(() {
                                    divisionChoose = newvalue;
                                  });
                                },
                                value: divisionChoose,
                              )),
                        ],
                      ),
                      SizedBox(
                        height: MediaQuery
                            .of(context)
                            .size
                            .height * 0.02,
                      ),
                      TextField(
                        controller: _referenceController,
                        style: TextStyle(fontSize: 20),
                        decoration: InputDecoration(
                            hintText: "Reference Number",
                            fillColor: Colors.teal,
                            icon: Icon(
                                Icons.person
                            ),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(30))),
                      ),
                      SizedBox(
                        height: MediaQuery
                            .of(context)
                            .size
                            .height * 0.02,
                      ),
                      TextField(
                        obscureText: true,
                        controller: _passwordController,
                        style: TextStyle(fontSize: 20),
                        decoration: InputDecoration(
                            fillColor: Colors.teal,
                            hintText: "Password:",
                            icon: Icon(
                                Icons.password_rounded
                            ),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(30))),
                      ),
                      SizedBox(
                        height: MediaQuery
                            .of(context)
                            .size
                            .height * 0.02,
                      ),
                      TextField(
                        obscureText: true,
                        controller: _confirmPasswordController,
                        style: TextStyle(fontSize: 20),
                        decoration: InputDecoration(
                            fillColor: Colors.teal,
                            icon: Icon(
                                Icons.password_rounded
                            ),

                            hintText: "Confirm Password:",
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(30))),
                      ),
                      SizedBox(
                        height: MediaQuery
                            .of(context)
                            .size
                            .height * 0.04,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Sign Up",
                            style: TextStyle(fontSize: 40),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          CircleAvatar(
                            radius: 25,
                            backgroundColor: Colors.teal,
                            child: IconButton(
                              onPressed: () {
                                /** firebase storm startes*/
                                signup();
                                 Navigator.pushNamed(context, 'login');
                              },
                              icon: Icon(Icons.arrow_upward),
                            ),
                          )
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ));
  }
}

//import 'dart:js';

import 'package:flutter/material.dart';
import 'package:loginpage/Main_Page.dart';
import 'package:loginpage/register.dart';
import 'package:loginpage/login.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    initialRoute: 'mainpage',
    routes: {
      'mainpage': (context) => Mainpage(),
      'login': (context) => Mylogin(),
      'register':(context) => MyReg()
      },
    )
  );
}


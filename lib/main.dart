//import 'dart:js';

//import 'dart:js';

import 'package:flutter/material.dart';
import 'package:loginpage/Pages/forget_password.dart';
import 'package:loginpage/Pages/query_page.dart';
import 'package:loginpage/main_page.dart';
import 'package:loginpage/Pages/register.dart';
import 'package:loginpage/Pages/login.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:loginpage/Pages/home_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    initialRoute: 'mainpage',
    routes: {
      'mainpage': (context) => Mainpage(),
      'login': (context) => Mylogin(),
      'register':(context) => MyReg(),
      'forgetpassword':(context) => ForgetPassword(),
      'query_page':(context)=> Query(),
      'home_page': (context) => Homepage(),
      },
    )
  );
}


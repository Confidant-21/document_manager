import 'package:flutter/material.dart';
import 'package:loginpage/register.dart';
import 'package:loginpage/login.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    initialRoute: 'login',
    routes: {
      'login': (context) => Mylogin(),
      'register':(context) => MyReg()
      },
    )
  );
}


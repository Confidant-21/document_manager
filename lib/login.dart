import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:loginpage/register.dart';
import 'package:toast/toast.dart';

class Mylogin extends StatefulWidget {
  const Mylogin({Key? key}) : super(key: key);

  @override
  State<Mylogin> createState() => _MyloginState();
}

class _MyloginState extends State<Mylogin> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  Future signin() async {
    await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: _emailController.text.trim(),
        password: _passwordController.text.trim(),
    );
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _passwordController.dispose();
    _emailController.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          image: DecorationImage(image: AssetImage('assets/images/login.png'))),
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            'LoginPage',
            style: TextStyle(),
          ),
          backgroundColor: Colors.transparent,
        ),
        backgroundColor: Colors.white70,
        body: Stack(
          children: [
            Container(
              padding: EdgeInsets.only(
                  left: MediaQuery
                      .of(context)
                      .size
                      .width * 0.1,
                  top: MediaQuery
                      .of(context)
                      .size
                      .height * 0.1),
              child: Text("Welcome ",
                  style: GoogleFonts.bebasNeue(
                    fontSize: 60,
                    color: Colors.black87,
                  )),
            ),
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
                        .height * 0.3,
                    right: MediaQuery
                        .of(context)
                        .size
                        .width * 0.1),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "LOG",
                          style:
                          TextStyle(color: Colors.red[800], fontSize: 30),
                        ),
                        Text(
                          'in',
                          style: TextStyle(
                            color: Colors.cyan,
                            fontSize: 30,
                          ),
                        )
                      ],
                    ),
                    SizedBox(
                      height: MediaQuery
                          .of(context)
                          .size
                          .height * 0.02,
                    ),
                    TextField(
                      style: TextStyle(fontSize: 20),
                      controller: _emailController,
                      decoration: InputDecoration(
                          hintText: "Email:",
                          fillColor: Colors.teal,
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
                      style: TextStyle(fontSize: 20),
                      controller: _passwordController,
                      decoration: InputDecoration(
                          fillColor: Colors.teal,
                          hintText: "Password:",
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(30))),
                    ),
                    SizedBox(
                      height: MediaQuery
                          .of(context)
                          .size
                          .height * 0.03,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text(
                          "Sign In",
                          style: TextStyle(fontSize: 40),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        CircleAvatar(
                          radius: 25,
                          backgroundColor: Colors.teal,
                          child: IconButton(
                            onPressed: signin,
                            icon: Icon(Icons.arrow_forward),
                          ),
                        )
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        TextButton(
                            onPressed: () {
                              Navigator.pushNamed(context, 'register');
                            },
                            child: Text(
                              "Sign Up",
                              style: TextStyle(
                                fontSize: 25,
                                color: Colors.brown,
                                decoration: TextDecoration.underline,
                              ),
                            )),
                        TextButton(
                            onPressed: () {},
                            child: Text(
                              "Forget Password",
                              style: TextStyle(
                                fontSize: 25,
                                color: Colors.brown,
                                decoration: TextDecoration.underline,
                              ),
                            ))
                      ],
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

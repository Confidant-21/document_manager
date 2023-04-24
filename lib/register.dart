import 'package:flutter/material.dart';

class MyReg extends StatefulWidget {
  const MyReg({Key? key}) : super(key: key);

  @override
  State<MyReg> createState() => _MyRegState();
}

class _MyRegState extends State<MyReg> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(image: AssetImage('assets/images/register.png'))
      ),
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
            Container(
              padding: EdgeInsets.only(
                  left: MediaQuery.of(context).size.width * 0.17,
                  top: MediaQuery.of(context).size.height * 0.05),
              child: Text("Create Account ",
                  style: TextStyle(
                    fontSize: 45,
                    color: Colors.teal,
                  )),
            ),
            SingleChildScrollView(
              child: Container(
                padding: EdgeInsets.only(
                    left: MediaQuery.of(context).size.width * 0.1,
                    top: MediaQuery.of(context).size.height * 0.3,
                    right: MediaQuery.of(context).size.width * 0.1),
                child: Column(
                  children: [
                    TextField(
                      style: TextStyle(fontSize: 20),
                      decoration: InputDecoration(
                          hintText: "Name:",
                          fillColor: Colors.teal,
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(30))),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.02,
                    ),
                    TextField(
                      style: TextStyle(fontSize: 20),
                      decoration: InputDecoration(
                          hintText: "Email:",
                          fillColor: Colors.teal,
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(30))),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.02,
                    ),
                    TextField(
                      obscureText: true,
                      style: TextStyle(fontSize: 20),
                      decoration: InputDecoration(
                          fillColor: Colors.teal,
                          hintText: "Password:",
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(30))),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.02,
                    ),
                    TextField(
                      obscureText: true,
                      style: TextStyle(fontSize: 20),
                      decoration: InputDecoration(
                          fillColor: Colors.teal,
                          hintText: "Confirm Password:",
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(30))),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.04,
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
                            onPressed: () {},
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
      )
    );
  }
}

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Homepage extends StatefulWidget {
  const Homepage({Key? key}) : super(key: key);

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: Text("Home Page"),
        actions: [
          IconButton(
              onPressed: () {
                FirebaseAuth.instance.signOut();
              },
              icon: Icon(Icons.logout))
        ],
      ),
      backgroundColor: Colors.white54,
      body: Center(
        child: CircleAvatar(
          radius: 150,
          backgroundColor: Colors.teal,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.plus_one_rounded,
                size: 100,
              ),
              ElevatedButton(
              onPressed: (){
                Navigator.pushNamed(context, 'query_page');
              },
              child: Text(
                "Submit Query"
              ),
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Colors.deepOrange),

              ),
            ),]
          ),
        ),
      ),
    );
  }
}

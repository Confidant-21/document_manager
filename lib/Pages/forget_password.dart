import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class ForgetPassword extends StatefulWidget {
  const ForgetPassword({Key? key}) : super(key: key);

  @override
  State<ForgetPassword> createState() => _ForgetPasswordState();
}

class _ForgetPasswordState extends State<ForgetPassword> {
  @override
  Widget build(BuildContext context) {
    final _emailController = TextEditingController();
    Future passwordreset() async {
      try {
        await FirebaseAuth.instance
            .sendPasswordResetEmail(email: _emailController.text.trim());
        showDialog(
            context: context,
            builder: (context) {
              return AlertDialog(
                content: Text(
                    "Password Resent Link is been send to Your Email.",
                    style: TextStyle(fontSize: 14)),
              );
            });
      } on FirebaseAuthException catch (e) {
        showDialog(
            context: context,
            builder: (context) {
              return AlertDialog(
                content:
                    Text(e.message.toString(), style: TextStyle(fontSize: 14)),
              );
            });
      }
    }

    return Scaffold(
      appBar: AppBar(
        title: Text("Forget Password"),
        backgroundColor: Colors.grey,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              style: TextStyle(fontSize: 20),
              controller: _emailController,
              decoration: InputDecoration(
                  hintText: "Email:",
                  icon: Icon(
                    Icons.attach_email_rounded
                  ),
                  fillColor: Colors.teal,
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30))),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              "No Worries! Enter your email and we will send you reset link ",
              style: TextStyle(
                fontSize: 15,
              ),
            ),
            ElevatedButton(
                onPressed: () {
                  passwordreset();
                },
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Colors.grey),
                ),
                child: Text("Send Email"))
          ],
        ),
      ),
    );
  }
}

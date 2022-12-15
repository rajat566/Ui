//import 'package:blood/Screen/login_screen.dart';
//import 'package:blood/navbar/homepage.dart';
import 'package:flutter/material.dart';
//import 'package:flutter/src/foundation/key.dart';
//import 'package:flutter/src/widgets/framework.dart';

import 'package:flutter/material.dart';

class SignupScreen extends StatelessWidget {
  const SignupScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
                margin: EdgeInsets.only(
                  top: 70,
                ),
                child: Column(
                  children: [
                    CircleAvatar(
                        backgroundImage: ExactAssetImage("images/o.jpg"),
                        radius: 30),
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      "Blood Donation",
                      style:
                          TextStyle(fontSize: 21, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 7,
                    ),
                    Text(
                      "Give the gift of life!",
                      style:
                          TextStyle(fontSize: 13, fontWeight: FontWeight.w300),
                    )
                  ],
                )),
            SizedBox(
              height: 40,
            ),
            Form(
                child: Padding(
              padding: const EdgeInsets.all(25.0),
              child: Column(
                children: [
                  TextFormField(
                    decoration: InputDecoration(
                        labelText: "Username", hintText: "Username"),
                  ),
                  SizedBox(
                    height: 40,
                  ),
                  TextFormField(
                    decoration: InputDecoration(
                        labelText: "Password", hintText: "Password"),
                  ),
                  SizedBox(
                    height: 40,
                  ),
                  TextFormField(
                    decoration: InputDecoration(
                        labelText: "Confirm Password",
                        hintText: "Confirm Password"),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      MaterialButton(
                        onPressed: () {
                          // Navigator.push(
                          //    context,
                          //   MaterialPageRoute(
                          //     builder: (context) => LoginScreen()));
                        },
                        child: Text(
                          "Login?",
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 0,
                  ),
                  MaterialButton(
                    minWidth: double.infinity,
                    color: Color.fromARGB(255, 248, 99, 114),
                    onPressed: () {
                      // Navigator.push(context,
                      //  MaterialPageRoute(builder: (context) => LoginScreen()));
                    },
                    child: Text(
                      "Sign Up",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  MaterialButton(
                    onPressed: () {
                      // Navigator.push(context,
                      //   MaterialPageRoute(builder: (context) => HomePage()));
                    },
                    child: Text("Skip"),
                  ),
                ],
              ),
            ))
          ],
        ),
      ),
    );
  }
}

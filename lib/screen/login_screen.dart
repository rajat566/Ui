//import 'package:blood/Screen/forgot_password.dart';

//import 'package:blood/Screen/signup_screen.dart';
//import 'package:blood/navbar/home.dart';
//import 'package:blood/navbar/homepage.dart';

import 'package:flutter/material.dart';
import 'package:ui/phone.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(right: 200),
              child: Container(
                  margin: EdgeInsets.only(
                    top: 70,
                  ),
                  child: Column(
                    children: [
                      CircleAvatar(
                          backgroundImage: ExactAssetImage("images/o.jpg"),
                          radius: 35),
                      SizedBox(
                        height: 20,
                      ),
                      Text(
                        "Welocome",
                        style: TextStyle(
                            fontSize: 25, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        height: 7,
                      ),
                      Text(
                        "Give the gift of life!",
                        style: TextStyle(
                            fontSize: 13, fontWeight: FontWeight.w300),
                      )
                    ],
                  )),
            ),
            SizedBox(
              height: 50,
            ),
            Form(
                child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: TextFormField(
                    decoration:
                        InputDecoration(labelText: "Email", hintText: "Email"),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: TextFormField(
                    decoration: InputDecoration(
                        labelText: "Password", hintText: "Password"),
                  ),
                ),
                SizedBox(
                  height: 0,
                ),
                Row(
                  children: [
                    MaterialButton(
                      onPressed: () {
                        // Navigator.push(
                        //   context,
                        //  MaterialPageRoute(
                        //    builder: (context) => SignupScreen()));
                      },
                      child: Text("Sign up"),
                    ),
                    SizedBox(
                      width: 110,
                    ),
                    MaterialButton(
                      onPressed: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) => Phone()));
                      },
                      child: Text("Fogot password?"),
                    )
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: MaterialButton(
                    minWidth: double.infinity,
                    color: Color.fromARGB(255, 248, 99, 114),
                    onPressed: () {
                      // Navigator.push(context,
                      //  MaterialPageRoute(builder: (context) => LoginScreen()));
                    },
                    child: Text("Login"),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                MaterialButton(
                  onPressed: () {
                    //   Navigator.push(context,
                    //   MaterialPageRoute(builder: (context) => HomePage()));
                  },
                  child: Text("Skip"),
                ),
              ],
            ))
          ],
        ),
      ),
    );
  }
}

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:ui/form/update_form.dart';
import 'package:ui/form/user_form.dart';

import '../shared_preferences.dart';

class FormProfile extends StatefulWidget {
  const FormProfile({Key key}) : super(key: key);

  @override
  State<FormProfile> createState() => _FormProfileState();
}

class _FormProfileState extends State<FormProfile> {
  String email = "";
  String lname = "";
  String address = "";
  String name = "";

  ProfileState() {
    MySharedPreferences.instance
        .getStringValue("name")
        .then((value) => setState(() {
              name = value;
            }));
    MySharedPreferences.instance
        .getStringValue("lname")
        .then((value) => setState(() {
              lname = value;
            }));
    MySharedPreferences.instance
        .getStringValue("address")
        .then((value) => setState(() {
              address = value;
            }));
    MySharedPreferences.instance
        .getStringValue("email")
        .then((value) => setState(() {
              email = value;
            }));
  }

  @override
  void initState() {
    ProfileState();
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Edit profile"),
          actions: [
            MaterialButton(
              color: Colors.white,
              onPressed: () {
                signout(context);
              },
              child: Text(
                "Logout",
                style: TextStyle(
                    color: Color.fromARGB(255, 210, 100, 100), fontSize: 18),
              ),
            )
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.only(top: 50),
          child: Center(
            child: Column(children: [
              Text(name),
              Text(lname),
              Text(email),
              Text(address)
            ]),
          ),
        ));
  }

  Future signout(BuildContext context) async {
    MySharedPreferences.instance.removeAll();
    await FirebaseAuth.instance.signOut().whenComplete(() => Navigator.push(
        context, MaterialPageRoute(builder: (context) => UserForm())));
    //shared preferences
    // SharedPreferences prefs = await SharedPreferences.getInstance();
    // prefs.clear();
  }
}

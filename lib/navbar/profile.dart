import 'dart:convert';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:ui/Models/userprofile.dart';
import 'package:ui/screen/forgot_password.dart';
import 'package:ui/some%20Ui/login.dart';

import '../shared_preferences.dart';

class Profile extends StatefulWidget {
  const Profile({Key key}) : super(key: key);

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  TextEditingController inputcontroller = TextEditingController();
  TextEditingController _name = TextEditingController();
  TextEditingController _email = TextEditingController();
  TextEditingController _gender = TextEditingController();
  TextEditingController _address = TextEditingController();
  TextEditingController _DOB = TextEditingController();
  TextEditingController _MobileNo = TextEditingController();

  String name = "";
  String email = "";
  String gender = "";
  String address = "";
  String DOB = "";
  String MobileNo = "";

  bool isDataLoading = false;

  Future signout(BuildContext context) async {
    MySharedPreferences.instance.removeAll();
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences.remove('userdata');

    await FirebaseAuth.instance.signOut().whenComplete(() => Navigator.push(
        context, MaterialPageRoute(builder: (context) => ForgotPassword())));
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.clear();
  }

  @override
  void initState() {
    //  loadData();
    ProfileState();
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color.fromARGB(255, 248, 99, 114),
        appBar: AppBar(
          title: Text(
            "Profile Details",
            //  style: TextStyle(fontSize: 20, fontStyle: FontStyle.normal),
          ),
          backgroundColor: Color.fromARGB(255, 248, 99, 114),
          actions: [
            MaterialButton(
              color: Color.fromARGB(255, 248, 99, 114),
              onPressed: () {
                signout(context);
              },
              child: Text(
                "Logout",
                style: TextStyle(color: Colors.white, fontSize: 18),
              ),
            )
          ],
        ),
        body: isDataLoading
            ? SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      CircleAvatar(
                          backgroundImage: ExactAssetImage("images/o.jpg"),
                          radius: 35),
                      Text(
                        "Profile",
                        style: TextStyle(fontSize: 20),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right: 250),
                        child: Text(
                          "Mobile No :",
                          style: TextStyle(
                              color: Colors.black, fontWeight: FontWeight.bold),
                        ),
                      ),
                      Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            // color: Color.fromARGB(255, 222, 215, 215)
                            color: Colors.white),
                        margin: EdgeInsets.all(6),
                        padding: EdgeInsets.only(
                          left: 12,
                        ),
                        child: TextFormField(
                          controller: _MobileNo..text = '${MobileNo}',
                          decoration: InputDecoration(
                              hintText: "MobileNo", border: InputBorder.none),
                        ),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right: 250),
                        child: Text(
                          "First Name :",
                          style: TextStyle(
                              color: Colors.black, fontWeight: FontWeight.bold),
                        ),
                      ),
                      Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            // color: Color.fromARGB(255, 222, 215, 215)
                            color: Colors.white),
                        margin: EdgeInsets.all(6),
                        padding: EdgeInsets.only(
                          left: 12,
                        ),
                        child: TextFormField(
                          controller: _name..text = '${name}',
                          decoration: InputDecoration(
                              hintText: " FIrstName", border: InputBorder.none),
                        ),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right: 275),
                        child: Text(
                          "Email :",
                          style: TextStyle(
                              color: Colors.black, fontWeight: FontWeight.bold),
                        ),
                      ),
                      Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            color: Colors.white),
                        margin: EdgeInsets.all(6),
                        padding: EdgeInsets.only(
                          left: 12,
                        ),
                        child: TextFormField(
                          controller: _email..text = '${email}',
                          decoration: InputDecoration(
                              hintText: " Email", border: InputBorder.none),
                        ),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right: 265),
                        child: Text(
                          "Gender :",
                          style: TextStyle(
                              color: Colors.black, fontWeight: FontWeight.bold),
                        ),
                      ),
                      Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            color: Colors.white),
                        margin: EdgeInsets.all(6),
                        padding: EdgeInsets.only(
                          left: 12,
                        ),
                        child: TextFormField(
                          controller: _gender..text = '${gender}',
                          decoration: InputDecoration(
                              hintText: " Gender", border: InputBorder.none),
                        ),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right: 240),
                        child: Text(
                          "Date of Birth :",
                          style: TextStyle(
                              color: Colors.black, fontWeight: FontWeight.bold),
                        ),
                      ),
                      Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            color: Colors.white),
                        margin: EdgeInsets.all(6),
                        padding: EdgeInsets.only(
                          left: 12,
                        ),
                        child: TextFormField(
                          controller: _DOB..text = '${DOB}',
                          decoration: InputDecoration(
                              hintText: " Dob", border: InputBorder.none),
                        ),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right: 265),
                        child: Text(
                          "Address :",
                          style: TextStyle(
                              color: Colors.black, fontWeight: FontWeight.bold),
                        ),
                      ),
                      Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            color: Colors.white),
                        margin: EdgeInsets.all(6),
                        padding: EdgeInsets.only(
                          left: 12,
                        ),
                        child: TextFormField(
                          controller: _address..text = '${address}',
                          decoration: InputDecoration(
                              hintText: " Address", border: InputBorder.none),
                        ),
                      ),
                      // SizedBox(
                      //   height: 15,
                      // ),
                      // Text(
                      //   "Name : ${name}",
                      //   style: TextStyle(fontSize: 20),
                      // ),
                      // SizedBox(
                      //   height: 20,
                      // ),
                      // Text("Email Adress: ${email}"),
                      // SizedBox(
                      //   height: 20,
                      // ),
                      // Text("Gender:${gender}"),
                      // SizedBox(
                      //   height: 20,
                      // ),
                      // Text("Address:${address}"),
                      // SizedBox(
                      //   height: 20,
                      // ),
                      // Text("Address:${DOB}"),
                    ],
                  ),
                ),
              )
            : Center(
                child: CircularProgressIndicator(
                color: Colors.purple,
              ))

//child: Text(FirebaseAuth.instance.currentUser.phoneNumber)
        );
  }

  void loadData() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    var mapdata = json.decode(preferences.getString("userdata"));

    setState(() {
      MobileNo = mapdata['MobileNo'];
      name = mapdata['userName'];
      email = mapdata['userEmail'];
      gender = mapdata['userGender'];
      address = mapdata['userAddress'];
      DOB = mapdata['userDOB'];

      // isDataLoading = true;
    });

    // email = data['Email'];
  }

  void ProfileState() {
    MySharedPreferences.instance
        .getStringValue("email")
        .then((value) => setState(() {
              email = value;
            }));
    MySharedPreferences.instance
        .getStringValue("name")
        .then((value) => setState(() {
              name = value;
            }));

    MySharedPreferences.instance
        .getStringValue("mobileno")
        .then((value) => setState(() {
              MobileNo = value;
            }));

    MySharedPreferences.instance
        .getStringValue("gender")
        .then((value) => setState(() {
              gender = value;
            }));
    MySharedPreferences.instance
        .getStringValue("address")
        .then((value) => setState(() {
              address = value;
            }));
    MySharedPreferences.instance
        .getStringValue("DOB")
        .then((value) => setState(() {
              DOB = value;
            }));
    setState(() {
      isDataLoading = true;
    });
  }
}

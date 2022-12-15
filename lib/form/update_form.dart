import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UpdateForm extends StatefulWidget {
  const UpdateForm({Key key}) : super(key: key);

  @override
  State<UpdateForm> createState() => _UpdateFormState();
}

String name = "";
String email = "";
String gender = "";
String address = "";
String DOB = "";
String MobileNo = "";

class _UpdateFormState extends State<UpdateForm> {
  void initState() {
    loadData();
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Update"),
      ),
      body: Center(
        child: Column(
          children: [
            Text(
              "${address}",
              style: TextStyle(fontSize: 30),
            ),
          ],
        ),
      ),
    );
  }

  void loadData() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    var mapdata = json.decode(preferences.getString("userdata"));

    setState(() {
      MobileNo = mapdata['MobileNo'];
      name = mapdata['address'];
      email = mapdata['userEmail'];
      gender = mapdata['userGender'];
      address = mapdata['userAddress'];
      DOB = mapdata['userDOB'];
    });
    // email = data['Email'];
  }
}

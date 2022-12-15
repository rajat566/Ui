import 'dart:convert';

import 'package:firebase_auth/firebase_auth.dart';
//import 'package:flutter/src/foundation/key.dart';
//import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:ui/form/form_profile.dart';
import 'package:ui/form/update_form.dart';
import 'package:ui/navbar/homepage.dart';

import '../screen/forgot_password.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import '../shared_preferences.dart';

class UserForm extends StatefulWidget {
  const UserForm({Key key}) : super(key: key);

  @override
  State<UserForm> createState() => _UserFormState();
}

class _UserFormState extends State<UserForm> {
  String SelectedValue = 'Male';
  Future signout(BuildContext context) async {
    await FirebaseAuth.instance.signOut().whenComplete(() => Navigator.push(
        context, MaterialPageRoute(builder: (context) => ForgotPassword())));
    //shared preferences
    // SharedPreferences prefs = await SharedPreferences.getInstance();
    // prefs.clear();
  }

  @override
  Widget build(BuildContext context) {
    var _date;

    var s = 'Female';
    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.white,
          title: Text(
            "Profile",
            style: TextStyle(color: Colors.black),
          ),
          actions: [
            MaterialButton(
              color: Colors.white,
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
        body: SingleChildScrollView(
          child: SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(children: [
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
                  padding: const EdgeInsets.only(right: 233),
                  child: Text(
                    "Mobile No",
                    style: TextStyle(
                        color: Colors.black, fontWeight: FontWeight.w300),
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      color: Color.fromARGB(255, 222, 215, 215)),
                  margin: EdgeInsets.all(6),
                  padding: EdgeInsets.only(
                    left: 12,
                  ),
                  child: TextFormField(
                    controller: MobileNoController,
                    decoration: InputDecoration(
                        focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                          color: Colors.green,
                        )),
                        hintText: "Mobile No",
                        border: InputBorder.none),
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 233),
                  child: Text(
                    "First Name",
                    style: TextStyle(
                        color: Colors.black, fontWeight: FontWeight.w300),
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      color: Color.fromARGB(255, 222, 215, 215)),
                  margin: EdgeInsets.all(6),
                  padding: EdgeInsets.only(
                    left: 12,
                  ),
                  child: TextFormField(
                    controller: FNameController,
                    decoration: InputDecoration(
                        focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                          color: Colors.green,
                        )),
                        hintText: "First Name",
                        border: InputBorder.none),
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 235),
                  child: Text(
                    "Last Name",
                    style: TextStyle(
                        color: Colors.black, fontWeight: FontWeight.w300),
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      color: Color.fromARGB(255, 222, 215, 215)),
                  margin: EdgeInsets.all(7),
                  padding: EdgeInsets.only(left: 10),
                  child: TextFormField(
                    controller: LNameController,
                    decoration: InputDecoration(
                        hintText: "Last Name", border: InputBorder.none),
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 260),
                  child: Text(
                    "Email",
                    style: TextStyle(
                        color: Colors.black, fontWeight: FontWeight.w300),
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      color: Color.fromARGB(255, 222, 215, 215)),
                  margin: EdgeInsets.all(7),
                  padding: EdgeInsets.only(left: 10),
                  child: TextFormField(
                    controller: EmailController,
                    decoration: InputDecoration(
                        hintText: "Email", border: InputBorder.none),
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 250),
                  child: Text(
                    "Gender",
                    style: TextStyle(
                        color: Colors.black, fontWeight: FontWeight.w300),
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      color: Color.fromARGB(255, 222, 215, 215)),
                  margin: EdgeInsets.all(7),
                  padding: EdgeInsets.only(left: 10),
                  child: DropdownButtonFormField<String>(
                      decoration: InputDecoration(border: InputBorder.none),
                      value: SelectedValue,
                      items: ['Male', 'Female']
                          .map((String item) => DropdownMenuItem<String>(
                              child: Text(item), value: item))
                          .toList(),
                      onChanged: (String Value) {
                        setState(() {
                          SelectedValue = Value;
                        });
                      }),
                ),
                SizedBox(
                  height: 15,
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 225),
                  child: Text(
                    "Date of Birth",
                    style: TextStyle(
                        color: Colors.black, fontWeight: FontWeight.w300),
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      color: Color.fromARGB(255, 222, 215, 215)),
                  margin: EdgeInsets.all(7),
                  padding: EdgeInsets.only(left: 10),
                  child: TextField(
                    controller: DOBController,

                    decoration: InputDecoration(
                        border: InputBorder.none,
                        // icon: Icon(Icons.ac_unit_sharp),
                        suffixIcon: Icon(Icons.calendar_view_day),
                        labelText: "Date Of Birth"),
                    // onTap: () async {
                    //   DateTime pickeddate = await showDatePicker(
                    //       context: context,
                    //       initialDate: DateTime.now(),
                    //       firstDate: DateTime(2000),
                    //       lastDate: DateTime(2301));

                    //   if (pickeddate != null) {
                    //     setState(() {
                    //       _date.text =
                    //           DateFormat("yyyy-mm-dd").format(pickeddate);
                    //     });
                    //  }
                    //},
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 225),
                  child: Text(
                    "Place of Birth",
                    style: TextStyle(
                        color: Colors.black, fontWeight: FontWeight.w300),
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      color: Color.fromARGB(255, 222, 215, 215)),
                  margin: EdgeInsets.all(7),
                  padding: EdgeInsets.only(left: 10),
                  child: TextFormField(
                    decoration: InputDecoration(
                        hintText: "Place of Birth", border: InputBorder.none),
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 260),
                  child: Text(
                    "Adress",
                    style: TextStyle(
                        color: Colors.black, fontWeight: FontWeight.w300),
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      color: Color.fromRGBO(222, 215, 215, 1)),
                  margin: EdgeInsets.all(7),
                  padding: EdgeInsets.only(left: 10),
                  child: TextFormField(
                    controller: AddressController,
                    decoration: InputDecoration(
                        hintText: "Adress", border: InputBorder.none),
                  ),
                ),
                SizedBox(
                  height: 25,
                ),
                MaterialButton(
                  minWidth: double.infinity,
                  color: Color.fromARGB(255, 173, 45, 57),
                  onPressed: () {
                    formlogin();
                    // var getFname = FNameController.text;
                    // var getLname = LNameController.text;

                    // MySharedPreferences.instance
                    //     .setStringValue("email", getFname);
                    // MySharedPreferences.instance
                    //     .setStringValue("username", getLname);
                    // //login();
                    // Navigator.push(context,
                    //     MaterialPageRoute(builder: (context) => FormProfile()));
                  },
                  child: Text(
                    "Confirm",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ]),
            ),
          ),
        ));
  }

  TextEditingController FNameController = TextEditingController();
  TextEditingController LNameController = TextEditingController();
  TextEditingController EmailController = TextEditingController();
  TextEditingController AddressController = TextEditingController();
  TextEditingController MobileNoController = TextEditingController();
  TextEditingController genderController = TextEditingController();
  TextEditingController DOBController = TextEditingController();

  void formlogin() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();

    var headers = {
      'Cookie': 'ci_session=383d9372d0768560a235a9611ea2198d7e3a73db'
    };
    var request = http.Request(
        'POST',
        Uri.parse(
            'https://gravitinfosystems.com/Development/Astrolekha2/Admin/API_Call/addupdateUser?MobileNo=919425307625'));

    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();
    if (response.statusCode == 200) {
      await response.stream.bytesToString().then((value) async {
        var RecData = json.decode(value);
        print(RecData);

        //  Navigator.of(context).pushReplacement(
        //   MaterialPageRoute(builder: (context) => HomePage()));

        if (RecData["Status"] == true) {
          var RecData = json.decode(value);
          SharedPreferences sharedPreferences =
              await SharedPreferences.getInstance();

          var getname = FNameController.text;
          var getLname = LNameController.text;
          var getAddress = AddressController.text;
          var getEmail = EmailController.text;
          var getMobileNo = MobileNoController.text;
          var getgender = genderController.text;
          var getDOB = DOBController.text;

          MySharedPreferences.instance.setStringValue("name", getname);
          MySharedPreferences.instance.setStringValue("lname", getLname);
          MySharedPreferences.instance.setStringValue("address", getAddress);
          MySharedPreferences.instance.setStringValue("email", getEmail);
          MySharedPreferences.instance.setStringValue("mobileno", getMobileNo);
          MySharedPreferences.instance.setStringValue("gender", getgender);
          MySharedPreferences.instance.setStringValue("DOB", getDOB);

          //login();
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => HomePage()));

          //  var LoginData = RecData["data"][0];

          // Map<String, String> data = {
          //   "userMobileNo": RecData['MobileNo'],
          //   "userName": RecData['FName'],
          //   "userEmail": RecData['Email'],
          //   "userGender": RecData['Gender'],
          //   "userAddress": RecData['Address'],
          //   "userDOB": RecData['DOB'],
          // };
          // sharedPreferences.setString("userdata", json.encode(data));

          // Navigator.of(context).pushReplacement(
          //     MaterialPageRoute(builder: (context) => UpdateForm()));

          //   Navigator.push(
          //    context, MaterialPageRoute(builder: (context) => HomePage()));
          print("Data Updated Successfully");
        } else {
          Navigator.of(context).pushReplacement(
              MaterialPageRoute(builder: (context) => ForgotPassword()));

          print("Data not Updated Successfully");
        }
      });
    } else {
      print(response.reasonPhrase);
    }

    // if (response.statusCode == 200) {
    // //  print(await response.stream.bytesToString());

    // } else {
    //   print(response.reasonPhrase);
    // }
  }

  // TextEditingController LNameController = TextEditingController();

  // void login() async {
  //   if (FNameController.text.isNotEmpty && LNameController.text.isNotEmpty) {
  //     var postUrl =
  //         "https://gravitinfosystems.com/Development/Astrolekha2/Admin/API_Call/addupdateUser?MobileNo=919425307625";
  //     var auth = "auth.json";
  //     var login = postUrl + auth;

  //     var data = jsonEncode(
  //         {"FName": FNameController.text, "LName": LNameController.text});

  //     http.Response res = await http.post(Uri.parse(login),
  //         headers: {"Content-Type": "application/json"}, body: data);

  //     if (res.statusCode == 200) {
  //       final resData = jsonDecode(res.body);
  //       print(resData);
  //       String message = (resData['response']['message']);
  //       String FName = (resData['response']['member_info']['Fname']);
  //       String LName = (resData['response']['member_info']['Lname']);
  //       String fullName = FName + " " + LName;

  //       ScaffoldMessenger.of(context).showSnackBar(SnackBar(
  //         content: Text(message),
  //       ));
  //       pageRoute(fullName);
  //     } else if (res.statusCode == 400) {
  //       final resData = jsonDecode(res.body);
  //       String message = (resData['response']['message']);
  //       ScaffoldMessenger.of(context).showSnackBar(SnackBar(
  //         content: Text(message),
  //       ));
  //     }
  //   } else {
  //     ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
  //       content: Text("No username or password"),
  //     ));
  //   }
  // }

  // void pageRoute(String fullName) async {
  //   SharedPreferences pref = await SharedPreferences.getInstance();
  //   await pref.setString("data", fullName);
  //   Navigator.of(context)
  //       .pushReplacement(MaterialPageRoute(builder: (context) => HomePage()));
  //   // (route) => false;
  // }
}

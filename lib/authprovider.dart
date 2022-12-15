//import 'dart:js_util';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:ui/components/progressbar.dart';
import 'package:ui/form/user_form.dart';
//import 'package:fluttertoast/fluttertoast.dart';
//import 'package:ui/home.dart';
import 'package:ui/home_veg.dart';
import 'package:ui/navbar/home.dart';
import 'package:ui/navbar/homepage.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:ui/phone.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'navbar/profile.dart';

class AuthProvider {
  Future<bool> loginwithPhone(BuildContext context, String phn) async {
    FirebaseAuth _auth = FirebaseAuth.instance;
    TextEditingController otpC = TextEditingController();
    _auth.verifyPhoneNumber(
        phoneNumber: phn,
        verificationCompleted: (AuthCredential credential) async {
          UserCredential result = await _auth.signInWithCredential(credential);
          Navigator.pop(context);
          User user = result.user;
          if (user != null) {
            // userlogin(phn);
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => HomePage()));
          } else {
            print("Error");
            // Fluttertoast.showToast(msg: 'user is not signed in');
          }
        },
        verificationFailed: (FirebaseAuthException e) {
          // Fluttertoast.showToast(msg: e.toString());
        },
        codeSent: (String verificationcode, int token) {
          showDialog(
              context: context,
              builder: (_) {
                return AlertDialog(
                  title: Text('Enter otp'),
                  content: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      TextField(
                        controller: otpC,
                        keyboardType: TextInputType.number,
                      )
                    ],
                  ),
                  actions: [
                    ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          primary: Color.fromARGB(255, 248, 99, 114),
                        ),
                        onPressed: () async {
                          //   login(inputcontroller.text.toString());

                          final code = otpC.text;
                          AuthCredential credential =
                              PhoneAuthProvider.credential(
                                  verificationId: verificationcode,
                                  smsCode: code);
                          UserCredential result =
                              await _auth.signInWithCredential(credential);
                          User user = result.user;

                          if (user != null) {
                            userlogin(phn);

                            //  Navigator.push(
                            //   context,
                            //   MaterialPageRoute(
                            //      builder: (context) => UserForm()));

                            print('success');
                          } else {
                            Text("ERRor");
                            //Fluttertoast.showToast(msg: 'error');
                          }
                        },
                        child: Text(
                          'verify',
                          style: TextStyle(color: Colors.white),
                        ))
                  ],
                );
              });
        },
        codeAutoRetrievalTimeout: (id) => {});
  }

  // Future<void> logoutUser() async {
  //   await FirebaseAuth.instance.signOut();
  //   SharedPreferences prefes = await SharedPreferences.getInstance();
  //   prefes.clear();
  // }
  TextEditingController inputcontroller = TextEditingController();

  Future<void> userlogin(String mobile) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    print(mobile);

    var headers = {'Cookie': 'ci_session=ksidra3v4cheuilvghkpvp1u8cd0566m'};
    var request = http.MultipartRequest(
        'POST',
        Uri.parse(
            'https://astrolekha.com/Admin/API_Call/CheckUser?mobile=916260175117'));
    request.fields.addAll({'Token': '2342344', 'Customer_ID\n': '17'});

    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      await response.stream.bytesToString().then((value) {
        var ReceiveData = json.decode(value);

        if (ReceiveData["Status"] == true) {
          //   var ReceiveData = json.decode(value);

          var LoginData = ReceiveData["data"][0];

          Map<String, String> data = {
            "userName": LoginData['FName'],
            "userEmail": LoginData['Email'],
            "userGender": LoginData['Gender']
          };
          sharedPreferences.setString("userdata", json.encode(data));

          //   Navigator.of(context).pushReplacement(
          //  MaterialPageRoute(builder: (context) => HomePage()));
          //    Navigator.push(
          //   context, MaterialPageRoute(builder: (context) => HomePage()));
          print("login successfully goto Dashbaod");
        } else {
          //  Navigator.of(context).pushReplacement(
          //   MaterialPageRoute(builder: (context) => UserForm()));

          print("login not successfull goto form");
        }
      });
    } else {
      print(response.reasonPhrase);
    }
  }
}

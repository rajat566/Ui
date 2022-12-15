import 'dart:convert';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
//import 'package:http/http.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:ui/form/user_form.dart';
import 'package:ui/navbar/homepage.dart';
import 'package:ui/navbar/profile.dart';
import 'package:ui/phone.dart';

import '../Models/userprofile.dart';
import '../authprovider.dart';
import 'package:http/http.dart' as http;

import '../shared_preferences.dart';

class ForgotPassword extends StatefulWidget {
  const ForgotPassword({Key key}) : super(key: key);

  @override
  State<ForgotPassword> createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  TextEditingController inputcontroller = TextEditingController();
  GlobalKey formkey = GlobalKey<FormState>();

  @override
  void login(String mobile) async {
    try {
      http.Response response = await http.post(
          Uri.parse('https://astrolekha.com/Admin/API_Call/CheckUser'),
          body: {
            'mobile': '91' + inputcontroller.text,
          });
      if (response.statusCode == 200) {
        var resdata = jsonDecode(response.body.toString());

        if (resdata['Status'] == true) {
          SharedPreferences sharedPreferences =
              await SharedPreferences.getInstance();

          var LoginData = resdata["data"][0];

          Map<String, String> data = {
            "userName": LoginData['FName'],
            "userEmail": LoginData['Email'],
            "userGender": LoginData['Gender'],
            "userAddress": LoginData['Address'],
            "userMobileNo": LoginData['MobileNo'],
          };
          sharedPreferences.setString("userdata", json.encode(data));

          //  Navigator.push(
          //   context, MaterialPageRoute(builder: (context) => Profile()));
        } else
          // Navigator.push(
          // context, MaterialPageRoute(builder: (context) => UserForm()));

          print("Login failed");

        print(resdata);
        print('Login succesfully');
      } else {
        print('Failed');
      }
    } catch (e) {
      print(e.toString());
    }
  }

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
                      height: 60,
                    ),
                    Text(
                      "Login",
                      style:
                          TextStyle(fontSize: 25, fontWeight: FontWeight.w300),
                    ),
                    Text("",
                        style: TextStyle(
                            fontSize: 15, fontWeight: FontWeight.w300))
                  ],
                )),
            SizedBox(
              height: 40,
            ),
            Form(
                child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                children: [
                  IntlPhoneField(
                    inputFormatters: [
                      FilteringTextInputFormatter.deny(RegExp(r'[+]'))
                    ],
                    controller: inputcontroller,
                    decoration: InputDecoration(
                      labelText: 'Phone Number',
                      border: OutlineInputBorder(
                        borderSide: BorderSide(),
                      ),
                    ),
                    initialCountryCode: 'IN',
                    onChanged: (phn) {
                      print(phn.completeNumber);
                    },
                  ),
                  // TextFormField(
                  //   decoration: InputDecoration(
                  //       labelText: "Phone", hintText: "Phone N.o"),
                  // ),
                  SizedBox(
                    height: 5,
                  ),
                  Row(
                    children: [
                      MaterialButton(
                        onPressed: () {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) => Phone()));
                        },
                        child: Text(
                          "Login?",
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  MaterialButton(
                    minWidth: double.infinity,
                    color: Color.fromARGB(255, 228, 46, 64),
                    onPressed: () {
                      //  login(inputcontroller.text.toString());

                      if (inputcontroller.text != null) {
                        final Phn = '+91' + inputcontroller.text;
                        //AuthProvider().loginwithPhone(context, Phn);
                        loginwithPhone(context, Phn);
                      }

                      // Navigator.push(context,
                      //  MaterialPageRoute(builder: (context) => LoginScreen()));
                    },
                    child: Text(
                      "Login",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  MaterialButton(
                    onPressed: () {
                      // Navigator.push(context,
                      //  MaterialPageRoute(builder: (context) => LoginScreen()));
                    },
                    child: Text("Need Help?",
                        style: TextStyle(
                            fontSize: 15, fontWeight: FontWeight.w300)),
                  ),
                ],
              ),
            ))
          ],
        ),
      ),
    );
  }

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
            //  Navigator.push(
            // context, MaterialPageRoute(builder: (context) => HomePage()));
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

                            print('successss');
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

  Future<void> userlogin(String mobile) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    setState(() {
      sharedPreferences.remove('userdata');
    });

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
        //  MySharedPreferences.instance.setBooleanValue("loggedin", true);

        if (ReceiveData["Status"] == true) {
          //   var ReceiveData = json.decode(value);

          var LoginData = ReceiveData["data"][0];

          Map<String, String> data = {
            "userMobileNo": LoginData['MobileNo'],
            "userName": LoginData['FName'],
            "userEmail": LoginData['Email'],
            "userGender": LoginData['Gender'],
            "userAddress": LoginData['Address'],
            "userDOB": LoginData['DOB'],
          };
          sharedPreferences.setString("userdata", json.encode(data));

          Navigator.of(context).pushReplacement(
              MaterialPageRoute(builder: (context) => HomePage()));
          // Navigator.push(
          //context, MaterialPageRoute(builder: (context) => HomePage()));
          print("login successfully goto Dashbaod");
        } else {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => UserForm()));
          //  Navigator.of(context).pushReplacement(
          //  MaterialPageRoute(builder: (context) => UserForm()));

          print("login not successfull goto form");
        }
      });
    } else {
      print(response.reasonPhrase);
    }
  }
}

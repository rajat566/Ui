import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart';
import 'package:ui/authprovider.dart';
import 'package:google_sign_in/google_sign_in.dart';
//import 'package:ui/home.dart';
import 'package:ui/home_veg.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:http/http.dart' as http;
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:ui/screen/forgot_password.dart';

class Phone extends StatefulWidget {
  static const id = '/Phone';

  @override
  State<Phone> createState() => _PhoneState();
}

class _PhoneState extends State<Phone> {
  TextEditingController inputcontroller = TextEditingController();
  GlobalKey formkey = GlobalKey<FormState>();

  void login(String mobile) async {
    try {
      Response response = await post(
          Uri.parse('https://astrolekha.com/Admin/API_Call/CheckUser'),
          body: {
            'mobile': mobile,
          });
      if (response.statusCode == 200) {
        var data = jsonDecode(response.body.toString());
        print(data);
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
      appBar: AppBar(
        title: Text("Login"),
        backgroundColor: Color.fromARGB(255, 248, 99, 114),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CircleAvatar(
              backgroundImage: ExactAssetImage("images/o.jpg"), radius: 35),
          Padding(padding: EdgeInsets.only(top: 10)),
          SizedBox(
            height: 20,
          ),
          Text(
            "Login ",
            style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
          ),
          SizedBox(
            height: 30,
          ),
          Form(
            key: formkey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Padding(
                //   padding: const EdgeInsets.only(left: 10, right: 280),
                //   child: Text(
                //     "Phone :",
                //     style: TextStyle(
                //         color: Colors.black, fontWeight: FontWeight.bold),
                //   ),
                // ),
                Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      color: Colors.white),
                  margin: EdgeInsets.all(15),
                  padding: EdgeInsets.only(left: 5),
                  // child: IntlPhoneField(
                  //   controller: inputcontroller,
                  //   decoration: InputDecoration(
                  //     labelText: 'Phone Number',
                  //     border: OutlineInputBorder(
                  //       borderSide: BorderSide(),
                  //     ),
                  //   ),
                  //   initialCountryCode: 'ind',
                  //   onChanged: (phn) {
                  //     print(phn.completeNumber);
                  //   },
                  // ),

                  child: TextFormField(
                    controller: inputcontroller,
                    decoration: InputDecoration(
                        hintText: "Enter phone ",

                        // prefixIcon: Icon(Icons.phone_android),
                        border: InputBorder.none),
                  ),
                ),
                SizedBox(
                  height: 3,
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 250),
                  child: MaterialButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => ForgotPassword()));
                    },
                    child: Text("Login?",
                        style: TextStyle(
                            fontSize: 15, fontWeight: FontWeight.w300)),
                  ),
                ),

                SizedBox(
                  height: 5,
                ),

                OutlinedButton(
                  style: TextButton.styleFrom(
                    backgroundColor: Color.fromARGB(255, 248, 99, 114),
                  ),
                  onPressed: () {
                    login(inputcontroller.text.toString());
                    if (inputcontroller.text != null) {
                      final Phn = '91' + inputcontroller.text;
                      AuthProvider().loginwithPhone(context, Phn);
                    }
                  },
                  child: Text(
                    "Login",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                // Text("OR"),
                SizedBox(
                  height: 20,
                ),

                // Column(
                //   children: [
                //     Container(
                //       child: Padding(
                //         padding: const EdgeInsets.only(left: 70, right: 70),
                //         child: MaterialButton(
                //             height: 35,
                //             color: Colors.blue,
                //             onPressed: () async {
                //               GoogleSignIn gsn = GoogleSignIn();
                //               await gsn.signIn();
                //               if (gsn.currentUser != null) {
                //                 print(gsn.currentUser.displayName);
                //                 print(gsn.currentUser.photoUrl);
                //                 // Navigator.push(
                //                 //   context,
                //                 //   MaterialPageRoute(
                //                 //     builder: (_) => Home(
                //                 //   photoUrl: gsn.currentUser.photoUrl,
                //                 //   name:
                //                 //    gsn.currentUser.displayName)));
                //               }
                //             },
                //             child: Row(
                //               children: [
                //                 Image.network(
                //                   "https://blog.hubspot.com/hubfs/image8-2.jpg",
                //                   height: 20,
                //                   fit: BoxFit.fill,
                //                 ),
                //                 SizedBox(
                //                   width: 15,
                //                 ),
                //                 Text("Sign in with Google")
                //               ],
                //             )),
                //       ),
                //     )
                //   ],
                // )
              ],
            ),
          )
        ],
      ),
    );
  }
}

// Widget googlesigninButton(BuildContext context) {
//   Column(
//     children: [
//       Container(
//         child: Padding(
//           padding: const EdgeInsets.only(left: 70, right: 70),
//           child: MaterialButton(
//               height: 35,
//               color: Colors.blue,
//               onPressed: () async {
//                 GoogleSignIn gsn = GoogleSignIn();
//                 await gsn.signIn();
//                 if (gsn.currentUser != null) {
//                   print(gsn.currentUser.displayName);
//                   Navigator.pushAndRemoveUntil(
//                       context,
//                       MaterialPageRoute(
//                           builder: (BuildContext context) => Home()),
//                       ModalRoute.withName('/'));
//                 }
//               },
//               child: Row(
//                 children: [
//                   Image.network(
//                     "https://blog.hubspot.com/hubfs/image8-2.jpg",
//                     height: 20,
//                     fit: BoxFit.fill,
//                   ),
//                   SizedBox(
//                     width: 15,
//                   ),
//                   Text("Sign in with Google")
//                 ],
//               )),
//         ),
//       )
//     ],
//   );
// }

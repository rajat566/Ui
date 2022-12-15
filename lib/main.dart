import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:ui/form/form_profile.dart';
import 'package:ui/form/update_form.dart';
import 'package:ui/form/user_form.dart';
//import 'package:ui/home.dart';
import 'package:ui/home_veg.dart';
import 'package:ui/navbar/home.dart';
import 'package:ui/navbar/homepage.dart';
//import 'package:ui/login.dart';

import 'package:ui/phone.dart';
import 'package:ui/screen/forgot_password.dart';
import 'package:ui/shared_preferences.dart';
import 'package:ui/splashscreen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(MyApp());
  // _init();
}

// _init() async {
//   SharedPreferences prefs = await SharedPreferences.getInstance();
//   final token = prefs.getString("userId");
//   if (token != null) {
//     print('TOken: $token');

//     Navigator.pushReplacementNamed(context, );

//   }
// }

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    MySharedPreferences.instance
        .getBooleanValue("loggedin")
        .then((value) => setState(() {
              isLoggedIn = value;
            }));
    //  var userdata;

    return MaterialApp(title: "Login page", home: ForgotPassword()

        // initialRoute:'/',
        // routes: {
        // HomePage.id: (context) => HomePage()
        // Phone.id: (context) => Phone(),
        // Home_veg.id: (context) => Home_veg()
        // },
        );
  }

  bool isLoggedIn = false;
}

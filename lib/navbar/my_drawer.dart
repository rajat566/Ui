//import 'dart:html';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:ui/navbar/homepage.dart';
import 'package:ui/navbar/profile.dart';

import '../screen/forgot_password.dart';
import '../shared_preferences.dart';

class MyDrawer extends StatefulWidget {
  @override
  State<MyDrawer> createState() => _MyDrawerState();
}

class _MyDrawerState extends State<MyDrawer> {
  String email = "";
  String name = "";

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        color: Color.fromARGB(255, 248, 99, 114),
        child: ListView(
          children: [
            InkWell(
              splashColor: Colors.blue,
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => Profile()));
              },
              child: DrawerHeader(
                padding: EdgeInsets.zero,
                child: UserAccountsDrawerHeader(
                  decoration: BoxDecoration(
                    color: Color.fromARGB(255, 248, 99, 114),
                  ),
                  margin: EdgeInsets.zero,
                  accountName: Text(
                    name,
                    style: TextStyle(fontSize: 25),
                  ),
                  accountEmail: Text(email),
                  currentAccountPicture: CircleAvatar(
                    backgroundImage: NetworkImage(
                        // "https: static.wikia.nocookie.net/youtube/images/8/83/Kim_Jong_un_icon.jpg/revision/latest/top-crop/width/360/height/360?cb=20201124202650"
                        "https://c.ndtvimg.com/2021-01/itvru3bo_kim-jong-un-letter-650_625x300_01_January_21.jpg"),
                  ),
                ),
              ),
            ),
            ListTile(
              leading: Icon(
                Icons.ac_unit,
                color: Colors.white,
              ),
              title: Text(
                "Home",
                textScaleFactor: 1.2,
                style: TextStyle(color: Colors.white),
              ),
              onTap: () {
                // Navigator.push(context,
                //   MaterialPageRoute(builder: (context) => HomePage()));
              },
            ),
            ListTile(
              leading: Icon(
                Icons.access_alarm_sharp,
                color: Colors.white,
              ),
              title: Text(
                "Profile",
                textScaleFactor: 1.2,
                style: TextStyle(color: Colors.white),
              ),
              onTap: () {},
            ),
            ListTile(
              leading: Icon(
                Icons.access_alarms_rounded,
                color: Colors.white,
              ),
              title: Text(
                "Lists",
                textScaleFactor: 1.2,
                style: TextStyle(color: Colors.white),
              ),
              onTap: () {
                // Navigator.pushNamed(context, MyRoutes.listsRoute);
              },
            ),
            ListTile(
              leading: Icon(
                Icons.accessible_rounded,
                color: Colors.white,
              ),
              title: Text(
                "Bookmarks",
                textScaleFactor: 1.2,
                style: TextStyle(color: Colors.white),
              ),
              onTap: () {
                //  Navigator.pushNamed(context, MyRoutes.uploadRoute);
              },
            ),
            ListTile(
              leading: Icon(
                Icons.access_alarms,
                color: Colors.white,
              ),
              title: Text(
                "Memories",
                textScaleFactor: 1.2,
                style: TextStyle(color: Colors.white),
              ),
            ),
            ListTile(
              leading: Icon(
                Icons.access_time,
                color: Colors.white,
              ),
              title: Text(
                "Help Centre",
                textScaleFactor: 1.2,
                style: TextStyle(color: Colors.white),
              ),
            ),
            ListTile(
              leading: Icon(
                Icons.access_time,
                color: Colors.white,
              ),
              title: Text(
                "Logout",
                textScaleFactor: 1.2,
                style: TextStyle(color: Colors.white),
              ),
              onTap: () {
                signout(context);
                //    Navigator.pushNamed(context, MyRoutes.loginRoute);
              },
            )
          ],
        ),
      ),
    );
  }

  ProfileState() {
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
  }

  @overrid
  void initState() {
    ProfileState();
    // TODO: implement initState
    super.initState();
  }

  Future signout(BuildContext context) async {
    MySharedPreferences.instance.removeAll();
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences.remove('userdata');

    await FirebaseAuth.instance.signOut().whenComplete(() => Navigator.push(
        context, MaterialPageRoute(builder: (context) => ForgotPassword())));
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.clear();
  }
}

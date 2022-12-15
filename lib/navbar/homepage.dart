//import 'package:blood/navbar/blog.dart';
//import 'package:blood/navbar/home.dart';
//import 'package:blood/navbar/profile.dart';
//import 'package:blood/navbar/search.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ui/navbar/my_drawer.dart';
import 'package:ui/navbar/profile.dart';
import 'package:ui/navbar/search.dart';

import 'blog.dart';
import 'home.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key key}) : super(key: key);
  static const id = '/HomePage';

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int index = 0;
  final pages = [Home(), Search(), Blog(), Profile()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[index],
      bottomNavigationBar: NavigationBarTheme(
        data: NavigationBarThemeData(
            indicatorColor: Color.fromARGB(255, 248, 99, 114),
            labelTextStyle: MaterialStateProperty.all(TextStyle(
              fontSize: 11,
            ))),
        child: NavigationBar(
          backgroundColor: Color.fromARGB(179, 253, 250, 250),
          selectedIndex: index,
          onDestinationSelected: (index) => setState(() {
            this.index = index;
          }),
          destinations: const [
            NavigationDestination(icon: Icon(Icons.home_filled), label: "Home"),
            NavigationDestination(
                icon: Icon(Icons.done_all_outlined), label: "Donate"),
            NavigationDestination(
                icon: Icon(Icons.notification_important),
                label: "Notification"),
            NavigationDestination(
                icon: Icon(Icons.power_off_outlined), label: "Profile")
          ],
        ),
      ),
    );
  }
}

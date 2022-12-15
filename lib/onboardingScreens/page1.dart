import 'package:flutter/material.dart';

class Page1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Container(
            //   child: Text(
            //     "",
            //     style: TextStyle(fontSize: 35, color: Colors.white70),
            //   ),
            // ),
            Center(
              child: Image(
                height: 180,
                fit: BoxFit.fill,
                image: AssetImage("images/1.jpg"),
              ),
            ),
            SizedBox(
              height: 15,
            ),
            Text(
              "Blood Donation",
              style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                  color: Colors.black),
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              "World first Social Media Platform",
              style: TextStyle(fontWeight: FontWeight.w300),
            ),
            Text(
              "Platform for blood donation",
              style: TextStyle(fontWeight: FontWeight.w300),
            )
          ],
        ));
  }
}

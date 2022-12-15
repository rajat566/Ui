import 'package:flutter/material.dart';

class Page3 extends StatelessWidget {
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
                height: 200,
                fit: BoxFit.fill,
                image: AssetImage("images/3.jpg"),
              ),
            ),
            SizedBox(
              height: 15,
            ),
            Text(
              "Find Blood Donor",
              style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                  color: Colors.black),
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              "Calling hundreds of donor is no",
              style: TextStyle(fontWeight: FontWeight.w300),
            ),
            Text(
              " more required using our platform",
              style: TextStyle(fontWeight: FontWeight.w300),
            )
          ],
        ));
  }
}

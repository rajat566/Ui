import 'package:flutter/material.dart';

class Page2 extends StatelessWidget {
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
                image: AssetImage("images/2.png"),
              ),
            ),
            SizedBox(
              height: 15,
            ),
            Text(
              "100% Free",
              style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                  color: Colors.black),
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              "We never take money and we",
              style: TextStyle(fontWeight: FontWeight.w300),
            ),
            Text(
              " never make money for blood",
              style: TextStyle(fontWeight: FontWeight.w300),
            )
          ],
        ));
  }
}

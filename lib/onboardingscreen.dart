//import 'package:blood/Screen/login_screen.dart';
//import 'package:blood/onboardingScreens/page1.dart';
//import 'package:blood/onboardingScreens/page2.dart';
//import 'package:blood/onboardingScreens/page3.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:ui/onboardingScreens/page1.dart';
import 'package:ui/screen/login_screen.dart';

import 'onboardingScreens/page2.dart';
import 'onboardingScreens/page3.dart';

class OnboardingScreen extends StatefulWidget {
  OnboardingScreen({Key key}) : super(key: key);

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  @override
  PageController _controller = PageController();

  //keep track if we are on  last page or not
  bool onLastPage = false;

  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          actions: [
            MaterialButton(
              onPressed: () {
               
                
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => LoginScreen()));
              },
              child: Text("SKIP"),
            )
          ],
        ),
        body: Stack(
          children: [
            PageView(
              controller: _controller,
              onPageChanged: (index) {
                setState(() {
                  onLastPage = (index == 2);
                });
              },
              children: [Page1(), Page2(), Page3()],
            ),
            // dot indicators
            Container(
                alignment: Alignment(0, 0.75),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    //skip
                    GestureDetector(
                        onTap: () {
                          _controller.jumpToPage(2);
                        },
                        child: Text("")),

                    //dot indicator
                    SmoothPageIndicator(controller: _controller, count: 3),

                    //next or done
                    onLastPage
                        ? GestureDetector(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => LoginScreen()));
                            },
                            child: Text("Done"))
                        : GestureDetector(
                            onTap: () {
                              _controller.nextPage(
                                  duration: Duration(microseconds: 500),
                                  curve: Curves.easeIn);
                            },
                            child: Text("Next"),
                          )
                  ],
                ))
          ],
        ));
  }
}

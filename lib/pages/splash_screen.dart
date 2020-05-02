import 'dart:async';
import 'package:flutter/material.dart';
import 'package:mymcqapp/utils/my_navigator.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 3), () => MyNavigator.goToSlider(context));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(fit: StackFit.expand, children: <Widget>[
      Container(
        decoration: BoxDecoration(color: Colors.lightBlue),
      ),
      Column(mainAxisAlignment: MainAxisAlignment.start, children: <Widget>[
        Expanded(
          flex: 5,
          child: Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                CircleAvatar(
                    backgroundColor: Colors.white,
                    radius: MediaQuery.of(context).size.height * 0.11,
                    child: Image.asset(
                      'assets/mymcq.png',
                      height: MediaQuery.of(context).size.height * 0.15,
                      width: MediaQuery.of(context).size.height * 0.15,
                    ))
              ],
            ),
          ),
        ),
        Expanded(
          flex: 1,
          child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text("From",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: MediaQuery.of(context).size.height * 0.02,
                        color: Colors.white)),
                Text("CompanySite",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: MediaQuery.of(context).size.height * 0.03,
                        color: Colors.white))
              ]),
        )
      ])
    ]));
  }
}

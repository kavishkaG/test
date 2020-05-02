import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String myText = "hello world";

// void _changeText() async {
//   SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
//     if (myText.startsWith("h")) {
//       setState(() {
//         myText = "Welcome to MyApp";
//       });
//       print(sharedPreferences.getString("token"));
//     } else {
//       setState(() {
//         myText = "hello world";
//       });
//     }
//   }

   Widget _bodyWidget() {
    return Container(
        padding: const EdgeInsets.all(10.0),
        child: Center(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              myText,
              style: TextStyle(fontSize: 35.0),
            )
          ],
        )));
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: _bodyWidget()
        );
  }
}
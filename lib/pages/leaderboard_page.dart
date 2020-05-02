import 'package:flutter/material.dart';

class LeaderboardPage extends StatefulWidget {
  @override
  _LeaderboardPageState createState() => _LeaderboardPageState();
}

class _LeaderboardPageState extends State<LeaderboardPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.all(10.0),
        child: Center(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Leader Board',
              style: TextStyle(fontSize: 35.0),
            )
          ],
        )));
  }
}
import 'package:flutter/material.dart';
import 'package:mymcqapp/pages/login_page.dart';
import 'package:mymcqapp/pages/slider_page.dart';
import 'package:mymcqapp/pages/splash_screen.dart';
import 'package:mymcqapp/pages/tabs_bar.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
          primarySwatch: Colors.lightBlue,
          brightness: Brightness.light,
          accentColor: Colors.lightBlue
      ),
      home: SplashScreen(),
      routes: routes
    );
  }
}


var routes = <String, WidgetBuilder>{
  "/login": (BuildContext context) => LoginPage(),
  "/slider": (BuildContext context) => SliderPage(),
  "/tabs": (BuildContext context) => TabsBar()
};



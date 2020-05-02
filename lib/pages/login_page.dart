import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/services.dart';
import 'package:mymcqapp/pages/home_page.dart';
import 'package:mymcqapp/pages/side_bar.dart';
import 'package:mymcqapp/pages/tabs_bar.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginPage extends StatefulWidget {
  @override
  State createState() => LoginPageState();
}

class LoginPageState extends State<LoginPage>
    with SingleTickerProviderStateMixin {
  bool _isLoading = false;
  Animation<double> _iconAnimation;
  AnimationController _iconAnimationController;

  void _submitForm(String email, String password) async {
    // SharedPreferences sharedPreferences = await SharedPreferences.getInstance();

    // var data = json.encode({'email': email, 'password': password});

    // var response = await http.post("http://10.0.2.2:3000/auth/signIn",
    //     headers: {"Content-Type": "application/json"}, body: data);

    // if (response.statusCode == 200) {
    //   var jsonResponse = json.decode(response.body);
    //   if (jsonResponse['success'] != false) {
    //     setState(() {
    //       _isLoading = false;
    //     });
    //     sharedPreferences.setString("token", jsonResponse['token']);
    //     Navigator.of(context).pushAndRemoveUntil(
    //         MaterialPageRoute(builder: (BuildContext context) => TabsBar()),
    //         (Route<dynamic> route) => false);
    //   } else {
    //     setState(() {
    //       _isLoading = false;
    //     });
    //   }
    // } else {
    //   setState(() {
    //     _isLoading = false;
    //   });
    // }

    Navigator.of(context).pushAndRemoveUntil(
            MaterialPageRoute(builder: (BuildContext context) => SideBar()),
            (Route<dynamic> route) => false);

  }

  @override
  void initState() {
    super.initState();
    _iconAnimationController =
        AnimationController(vsync: this, duration: Duration(milliseconds: 500));
    _iconAnimation = CurvedAnimation(
      parent: _iconAnimationController,
      curve: Curves.bounceOut,
    );
    _iconAnimation.addListener(() => this.setState(() {}));
    _iconAnimationController.forward();
  }

  @override
  Widget build(BuildContext context) {
    TextEditingController emailController = new TextEditingController();
    TextEditingController passwordController = new TextEditingController();

    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(fit: StackFit.loose, children: <Widget>[
        Theme(
          data: ThemeData(
              brightness: Brightness.light,
              inputDecorationTheme: InputDecorationTheme(
                labelStyle: TextStyle(
                    color: Colors.lightBlue,
                    fontSize: MediaQuery.of(context).size.height * 0.03,
                    fontWeight: FontWeight.bold),
              )),
          isMaterialAppTheme: true,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Expanded(flex: 2, child: Container()),
              Expanded(
                  flex: 4,
                  child: Container(
                      padding: const EdgeInsets.only(left: 30.0),
                      child: Column(children: <Widget>[
                        Align(
                            alignment: Alignment.centerLeft,
                            child: Container(
                                child: Column(children: <Widget>[
                              Image.asset('assets/mymcq.png',
                                  height: MediaQuery.of(context).size.height *
                                      0.15),
                            ])))
                      ])
                      )),
              Expanded(
                  flex: 3,
                  child: Container(
                    padding: const EdgeInsets.only(left: 40.0),
                    child: Column(children: <Widget>[
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text("Welcome Back,",
                            textAlign: TextAlign.left,
                            style: TextStyle(
                                fontSize:
                                    MediaQuery.of(context).size.height * 0.05,
                                color: Colors.lightBlue,
                                fontWeight: FontWeight.bold)),
                      ),
                      Align(
                          alignment: Alignment.centerLeft,
                          child: Text("Sign in to continue",
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                  fontSize:
                                      MediaQuery.of(context).size.height * 0.03,
                                  color: Colors.grey,
                                  fontWeight: FontWeight.bold))),
                    ]),
                  )),
              Expanded(
                  flex: 10,
                  child: Container(
                    padding: const EdgeInsets.only(left: 40.0, right: 40.0),
                    child: Form(
                      autovalidate: true,
                      child: Column(
                        children: <Widget>[
                          Expanded(
                              flex: 8,
                              child: Container(
                                  child: TextFormField(
                                controller: emailController,
                                decoration: InputDecoration(
                                    labelText: "Email",
                                    fillColor: Colors.black),
                                keyboardType: TextInputType.emailAddress,
                              ))),
                          Expanded(
                              flex: 8,
                              child: Container(
                                  child: TextFormField(
                                controller: passwordController,
                                decoration: InputDecoration(
                                    labelText: "Password",
                                    fillColor: Colors.black),
                                obscureText: true,
                                keyboardType: TextInputType.visiblePassword,
                              ))),
                          Expanded(flex: 1, child: Container()),
                          Expanded(
                              flex: 4,
                              child: Container(
                                  child: Column(children: <Widget>[
                                Align(
                                  alignment: Alignment.centerRight,
                                  child: Text("Forget Password?",
                                      textAlign: TextAlign.left,
                                      style: TextStyle(
                                          fontSize: MediaQuery.of(context)
                                                  .size
                                                  .height *
                                              0.02,
                                          color: Colors.grey,
                                          fontWeight: FontWeight.bold)),
                                )
                              ]))),
                          Expanded(flex: 1, child: Container()),
                          Expanded(
                              flex: 4,
                              child: Container(
                                  child: MaterialButton(
                                      height:
                                          MediaQuery.of(context).size.height *
                                              0.1,
                                      minWidth:
                                          MediaQuery.of(context).size.width *
                                              0.75,
                                      color: Colors.lightBlue,
                                      splashColor: Colors.lightBlue,
                                      textColor: Colors.white,
                                      child: Text("Login",
                                          style: TextStyle(
                                            fontSize: MediaQuery.of(context)
                                                    .size
                                                    .height *
                                                0.03,
                                          )),
                                      onPressed: () {
                                        _submitForm(emailController.text,
                                            passwordController.text);
                                      }))),
                          Expanded(flex: 2, child: Container()),
                          Expanded(
                              flex: 4,
                              child: Container(
                                  child: Text("New User? Signup",
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                          fontSize: MediaQuery.of(context)
                                                  .size
                                                  .height *
                                              0.02,
                                          color: Colors.grey,
                                          fontWeight: FontWeight.bold)))),
                          Expanded(flex: 2, child: Container())
                        ],
                      ),
                    ),
                  )),
              Expanded(flex: 1, child: Container())
            ],
          ),
        ),
      ]),
    );
  }
}

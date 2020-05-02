import 'package:flutter/material.dart';

class MyNavigator {
  static void goToLogin(BuildContext context) {
    Navigator.pushNamed(context, "/login");
  }
  static void goToSlider(BuildContext context) {
    Navigator.pushNamed(context, "/slider");
  }
  static void goToTabs(BuildContext context) {
    Navigator.pushNamed(context, "/tabs");
  }
}

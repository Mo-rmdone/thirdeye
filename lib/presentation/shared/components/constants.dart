// String token = 'token';
import 'package:flutter/material.dart';

bool token = true;

String? _emailValidator(String? value) {
  if (value == null || value.isEmpty) {
    return 'Please enter your email';
  }
  if (!RegExp(r'^[\w-]+(\.[\w-]+)*@([\w-]+\.)+[a-zA-Z]{2,7}$')
      .hasMatch(value)) {
    return 'Please enter a valid email';
  }
  return null;
}
String? _passwordValidator(String? value) {
  if (value == null || value.isEmpty) {
    return 'Please enter your password';
  }
  return null;
}
String img = 'assets/images/';
String icon = 'assets/icons/';
String animated = 'assets/icons/animated.riv';
class testScreen {


  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width *.45;
    double height = MediaQuery.of(context).size.width *.45;
    double sizedBoxWidth = MediaQuery.of(context).size.width *.05;
    double sizedBoxHeight = MediaQuery.of(context).size.width *.05;
    return  Scaffold();
  }
}


// var w = MediaQuery.of(context).size.width;
// var h = MediaQuery.of(context).size.height;
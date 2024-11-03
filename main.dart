import 'package:flutter/material.dart';
import 'package:first_project/pages/homepage.dart';
import 'package:first_project/pages/signup.dart';
import 'package:first_project/pages/signin.dart';
import 'package:first_project/pages/user_profile.dart';
void main(){
  runApp(const counter());
}

class counter extends StatelessWidget {
  const counter({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        './homepage': (context) => homepage(isLoggedIn: true, username:""),
        './signup': (context) => signup(),
        './signin': (context) => signin(),
        './user_profile': (context) => user_profile(),
      },
      home: homepage(isLoggedIn: true, username:""),
    );
  }
}
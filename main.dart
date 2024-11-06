
import 'package:flutter/material.dart';
import 'package:first_project/pages/homepage.dart';
// import 'package:first_project/pages/signup.dart';
// import 'package:first_project/pages/signin.dart';
// import 'package:first_project/pages/user_profile.dart';
import 'package:get/get.dart';
void main(){
  runApp(const counter());
}

class counter extends StatelessWidget {
  const counter({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
//      routes: {
//        './homepage': (context) => homepage(isLoggedIn: true, username:""), this shit not neede
//        './signup': (context) => signup(),
//       './signin': (context) => signin(),
//        './user_profile': (context) => user_profile(),
      debugShowCheckedModeBanner: false,
      home: homepage(isLoggedIn: true, username:"demo"),
    );
  }
}

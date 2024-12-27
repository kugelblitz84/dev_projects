// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:first_project/pages/homepage.dart';
//import 'package:first_project/pages/animated_search.dart';
// import 'package:first_project/pages/signup.dart';
// import 'package:first_project/pages/signin.dart';
// import 'package:first_project/pages/user_profile.dart';
import 'package:get/get.dart';
void main(){
  runApp(const Traveler());
}

class Traveler extends StatelessWidget{
  const Traveler({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      //scrollBehavior: MyCustomScrollBehavior(),
      debugShowCheckedModeBanner: false,
      home: homepage(isLoggedIn: true, username:"demo"),
      
    );
  }
}

// class MyCustomScrollBehavior extends MaterialScrollBehavior {
//   @override
//   Set<PointerDeviceKind> get dragDevices => {
//         PointerDeviceKind.touch,
//         PointerDeviceKind.mouse, // Enables scrolling via mouse drag
//       };
// }

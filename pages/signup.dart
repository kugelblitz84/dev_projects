// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'dart:ui';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'dart:io' show Platform;
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class signup extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        alignment: Alignment.center,
        padding: EdgeInsets.all(32),
        decoration: BoxDecoration(
          image: DecorationImage(
              image: NetworkImage(
                  'https://images.unsplash.com/photo-1500375592092-40eb2168fd21?q=80&w=988&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D'),
              fit: BoxFit.cover),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Center(
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Hello 👋',
                    style: TextStyle(
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                        color: Colors.black),
                  ),
                  //SizedBox(height: 10),
                  Text(
                    'Wellcome to the signup page',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 16, color: Colors.black,
                      // foreground: Paint()
                      //   ..style = PaintingStyle.stroke
                      //   ..strokeWidth = 3
                      //   ..color = Colors.blue, // Border color
                    ),
                  ),
                  SizedBox(height: 20),
                  Container(
                    padding: EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: Colors.black.withAlpha(5),
                      border: Border.all(color: Colors.blue),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Column(
                      children: [
                        BackdropFilter(
                            filter:
                                ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0)),
                        Row(
                          children: [
                            Expanded(
                              child: TextField(
                                decoration: InputDecoration(
                                  // filled: true,
                                  fillColor: Colors.white,
                                  labelText: 'Name',
                                  labelStyle:
                                      TextStyle(color: Colors.purple[900]),
                                  border: OutlineInputBorder(),
                                ),
                              ),
                            ),
                            SizedBox(width: 10),
                            Expanded(
                              child: TextField(
                                decoration: InputDecoration(
                                  labelText: 'Username',
                                  labelStyle:
                                      TextStyle(color: Colors.purple[900]),
                                  // filled: true,
                                  fillColor: Colors.white,
                                  border: OutlineInputBorder(),
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 10),
                        TextField(
                          decoration: InputDecoration(
                            // filled: true,
                            fillColor: Colors.white,
                            labelText: 'Email',
                            hintText: 'example@gmail.com',
                            labelStyle: TextStyle(color: Colors.purple[900]),
                            border: OutlineInputBorder(),
                          ),
                        ),
                        SizedBox(height: 10),
                        Row(
                          children: [
                            Expanded(
                              child: TextField(
                                keyboardType: TextInputType.number,
                                decoration: InputDecoration(
                                  // filled: true,
                                  fillColor: Colors.white,
                                  labelText: 'Phone',
                                  prefix: Text("+880"),
                                  labelStyle:
                                      TextStyle(color: Colors.purple[900]),
                                  //hintText: '1234567890',
                                  hintStyle: TextStyle(color: Colors.grey[600]),
                                  border: OutlineInputBorder(),
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 10),
                        TextField(
                          obscureText: true,
                          decoration: InputDecoration(
                            // filled: true,
                            fillColor: Colors.white,
                            labelText: 'Password',
                            hintText: 'At least 8 characters',
                            labelStyle: TextStyle(color: Colors.purple[900]),
                            border: OutlineInputBorder(),
                          ),
                        ),
                        SizedBox(height: 10),
                        TextField(
                          obscureText: true,
                          decoration: InputDecoration(
                            // filled: true,
                            fillColor: Colors.white,
                            labelText: 'Re-type Password',
                            hintText: 'At least 8 characters',
                            labelStyle: TextStyle(color: Colors.purple[900]),
                            border: OutlineInputBorder(),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      iconColor: Colors.black,
                      padding:
                          EdgeInsets.symmetric(horizontal: 100, vertical: 15),
                    ),
                    child: Text('Sign Up'),
                  ),
                  SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      // ElevatedButton.icon(
                      //   onPressed: () {},
                      //   icon: Icon(Icons.email),
                      //   label: Text("Google"),
                      //   style: ElevatedButton.styleFrom(iconColor: Colors.black),
                      // ),
                      kIsWeb
                          ? OutlinedButton.icon(
                              onPressed: () {
                                // Handle Web sign-in (e.g., use Google sign-in or other provider)
                              },
                              icon: Icon(Icons.login),
                              label: Text("Sign in"),
                              style: OutlinedButton.styleFrom(
                                padding: EdgeInsets.symmetric(vertical: 15),
                                backgroundColor: Colors.grey[100],
                              ),
                            )
                          : Platform.isIOS
                              ? OutlinedButton.icon(
                                  onPressed: () {
                                    // Handle Apple sign-in
                                  },
                                  icon: Icon(
                                      CupertinoIcons.person_crop_circle_fill),
                                  label: Text("Sign in with Apple"),
                                  style: OutlinedButton.styleFrom(
                                    padding: EdgeInsets.symmetric(vertical: 15),
                                    backgroundColor: Colors.black,
                                    foregroundColor: Colors.white,
                                  ),
                                )
                              : OutlinedButton.icon(
                                  onPressed: () {
                                    // Handle Google sign-in
                                  },
                                  icon: Icon(Icons.email),
                                  label: Text("Sign in with Google"),
                                  style: OutlinedButton.styleFrom(
                                    padding: EdgeInsets.symmetric(vertical: 15),
                                    backgroundColor: Colors.grey[100],
                                  ),
                                ),
                      SizedBox(width: 10),
                      ElevatedButton.icon(
                        onPressed: () {},
                        icon: Icon(Icons.facebook),
                        label: Text("Facebook"),
                        style:
                            ElevatedButton.styleFrom(iconColor: Colors.black),
                      ),
                    ],
                  ),
                  SizedBox(height: 60),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Have an account? ",
                        style: TextStyle(color: Colors.white),
                      ),
                      GestureDetector(
                        onTap: () {
                          // Navigate to sign-in page
                        },
                        child: Text(
                          "Sign In",
                          style: TextStyle(
                            color: Colors.blue[50],
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

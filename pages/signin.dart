// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'dart:ui';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'dart:io' show Platform;
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class signin extends StatefulWidget {
  @override
  _signinState createState() => _signinState();
}

class _signinState extends State<signin> {
  // Define controllers to manage the input for email and password fields
  // final TextEditingController _emailController = TextEditingController();
  // final TextEditingController _passwordController = TextEditingController();

  @override
  // void dispose() {
  //   // Dispose controllers to free up resources
  //   _emailController.dispose();
  //   _passwordController.dispose();
  //   super.dispose();
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        alignment: Alignment.center,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: NetworkImage(
              'https://plus.unsplash.com/premium_photo-1669731124026-84b3f596d72a?q=80&w=1170&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
            ),
            fit: BoxFit.cover,
          ),
        ),
        child: Padding(
          padding: EdgeInsets.all(32.0),
          child: Center(
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  BackdropFilter(
                    filter: ImageFilter.blur(sigmaX: 7.0, sigmaY: 7.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Welcome Back 👋",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 28,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 10),
                        Text(
                          "Lorem Ipsum is simply dummy text of the\nprinting and typesetting industry.",
                          style: TextStyle(fontSize: 16, color: Colors.black),
                        ),
                        SizedBox(height: 30),
                        Container(
                          decoration: BoxDecoration(
                            color: Colors.white.withAlpha(50),
                            borderRadius: BorderRadius.circular(8.0),
                            border: Border.all(color: Colors.grey),
                          ),
                          padding: EdgeInsets.all(16.0),
                          child: Column(
                            children: [
                              TextField(
                                // controller: _emailController,
                                decoration: InputDecoration(
                                  labelText: "Email",
                                  hintText: "example@gmail.com",
                                  border: OutlineInputBorder(),
                                ),
                              ),
                              SizedBox(height: 15),
                              TextField(
                                // controller: _passwordController,
                                obscureText: true,
                                decoration: InputDecoration(
                                  labelText: "Password",
                                  hintText: "At least 8 characters",
                                  border: OutlineInputBorder(),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 10),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: GestureDetector(
                      onTap: () {
                        // Handle forgot password action
                      },
                      child: Text(
                        "Forgot password?",
                        style: TextStyle(
                          color: Colors.black87,
                          fontWeight: FontWeight.w900,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 20),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {
                        // Handle sign-in action
                        setState(() {
                          Navigator.pushNamed(
                          context,
                          './homepage',
                          arguments: {
                            'isLoggedIn': true,
                            'username': 'Sazzad'
                          },
                        );
                        });
                      },
                      style: ElevatedButton.styleFrom(
                        padding: EdgeInsets.symmetric(vertical: 15),
                        backgroundColor: Colors.black,
                      ),
                      child: Text(
                        "Sign in",
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                  SizedBox(height: 15),
                  Row(
                    children: [
                      Expanded(
                        child: Divider(
                          thickness: 1,
                          color: Colors.grey[400],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 10.0),
                        child: Text("Or"),
                      ),
                      Expanded(
                        child: Divider(
                          thickness: 1,
                          color: Colors.grey[400],
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 15),
                  SizedBox(
                    width: double.infinity,
                    child: kIsWeb
                        ? OutlinedButton.icon(
                            onPressed: () {
                              // Handle Web sign-in
                            },
                            icon: Icon(Icons.login),
                            label: Text("Sign in Web"),
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
                  ),
                  SizedBox(height: 10),
                  SizedBox(
                    width: double.infinity,
                    child: OutlinedButton.icon(
                      onPressed: () {
                        // Handle Facebook sign-in
                      },
                      icon: Icon(Icons.facebook),
                      label: Text("Sign in with Facebook"),
                      style: OutlinedButton.styleFrom(
                        padding: EdgeInsets.symmetric(vertical: 15),
                        backgroundColor: Colors.grey[100],
                      ),
                    ),
                  ),
                  SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Don’t have an account? ",
                        style: TextStyle(color: Colors.amber),
                      ),
                      GestureDetector(
                        onTap: () {
                          // Handle sign-up navigation
                        },
                        child: Text(
                          "Sign Up",
                          style: TextStyle(
                            color: Colors.blue,
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

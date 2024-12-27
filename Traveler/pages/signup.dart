// ignore_for_file: prefer_const_constructors

import 'dart:ui';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'dart:io' show Platform;
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class signup extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [ 
          Positioned.fill(
            child: Image.network(
              'https://images.unsplash.com/photo-1500375592092-40eb2168fd21?q=80&w=988&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
              fit: BoxFit.cover,
            ),
          ),
          Positioned.fill(
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 7.0, sigmaY: 7.0),
              child: Container(
                color: Colors.white.withAlpha(50),
              ),
            ),
          ),
          // Fixed "Hello" text and welcome message
          Positioned(
            left: Get.width * 0.4,
            top: 80, // Set to 40 or any value based on your design
            child: Text(
              'Hello 👋',
              style: TextStyle(
                  fontSize: 28, fontWeight: FontWeight.bold, color: Colors.black),
            ),
          ),
          Positioned(
            left: Get.width * 0.25,
            top: 120, // Slightly below the "Hello" text
            child: Text(
              'Welcome to the signup page',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 16, color: Colors.black,
              ),
            ),
          ),
          // Scrollable form content
          Positioned.fill(
            top: Get.height * 0.2, // Start the form below the static header
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    // Form content here
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
                                    border: OutlineInputBorder(),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 10),
                          TextField(
                            decoration: InputDecoration(
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
                                    labelText: 'Phone',
                                    prefix: Text("+880"),
                                    labelStyle:
                                        TextStyle(color: Colors.purple[900]),
                                    hintStyle: TextStyle(color: Colors.grey[600]),
                                    border: OutlineInputBorder(),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 10),
                          TextField(
                            obscureText: false,
                            decoration: InputDecoration(
                              labelText: 'Password',
                              hintText: 'At least 8 characters',
                              labelStyle: TextStyle(color: Colors.purple[900]),
                              border: OutlineInputBorder(),
                            ),
                          ),
                          SizedBox(height: 10),
                          TextField(
                            obscureText: false,
                            decoration: InputDecoration(
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
                        kIsWeb
                            ? OutlinedButton.icon(
                                onPressed: () {},
                                icon: Icon(Icons.login),
                                label: Text("Sign in"),
                                style: OutlinedButton.styleFrom(
                                  padding: EdgeInsets.symmetric(vertical: 15),
                                  backgroundColor: Colors.grey[100],
                                ),
                              )
                            : Platform.isIOS
                                ? OutlinedButton.icon(
                                    onPressed: () {},
                                    icon: Icon(
                                        CupertinoIcons.person_crop_circle_fill),
                                    label: Text("Sign in with Apple"),
                                    style: OutlinedButton.styleFrom(
                                      padding: EdgeInsets.symmetric(vertical: 15),
                                      backgroundColor: Colors.black,
                                      foregroundColor: Colors.white,
                                    ),
                                  )
                                : ElevatedButton.icon(
                                    onPressed: () {},
                                    icon: Icon(Icons.email),
                                    label: Text("Google"),
                                    style: OutlinedButton.styleFrom(
                                      padding: EdgeInsets.symmetric(vertical: 8,horizontal: 18),
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
                          onTap: () {},
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
        ],
      ),
    );
  }
}

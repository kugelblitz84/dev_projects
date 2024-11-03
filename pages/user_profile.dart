// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';

class user_profile extends StatelessWidget {
  const user_profile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text(
            "Logo",
            style: TextStyle(
              color: Colors.blue,
              fontWeight: FontWeight.w900,
            ),
          ),
          actions: <Widget>[
            ElevatedButton(
              onPressed: () {
                // Add Blog action
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.white,
                padding: EdgeInsets.symmetric(horizontal: 20),
              ),
              child: Text("Add Blog"),
            ),
            SizedBox(width: 10),
            ElevatedButton(
              onPressed: () {
                // Add Blog action
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.white,
                padding: EdgeInsets.symmetric(horizontal: 20),
              ),
              child: Text("Edit Profile"),
            ),
            SizedBox(width: 10),
            // ElevatedButton.icon(
            //   onPressed: () {
            //     // Navigate to user profile
            //     Navigator.pushNamed(context, './user_profile');
            //   },
            //   icon: const Icon(Icons.face),
            //   label: const Text('Sazzad'),
            //   style: ElevatedButton.styleFrom(
            //     padding:
            //         const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
            //     textStyle: const TextStyle(fontSize: 16, color: Colors.black),
            //   ),
            // ),
            ElevatedButton(              
              style: ElevatedButton.styleFrom(
                padding: EdgeInsets.symmetric(vertical: 12, horizontal: 20),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                elevation: 0,
              ),
              onPressed: () {
                // Add your onPressed functionality here
              },
              
              child: Row(
                children: [
                  // Profile Image
                  CircleAvatar(
                    radius: 18,
                    backgroundImage: AssetImage(
                        'assets/profile_image.png'), // Replace with your image asset
                  ),
                  SizedBox(width: 10),
                  // Text
                  Text(
                    'Sazzad',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // Profile Header
              Container(
                padding: EdgeInsets.all(20),
                child: Column(
                  children: [
                    CircleAvatar(
                      radius: 40,
                      backgroundColor: Colors.grey[300],
                      child: Icon(Icons.person, size: 50, color: Colors.white),
                    ),
                    SizedBox(height: 10),
                    Text(
                      "Sazzad",
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      "@sazzad123",
                      style: TextStyle(fontSize: 16, color: Colors.grey),
                    ),
                    SizedBox(height: 10),
                  ],
                ),
              ),

              // Blog Section
              Padding(
                padding: EdgeInsets.symmetric(vertical: 20),
                child: Text(
                  "My Blogs",
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    _buildBlogCard(
                      title: "How to visit Sajek valley in Rangamati",
                      location: "Rangamati",
                      imageUrl:
                          'https://images.unsplash.com/photo-1539967430815-b3d193609067?q=80&w=988&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D', // Replace with real image URL
                    ),
                    _buildBlogCard(
                      title: "7 Tips For Visiting Tanguar Haor",
                      location: "Sunamganj",
                      imageUrl:
                          'https://images.unsplash.com/photo-1539967430815-b3d193609067?q=80&w=988&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D', // Replace with real image URL
                    ),
                    _buildBlogCard(
                      title: "Kuakata Travel Guide",
                      location: "Patuakhali",
                      imageUrl:
                          'https://images.unsplash.com/photo-1539967430815-b3d193609067?q=80&w=988&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D', // Replace with real image URL
                    ),
                  ],
                ),
              ),

              // Footer Section
            ],
          ),
        ));
  }
}

Widget _buildBlogCard(
    {required String title,
    required String location,
    required String imageUrl}) {
  return Expanded(
    child: Container(
      margin: EdgeInsets.symmetric(horizontal: 5),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 150,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              image: DecorationImage(
                image: NetworkImage(imageUrl),
                fit: BoxFit.cover,
              ),
            ),
          ),
          SizedBox(height: 8),
          Text(
            location,
            style: TextStyle(color: Colors.red, fontWeight: FontWeight.bold),
          ),
          Text(
            title,
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
          ),
        ],
      ),
    ),
  );
}

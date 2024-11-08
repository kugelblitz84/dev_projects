// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:get/get.dart';

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
          SizedBox(width: 10),
          GestureDetector(
            onTap: () {
              // Add Blog action
            },
            child: Text(
              "Edit Profile",
              style: TextStyle(color: Colors.purple[900]),
            ),
          ),
          SizedBox(width: 10),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              padding: EdgeInsets.symmetric(vertical: 12, horizontal: 10),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              elevation: 5,
            ),
            onPressed: () {
              // Add onPressed functionality here
            },
            child: const Row(
              children: [
                CircleAvatar(
                  radius: 18,
                  backgroundImage: AssetImage(
                      'assets/profile_image.png'), // Replace with your image asset
                ),
                SizedBox(width: 5),
                Text(
                  'Sazzad',
                  style: TextStyle(
                    fontSize: 14,
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
            // Cover Photo and Profile Pic
            Stack(
              children: [
                // Cover Photo
                Container(
                  height: Get.height * 0.3,
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: NetworkImage(
                          'https://images.unsplash.com/photo-1539967430815-b3d193609067?q=80&w=988&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D'), // Replace with your cover photo URL
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                // Profile Info Overlay
                Positioned(
                  bottom: 20,
                  left: 20,
                  right: 20,
                  child: Column(
                    children: [
                      CircleAvatar(
                        radius: 40,
                        backgroundColor: Colors.grey[300],
                        child:
                            Icon(Icons.person, size: 50, color: Colors.white),
                      ),
                      SizedBox(height: 10),
                      Text(
                        "Sazzad",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                      Text(
                        "@sazzad123",
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.grey[200],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),

            // Blog Section
            Padding(
              padding: EdgeInsets.symmetric(vertical: 20, horizontal: 10),
              child: Row(
                children: [
                  SizedBox(width: 15),
                  Text(
                    "My Blogs",
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                  Spacer(),
                  ElevatedButton(
                    onPressed: () {
                      // Add Blog action
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.orange[900],
                      foregroundColor: Colors.white,
                      padding: EdgeInsets.symmetric(horizontal: 20),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5.0),
                      ),
                    ),
                    child: Text("Add Blog"),
                  ),
                  SizedBox(width: 15)
                ],
              ),
            ),

            // Blog Cards
            Padding(
              padding: EdgeInsets.all(10),
              child: Wrap(
                alignment: WrapAlignment.start,
                runSpacing: 1,
                children: [
                  AnimatedBlogCard(
                    title: "How to visit Sajek valley in Rangamati",
                    location: "Rangamati",
                    imageUrl:
                        'https://images.unsplash.com/photo-1539967430815-b3d193609067?q=80&w=988&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D', // Replace with real image URL
                  ),
                  AnimatedBlogCard(
                    title: "7 Tips For Visiting Tanguar Haor",
                    location: "Sunamganj",
                    imageUrl:
                        'https://images.unsplash.com/photo-1539967430815-b3d193609067?q=80&w=988&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D', // Replace with real image URL
                  ),
                  AnimatedBlogCard(
                    title: "Kuakata Travel Guide",
                    location: "Patuakhali",
                    imageUrl:
                        'https://images.unsplash.com/photo-1539967430815-b3d193609067?q=80&w=988&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D', // Replace with real image URL
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class AnimatedBlogCard extends StatefulWidget {
  final String title;
  final String location;
  final String imageUrl;

  const AnimatedBlogCard({
    Key? key,
    required this.title,
    required this.location,
    required this.imageUrl,
  }) : super(key: key);

  @override
  _AnimatedBlogCardState createState() => _AnimatedBlogCardState();
}

class _AnimatedBlogCardState extends State<AnimatedBlogCard> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: Duration(seconds: 8),
      vsync: this,
    );

    // Define the animation with a delay at the beginning
    _animation = Tween<double>(begin: 0, end: -1).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Interval(0.2, 1.0, curve: Curves.linear), // 20% delay
      ),
    );

    // Start the animation after a delay of 1 second
    Future.delayed(Duration(seconds: 1), () {
      _controller.repeat(); // Loop the animation
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: Get.width * 0.4,
      margin: EdgeInsets.symmetric(horizontal: 5),
      child: Wrap(
        spacing: 8.0,
        runSpacing: 8.0,
        runAlignment: WrapAlignment.spaceEvenly,
        //crossAxisAlignment: CrossAxisAlignment.start,
        //mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            height: 120,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              image: DecorationImage(
                image: NetworkImage(widget.imageUrl),
                fit: BoxFit.cover,
              ),
            ),
            child: Stack(
              children: [
                Positioned(
                  left: 5,
                  bottom: 25,
                  child: Text(
                    widget.location,
                    style: TextStyle(color: Colors.cyan, fontWeight: FontWeight.bold),
                  ),
                ),
                AnimatedBuilder(
                  animation: _animation,
                  builder: (context, child) {
                    // Translate the position of the text based on the animation value
                    return Positioned(
                      left: (_animation.value * Get.width * 0.28 )+ 5,
                      bottom: 5,
                      //left: 5,
                      child: child!,
                    );
                  },
                  child: Text(
                    widget.title,
                    style: TextStyle(color: Colors.white, fontSize: 13, fontWeight: FontWeight.w500),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

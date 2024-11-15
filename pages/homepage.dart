// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:first_project/pages/signin.dart';
import 'package:first_project/pages/signup.dart';
import 'package:first_project/pages/user_profile.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'dart:math';

int toggle = 0;
String searched = "";
late bool _isLoggedIn ;
var _username;

class homepage extends StatefulWidget {
  bool isLoggedIn;
  String username;

  homepage({super.key,required this.isLoggedIn,required this.username});

  @override
  State<homepage> createState() => _homepageState();
}

class _homepageState extends State<homepage> {

  // bool get isLoggedIn => _isLoggedIn;
  // String get username => _username;
  @override
void initState() {
    super.initState();
    _isLoggedIn = widget.isLoggedIn;
    _username = widget.username;
}
 
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        backgroundColor: Colors.purple[50],
        child: Column(
          children: [           
            DrawerHeader(child: Icon(Icons.favorite)),
            AnimatedSearch(),
            ListTile(
              leading: Icon(Icons.camera),
              title: Text("V L O G S"),
              onTap: () {
                // Navigate to the Vlogs page
              },
            ),
            ListTile(
              leading: Icon(Icons.map),
              title: Text("D E S T I N A T I O N S"),
              onTap: () {
                // Navigate to destinations page
              },
            ),
            if (_isLoggedIn)
              ListTile(
                leading: Icon(Icons.logout),
                title: Text("Log Out"),
                onTap: () {
                  setState(() {
                    _isLoggedIn = false;
                    _username = '';
                  })
                  ;Get.back();
                  // Handle log out (You may need to use some state management here)
                },
              )
          ],
        ),
      ),
      onDrawerChanged: (isOpen) {
        if (!isOpen) {
          setState(() {
            toggle = 0; 
            searched = "";
          });
        }
      },
      appBar: AppBar(
        title: Text(
          "Logo",
          style: TextStyle(
            color: Colors.blue,
            fontWeight: FontWeight.w900,
          ),
        ),
        actions: <Widget>[
          if (!_isLoggedIn)
            SizedBox(
              height: 40,
              width: 90,
              child: FloatingActionButton(
                hoverElevation: 5,
                backgroundColor: Colors.white,
                onPressed: () {
                  //Navigator.pushNamed(context, './signup');
                  Get.to(signup());
                },
                elevation: 0,
                child: Text('Sign Up'),
              ),
            ),
            SizedBox(width: 5,),
          if (!_isLoggedIn)
            SizedBox(
              height: 40,
              width: 90,
              child: FloatingActionButton(
                hoverElevation: 5,
                backgroundColor: Colors.white,
                onPressed: () {
                  Get.to(signin());
                },
                elevation: 0,
                child: Text('Sign In'),
              ),
            )
          else
            ElevatedButton(
            style: ElevatedButton.styleFrom(
              padding: EdgeInsets.symmetric(vertical: 12, horizontal: 10),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              elevation: 5,
            ),
            onPressed: () {
              Get.to(user_profile());
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
          ),
          // IconButton(
          //   onPressed: () {

          //     // Search functionality (currently empty)
          //   },
          //   icon: Icon(Icons.search),
          // ),
          SizedBox(width: 5),
          
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Header Section
            Stack(
              children: [
                Image.network(
                  'https://images.unsplash.com/photo-1539967430815-b3d193609067?q=80&w=988&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
                  height: 150,
                  fit: BoxFit.cover,
                  width: double.infinity,
                ),
                Positioned(
                  top: 50,
                  left: 20,
                  child: Text(
                    'Exploring Made Easy',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
            // Category Section
            Padding(
              padding: EdgeInsets.all(16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  CategoryTile(
                    title: 'Challenging',
                    imageUrl:
                        'https://images.unsplash.com/photo-1539967430815-b3d193609067?q=80&w=988&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
                  ),
                  CategoryTile(
                    title: 'Secluded',
                    imageUrl:
                        'https://images.unsplash.com/photo-1539967430815-b3d193609067?q=80&w=988&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
                  ),
                  CategoryTile(
                    title: 'Uncharted',
                    imageUrl:
                        'https://images.unsplash.com/photo-1539967430815-b3d193609067?q=80&w=988&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
                  ),
                  CategoryTile(
                    title: 'Quaint',
                    imageUrl:
                        'https://images.unsplash.com/photo-1539967430815-b3d193609067?q=80&w=988&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
                  ),
                ],
              ),
            ),
            
            // Destinations and Travel Blog Sections
            Container(
              height: 150,
              width: 200,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage(
                      'https://images.unsplash.com/photo-1539967430815-b3d193609067?q=80&w=988&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D'),
                  fit: BoxFit.cover,
                ),
              ),
              child: Center(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 5, vertical: 10),
                  child: Text(
                    '"If you never go, you will never know."',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 18,
                      fontStyle: FontStyle.italic,
                      color: Colors.white,
                      shadows: [
                        Shadow(
                          offset: Offset(1, 1),
                          blurRadius: 4,
                          color: Colors.black,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(height: 10,),
            Footer(),
          ],
        ),
      ),
    );
  }
}

class CategoryTile extends StatelessWidget {
  final String title;
  final String imageUrl;

  const CategoryTile({required this.title, required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child:
              Image.network(imageUrl, width: 80, height: 80, fit: BoxFit.cover),
        ),
        SizedBox(height: 5),
        Text(title, style: TextStyle(fontSize: 14)),
      ],
    );
  }
}

class Footer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black,
      padding: EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Logo',
            style: TextStyle(
                color: Colors.white, fontSize: 24, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              FooterColumn(
                  title: 'Explore', items: ['Destinations', 'Blog', 'Gallery']),
              FooterColumn(
                  title: 'Connect',
                  items: ['Facebook', 'Instagram', 'Twitter']),
              FooterColumn(
                  title: 'Support',
                  items: ['Contact Us', 'Help', 'Privacy Policy']),
            ],
          ),
          SizedBox(height: 10),
          Text(
            '© 2024 Travel App. All rights reserved.',
            style: TextStyle(color: Colors.grey[400]),
          ),
        ],
      ),
    );
  }
}

class FooterColumn extends StatelessWidget {
  final String title;
  final List<String> items;

  const FooterColumn({required this.title, required this.items});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        ...items.map((item) => Padding(
              padding: const EdgeInsets.symmetric(vertical: 4),
              child: Text(item, style: TextStyle(color: Colors.grey[400])),
            )),
      ],
    );
  }
}

class AnimatedSearch extends StatefulWidget {
  const AnimatedSearch({super.key});
  @override
  _AnimatedSearchState createState() => _AnimatedSearchState();
}


class _AnimatedSearchState extends State<AnimatedSearch> with SingleTickerProviderStateMixin {
  late AnimationController _con;
  late TextEditingController _textEditingController;

  @override
  void initState() {
    super.initState();
    _textEditingController = TextEditingController();
    _con = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 375),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        color: Colors.purple[50],
        child: Center(
          child: Container(
            height: 100.0,
            width: 250.0,
            alignment: Alignment(-1.0, 0.0),
            child: AnimatedContainer(
              duration: Duration(milliseconds: 375),
              height: 40.0,
              width: (toggle == 0) ? 48.0 : 250.0,
              curve: Curves.easeOut,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(30.0),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black26,
                    spreadRadius: -10.0,
                    blurRadius: 10.0,
                    offset: Offset(0.0, 10.0),
                  ),
                ],
              ),
              child: Stack(
                children: [
                  AnimatedPositioned(
                    duration: Duration(milliseconds: 375),
                    top: 6.0,
                    right: 7.0,
                    curve: Curves.easeOut,
                    child: AnimatedOpacity(
                      opacity: (toggle == 0) ? 0.0 : 1.0,
                      duration: Duration(milliseconds: 200),
                      child: Container(
                        padding: EdgeInsets.all(8.0),
                        decoration: BoxDecoration(
                          color: Color(0xffF2F3F7),
                          borderRadius: BorderRadius.circular(30.0),
                        ),
                        child: AnimatedBuilder(
                          child: Icon(
                            Icons.mic,
                            size: 20.0,
                          ),
                          builder: (context, widget) {
                            return Transform.rotate(
                              angle: _con.value * 2.0 * pi,
                              child: widget,
                            );
                          },
                          animation: _con,
                        ),
                      ),
                    ),
                  ),
                  AnimatedPositioned(
                    duration: Duration(milliseconds: 375),
                    left: (toggle == 0) ? 20.0 : 40.0,
                    curve: Curves.easeOut,
                    top: 4.0,
                    child: AnimatedOpacity(
                      opacity: (toggle == 0) ? 0.0 : 1.0,
                      duration: Duration(milliseconds: 200),
                      child: Container(
                        height: 23.0,
                        width: 180.0,
                        child: TextField(
                          controller: _textEditingController,
                          cursorRadius: Radius.circular(10.0),
                          cursorWidth: 2.0,
                          cursorColor: Colors.black,
                          decoration: InputDecoration(
                            floatingLabelBehavior: FloatingLabelBehavior.never,
                            labelText: 'Search...',
                            labelStyle: TextStyle(
                              color: Color(0xff5B5B5B),
                              fontSize: 17.0,
                              fontWeight: FontWeight.w500,
                            ),
                            alignLabelWithHint: true,
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20.0),
                              borderSide: BorderSide.none,
                            ),
                          ),
                          onChanged: (value) {
                            setState(() {
                              searched = value;
                              //print(searched);
                            });
                          },
                        ),
                      ),
                    ),
                  ),
                  Material(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(30.0),
                    child: IconButton(
                      splashRadius: 19.0,
                      icon: Icon(
                        Icons.search,
                        size: 23.0,
                      ),
                      onPressed: () {
                        setState(
                          () {
                            if (toggle == 0) {
                              toggle = 1;
                              _con.forward();
                            } else {
                              toggle = 0;
                              _textEditingController.clear();
                              searched = "";
                              _con.reverse();
                            }
                          },
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      );
   
  }
}

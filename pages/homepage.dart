// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, dead_code, non_constant_identifier_names, prefer_const_declarations, sort_child_properties_last
//import 'dart:ffi';

import 'package:first_project/pages/signin.dart';
import 'package:first_project/pages/signup.dart';
import 'package:first_project/pages/user_profile.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'dart:math';

class homepage extends StatefulWidget {
  final bool isLoggedIn;
  final String username;

  homepage({super.key, required this.isLoggedIn, required this.username});

  @override
  State<homepage> createState() => _homepageState();
}

class _homepageState extends State<homepage> {
  int drawer_toggle = 0;
  late bool _isLoggedIn;
  late String _username;
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
                    Get.back();
                  });

                  // Handle log out (You may need to use some state management here)
                },
              )
          ],
        ),
      ),
      onDrawerChanged: (isOpen) {
        if (!isOpen) {
          setState(() {
            drawer_toggle = 0;
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
          AnimatedSearch(),
          SizedBox(width: 5,),
          if (!_isLoggedIn)
            SizedBox(
              height: 30,
              width: 70,
              child: FloatingActionButton(
                hoverElevation: 5,
                backgroundColor: Colors.white,
                onPressed: () {
                  //Navigator.pushNamed(context, './signup');
                  Get.to(signup());
                },
                elevation: 0,
                child: Text('Sign Up', style: TextStyle(fontSize: 12)),
              ),
            ),
          SizedBox(
            width: 5,
          ),
          if (!_isLoggedIn)
            SizedBox(
              height: 30,
              width: 70,
              child: FloatingActionButton(
                hoverElevation: 5,
                backgroundColor: Colors.white,
                onPressed: () {
                  setState(() {
                    Get.to(signin());
                  });
                },
                elevation: 0,
                child: Text('Sign In', style: TextStyle(fontSize: 12)),
              ),
            )
          else
            Container(
              height: 45,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.symmetric(vertical: 8, horizontal: 10),
                  shape: RoundedRectangleBorder(
                    
                    borderRadius: BorderRadius.circular(10),
                  ),
                  elevation: 5,
                ),
                onPressed: () {
                  Get.to(user_profile());
                  // Add onPressed functionality here
                },
                child: Row(
                  children: [
                    CircleAvatar(
                      radius: 18,
                      backgroundImage: AssetImage(
                          'assets/profile_image.png'), // Replace with your image asset
                    ),
                    SizedBox(width: 5),
                    Text(
                     _username, 
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
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
            //SizedBox(height: 10),
            // Header Section
            Stack(
              children: [
                Image.network(
                  'https://images.unsplash.com/photo-1539967430815-b3d193609067?q=80&w=988&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
                  height: Get.height * 0.2,
                  fit: BoxFit.cover,
                  width: double.infinity,
                ),
                Positioned(
                  top: 50,
                  left: 10,
                  child: Text(
                    'Exploring Made Easy...',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
            // Category Section
            Padding(
              padding: EdgeInsets.all(15.0),
              child: Wrap(
                alignment: WrapAlignment.spaceAround,
                runSpacing: 1,
                //mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  CategoryTile(
                    title: 'Sajek',
                    imageUrl:
                        'https://images.unsplash.com/photo-1539967430815-b3d193609067?q=80&w=988&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
                  ),
                  CategoryTile(
                    title: 'Cox\'s Bazar',
                    imageUrl:
                        'https://images.unsplash.com/photo-1539967430815-b3d193609067?q=80&w=988&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
                  ),
                  CategoryTile(
                    title: 'Tanguar Haor',
                    imageUrl:
                        'https://images.unsplash.com/photo-1539967430815-b3d193609067?q=80&w=988&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
                  ),
                  CategoryTile(
                    title: 'Sundar Ban',
                    imageUrl:
                        'https://images.unsplash.com/photo-1539967430815-b3d193609067?q=80&w=988&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
                  ),
                ],
              ),
            ),

            SizedBox(height: 10),
            Center(
              child: Material(
                elevation: 4,
                borderRadius: BorderRadius.circular(30),
                child: SizedBox(
                  height: 30,
                  width: Get.width * 0.7,
                  child: Row(
                    children: [
                      Expanded(
                          child: InkWell(
                              onTap: () {},
                              borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(30),
                                  bottomLeft: Radius.circular(30)),
                              child: Center(
                                child: Row(
                                  children: [
                                    Spacer(),
                                    Icon(
                                      Icons.map,
                                      size: 12,
                                    ),
                                    Text(
                                      " Where To?",
                                      style: TextStyle(
                                          color: Colors.black, fontSize: 12),
                                    ),
                                    Spacer(),
                                  ],
                                ),
                              ))),

                      //VerticalDivider(thickness: 0.1, color: Colors.grey[800],),
                      Expanded(
                          child: InkWell(
                        onTap: () {},
                        borderRadius: BorderRadius.only(
                            topRight: Radius.circular(30),
                            bottomRight: Radius.circular(30)),
                        child: Center(
                          child: Row(
                            children: [
                              Spacer(),
                              Icon(Icons.calendar_month, size: 12),
                              Text(
                                ' When?',
                                style: TextStyle(
                                    color: Colors.black, fontSize: 12),
                              ),
                              Spacer()
                            ],
                          ),
                        ),
                      ))
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(height: 50),
            Row(
              //crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(width: 10),
                Text(
                  "Trending Tour Packages",
                  style: TextStyle(
                      fontFamily: 'Arial',
                      fontWeight: FontWeight.bold,
                      fontSize: 15),
                ),
                Spacer(),
                Container(
                  height: 22, // Set the height of the container
                  width: 70, // Set the width of the container
                  decoration: BoxDecoration(
                      //color: Colors.black,
                      borderRadius: BorderRadius.circular(5),
                      border: Border.all(color: Colors.black, width: 1.0)),
                  child: InkWell(
                    onTap: () {}, //Go To the Trending page.
                    borderRadius: BorderRadius.circular(5),
                    child: Center(
                      child: Text(
                        'See More...',
                        style: TextStyle(color: Colors.black, fontSize: 10),
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ),
                ),
                SizedBox(width: 10),
              ],
            ),
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(
                  width: 10,
                ),
                CategoryTile(
                  title: 'Sajek',
                  imageUrl:
                      'https://images.unsplash.com/photo-1539967430815-b3d193609067?q=80&w=988&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
                ),
                SizedBox(
                  width: 10,
                ),
                CategoryTile(
                  title: 'Cox\'s Bazar',
                  imageUrl:
                      'https://images.unsplash.com/photo-1539967430815-b3d193609067?q=80&w=988&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
                ),
                SizedBox(
                  width: 10,
                ),
                CategoryTile(
                  title: 'Tanguar Haor',
                  imageUrl:
                      'https://images.unsplash.com/photo-1539967430815-b3d193609067?q=80&w=988&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
                ),
              ],
            ),
            SizedBox(height: 20),
            Center(
              child: Container(
                height: 40,
                width: Get.width * 0.95,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
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
                        fontSize: 15,
                        //fontStyle: FontStyle.italic,
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
            ),
            SizedBox(
              height: 50,
            ),
            Row(
              //crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(width: 10),
                Text(
                  "Hire Guides",
                  style: TextStyle(
                      fontFamily: 'Arial',
                      fontWeight: FontWeight.bold,
                      fontSize: 15),
                ),
                Spacer(),
                Container(
                  height: 22, 
                  width: 70, 
                  decoration: BoxDecoration(
                      //color: Colors.black,
                      borderRadius: BorderRadius.circular(5),
                      border: Border.all(color: Colors.black, width: 1.0)),
                  child: InkWell(
                    onTap: () {}, //Go To the Trending page.
                    borderRadius: BorderRadius.circular(5),
                    child: Center(
                      child: Text(
                        'See More...',
                        style: TextStyle(color: Colors.black, fontSize: 10),
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ),
                ),
                SizedBox(width: 10),
              ],
            ),
            SizedBox(
              height: 10,
            ),
            SizedBox(
              height: 200,
              width: double.infinity, 
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                physics: PageScrollPhysics(),
                 controller: PageController(viewportFraction: 0.51), 
                itemCount: 8, 
                itemBuilder: (context,iter){
                  return GuideTiles();
                },
              ),
            ),

            SizedBox(height: 10),
            // Destinations and Travel Blog Sections
            Center(
              child: Container(
                height: 40,
                width: Get.width * 0.95,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
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
                      '"Travelling is a way of self healing"',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 15,
                        //fontStyle: FontStyle.italic,
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
            ),
            SizedBox(
              height: 50,
            ),
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
        Stack(children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Image.network(imageUrl,
                width: 90, height: 70, fit: BoxFit.cover),
          ),
          Positioned(
              bottom: 7,
              left: 3,
              child: Text(title,
                  style: TextStyle(fontSize: 11, color: Colors.white))),
        ])
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

class _AnimatedSearchState extends State<AnimatedSearch>
    with SingleTickerProviderStateMixin {
  late AnimationController _con;
  late TextEditingController _textEditingController;
  int toggle = 0;
  late String searched;
  //late FocusNode _searchFocusNode;

  @override
  void initState() {
    super.initState();
    _textEditingController = TextEditingController();
    //_searchFocusNode = FocusNode();
    _con = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 375),
    );
  }
  // void dispose() {
  //   //_searchFocusNode.dispose();
  //   _con.dispose();
  //   _textEditingController.dispose();
  //   super.dispose();
  // }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color.fromARGB(0, 252, 252, 252),
      child: Center(
        child: Container(
          height: 100.0,
          width: 200.0,
          alignment: Alignment(1.0, 0.0),
          child: AnimatedContainer(
            duration: Duration(milliseconds: 375),
            height: 40.0,
            width: (toggle == 0) ? 48 : 200.0,
            curve: Curves.easeOut,
            decoration: BoxDecoration(
              color: const Color.fromARGB(255, 255, 255, 255),
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
                  top: 2.0,
                  left: 4, // Move mic icon to the left when expanded
                  curve: Curves.easeOut,
                  child: AnimatedOpacity(
                    opacity: (toggle == 0) ? 0.0 : 1.0,
                    duration: Duration(milliseconds: 200),
                    child: Container(
                      padding: EdgeInsets.all(8.0),
                      decoration: BoxDecoration(
                        color: Color.fromARGB(255, 255, 255, 255),
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
                          labelText: 'Search..',
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
                Positioned(
                  right: 0,
                  top:0,
                  bottom: 0.3,
                  child: Material(
                    color: const Color.fromARGB(0, 255, 255, 255),
                    borderRadius: BorderRadius.circular(40.0),
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
                              //_searchFocusNode.requestFocus();
                            } else {
                              toggle = 0;
                              _textEditingController.clear();
                              searched = "";
                              _con.reverse();
                             // _searchFocusNode.unfocus();
                             FocusScope.of(context).unfocus();
                              
                            }
                            
                          },
                        );
                      },
                    ),
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

class GuideTiles extends StatefulWidget {
  const GuideTiles({super.key});

  @override
  State<GuideTiles> createState() => _GuideTilesState();
}

class _GuideTilesState extends State<GuideTiles> {
  @override
  Widget build(BuildContext context) {
    final String name = "Hasan Abi";
    final bool Available = true;
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: Container(
                height: 170,
                width: 200,
                decoration: BoxDecoration(
                    //border: Border.all(width: 1),
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    color: const Color.fromARGB(255, 255, 255, 255),
                    boxShadow: [
                      BoxShadow(
                        color: const Color.fromARGB(255, 3, 8, 4).withOpacity(0.2),
                        offset: Offset(4, 4),
                        blurRadius: 5,
                      ),
                      BoxShadow(
                        color: const Color.fromARGB(255, 5, 255, 47)
                            .withOpacity(0.2),
                        offset: Offset(-4, -4),
                        blurRadius: 5,
                      ),
                    ]),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                      child: Container(
                        height: 90,
                        width: 200,
                        child: Image(
                          image: NetworkImage(
                              'https://scontent.fdac134-1.fna.fbcdn.net/v/t39.30808-6/238624692_961561754695378_2765180969677886134_n.jpg?_nc_cat=103&ccb=1-7&_nc_sid=cc71e4&_nc_eui2=AeHEj4r2UF52Yb-ZMXoHb0UnfSjqJmdi0Il9KOomZ2LQiQPuawcLYx1cUGJPTXIXrGPHRPV4gG1cCCZRm9fBXWKU&_nc_ohc=YAF9nbQ3jNYQ7kNvgEPcqyM&_nc_zt=23&_nc_ht=scontent.fdac134-1.fna&_nc_gid=AJfuHUm62yYKVcfypYrJ1nj&oh=00_AYCNNeWxxWRiHnd3mam5GnxkpD6cxIPAd05g-k3o3mxRlA&oe=674B96EC'),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 4,
                    ),
                    Center(
                      child: Text(
                        ' $name',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: const Color.fromARGB(255, 5, 1, 1)),
                      ),
                    ),
                    if (Available)
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          CircleAvatar(
                            radius: 3,
                            backgroundColor:
                                const Color.fromARGB(255, 112, 253, 116),
                          ),
                          Padding(
                              padding: EdgeInsets.all(2.5),
                              child: Text('Available')),
                        ],
                      )
                    else
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          CircleAvatar(
                            radius: 3,
                            backgroundColor: const Color.fromARGB(255, 250, 0, 0),
                          ),
                          Padding(
                              padding: EdgeInsets.all(2.5),
                              child: Text('Offline')),
                        ],
                      ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          ' Guiding areas: ',
                          style: TextStyle(fontSize: 10),
                        ),
                        SizedBox(width: 5),
                        Text(
                          'From Employee DataBase',
                          style: TextStyle(fontSize: 10),
                        ),
                      ],
                    ),
                    SizedBox(height: 5),
                    Row(
                
                      children: [
                        SizedBox(width: 10,),
                        SizedBox(
                          height: 25,
                          width: 75,
                          child: FloatingActionButton(
                            onPressed: (){},
                            backgroundColor: Colors.white,
                            elevation: 4,
                            child: Text('Hire Now',style: TextStyle(fontSize: 12),),
                          ),
                        ),
                        Spacer(),
                        SizedBox(
                          height: 25,
                          width: 75,
                          child: FloatingActionButton(
                            onPressed: (){},
                            backgroundColor: Colors.white,
                            elevation: 4,
                            child: Text('View Profile',style: TextStyle(fontSize: 12),),
                          ),
                          
                        ),
                        SizedBox(width: 10),
                      ],
                    ) 
                  ],
                ),
              ),
    );
  }
}

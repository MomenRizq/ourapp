import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:ourapp/Pages/settings.dart';
import 'package:ourapp/navigationbar_pages/category_page.dart';
import 'package:ourapp/Pages/about_us.dart';

import '../navigationbar_pages/home_page.dart';
import '../navigationbar_pages/profile_page.dart';
import 'about_project.dart';

class HomeOfApp extends StatefulWidget {
  final String? email ;
  const HomeOfApp({super.key,  this.email});

  @override
  State<HomeOfApp> createState() => _HomeOfAppState();
}

class _HomeOfAppState extends State<HomeOfApp> {
  int currentindex = 0;
  final pages = [homePage(), CategoryPage(), profilePage()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 1,
        backgroundColor: Colors.purple,
        actions: [
          IconButton(
            icon: Icon(Icons.settings, color: Colors.white),
            onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (BuildContext context) => SettingsPage()));
            },
          ),
        ],
      ),
      body: IndexedStack(index: currentindex, children: pages),
      bottomNavigationBar: BottomNavigationBar(
          currentIndex: currentindex,
          onTap: (index) => setState(() => currentindex = index),
          backgroundColor: Colors.white,
          selectedItemColor: Colors.purple,
          selectedFontSize: 11,
          showUnselectedLabels: false,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: "Home",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.category),
              label: "Category",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: "Profile",
            ),
          ]),
      drawer: Drawer(
        child: Container(
          width: MediaQuery.of(context).size.width / 2,
          color: Colors.white,
          child: ListView(
            children: [
              Container(
                height: 130,
                width: double.infinity,
                padding: EdgeInsets.all(20),
                alignment: Alignment.centerLeft,
                color: Colors.purple,
                child: Text(
                  "Shopping Now!",
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
              SizedBox(height: 20),
              ListTile(
                onTap: () { Navigator.of(context).push(MaterialPageRoute(
                    builder: (BuildContext context) => HomeOfApp()));},
                title: Text("Home"),
                trailing: Icon(Icons.home),
              ),
              ListTile(
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (BuildContext context) => CategoryPage()));
                },
                title: Text("Categories"),
                trailing: Icon(Icons.category),
              ),
              ListTile(
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (BuildContext context) => aboutProject()));
                },
                title: Text("About App "),
                trailing: Icon(Icons.app_shortcut_outlined),
              ),
              ListTile(
                onTap: () {    Navigator.of(context).push(MaterialPageRoute(
                    builder: (BuildContext context) => aboutUs()));},
                title: Text("Who Are We ? "),
                trailing: Icon(Icons.contact_support),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

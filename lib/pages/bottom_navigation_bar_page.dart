

import 'package:flutter/material.dart';
import 'package:foodak/pages/account_page.dart';
import 'package:foodak/pages/favorite_page.dart';
import 'package:foodak/pages/home_page.dart';

class BottomNavigationBarPage extends StatefulWidget {
  const BottomNavigationBarPage({super.key});

  @override
  State<BottomNavigationBarPage> createState() => _BottomNavigationBarPageState();
}

class _BottomNavigationBarPageState extends State<BottomNavigationBarPage> {

int currentIndex = 0;

List<Widget> navigationPages = [
  HomePage(),
  FavoritePage(),
  AccountPage(),
];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Foodak"),
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.grey[200],
        foregroundColor: Colors.black,
      ),
      drawer: Drawer(
        child: Center(child: Text("i am into drawer")),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: navigationPages[currentIndex],
      ),
      bottomNavigationBar: BottomNavigationBar(
        items:[
           BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: "Home",
           ),
           BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            label: "Favorite",
           ),
           BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: "Account",
           ),
        ],
        onTap:(index){
          setState(() {
            currentIndex = index;
          });
        },
        currentIndex: currentIndex,
        selectedItemColor: Theme.of(context).primaryColor,
        backgroundColor: Colors.grey[200],
        ),
        backgroundColor: Colors.grey[200],
    );
  }
}
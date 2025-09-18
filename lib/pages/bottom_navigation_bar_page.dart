import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:foodak/pages/account_page.dart';
import 'package:foodak/pages/favorite_page.dart';
import 'package:foodak/pages/home_page.dart';

class BottomNavigationBarPage extends StatefulWidget {
  const BottomNavigationBarPage({super.key});

  @override
  State<BottomNavigationBarPage> createState() =>
      _BottomNavigationBarPageState();
}

class _BottomNavigationBarPageState extends State<BottomNavigationBarPage> with WidgetsBindingObserver{

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    super.didChangeAppLifecycleState(state);
    debugPrint("$state");
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  int currentIndex = 0;
  List<Widget> navigationPages = [HomePage(), FavoritePage(), AccountPage()];

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final bool isLandscape =
        MediaQuery.of(context).orientation == Orientation.landscape;
    final PreferredSizeWidget? appBar;
    if (Platform.isAndroid) {
      appBar = AppBar(
        title: const Text("Foodak"),
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.grey[200],
        foregroundColor: Colors.black,
      );
    } else if (Platform.isIOS) {
      appBar = CupertinoNavigationBar(middle: Text("Foodak"));
    } else {
      appBar = null;
    }

    return Scaffold(
      appBar: appBar,
      drawer: const Drawer(child: Center(child: Text("i am into drawer"))),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(
            (isLandscape) ? size.height * 0.06 : size.height * 0.022,
          ),
          child: navigationPages[currentIndex],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          const BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          const BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            label: "Favorite",
          ),
          const BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: "Account",
          ),
        ],
        onTap: (index) {
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

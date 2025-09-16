import"package:flutter/material.dart";
// import "package:flutter/services.dart";
import "package:foodak/pages/bottom_navigation_bar_page.dart";

void main(){
  // WidgetsFlutterBinding.ensureInitialized();
  // SystemChrome.setPreferredOrientations([DeviceOrientation.portraitDown, DeviceOrientation.portraitUp]);
  runApp(MyApp());
}


class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: BottomNavigationBarPage(),
      theme: ThemeData(
        fontFamily: "OpenSans",
        primarySwatch: Colors.deepOrange,
        useMaterial3: false,
      ),
    );
  }
}
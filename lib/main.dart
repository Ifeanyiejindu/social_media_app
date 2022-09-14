import 'package:flutter/material.dart';
import 'pages/account_page.dart';
import 'pages/homepage.dart';
import 'pages/reels_page.dart';
import 'pages/search_page.dart';
import 'pages/shop_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MainPage(),
      theme: ThemeData(brightness: Brightness.dark
      ),
    );
  }
}

class MainPage extends StatefulWidget {

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int _currentIndex = 0;

  void _navigateBottomBar (int index){
    setState(() {
      _currentIndex = index;
    });
  }

  List _myPages = [
    HomePage(),
    SearchPage(),
    ReelsPage(),
    ShopPage(),
    AccountsPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _myPages[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.black,
        currentIndex: _currentIndex,
        onTap: (value){
          _navigateBottomBar(value);
        },
        type: BottomNavigationBarType.fixed,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.search), label: 'Search'),
          BottomNavigationBarItem(icon: Icon(Icons.video_collection_outlined), label: 'Reels'),
          BottomNavigationBarItem(icon: Icon(Icons.shop_rounded),label: 'Shop'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Account')
        ],
      ),
    );
  }
}


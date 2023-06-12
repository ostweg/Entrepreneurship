import 'package:entre/pages/feedback_page.dart';
import 'package:entre/pages/home_page.dart';
import 'package:flutter/material.dart';

import 'navigation_page.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  List pages = [
    HomePage(),
    NavigationPage(),
    FeedbackPage()
  ];
  int currentIndex = 0;

  void onTap(int index){
    setState(() {
      currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: pages[currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.white,
        currentIndex: currentIndex,
        onTap: onTap,
        selectedItemColor: Colors.black54,
        unselectedItemColor: Colors.grey.withOpacity(0.5),
        showUnselectedLabels: false,
        showSelectedLabels: false,
        elevation: 0,
        items: const [
          BottomNavigationBarItem(label:"Search",icon: Icon(Icons.home)),
          BottomNavigationBarItem(label:"Navigate",icon: Icon(Icons.navigation)),
          BottomNavigationBarItem(label:"Feedback",icon: Icon(Icons.feedback))
        ],
      ),
    );
  }
}

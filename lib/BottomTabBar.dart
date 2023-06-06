import 'package:flutter/material.dart';
import 'package:this_4_that/chat_page.dart';
import 'package:this_4_that/scratch_files/home_page.dart';
import 'package:this_4_that/add_item_page.dart';
import 'package:this_4_that/profile_page.dart';

class BottomTabBar extends StatefulWidget {
  const BottomTabBar({Key? key}) : super(key: key);

  @override
  State<BottomTabBar> createState() => _BottomTabBarState();
}

class _BottomTabBarState extends State<BottomTabBar> {
  int _currentIndex = 0;
  final pages = [
    HomePage(),
    MessagesPage(),
    ChatPage(),
    // ProfilePage(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        onTap: (value) {
          setState(() {
            _currentIndex = value;
          });
        },
        iconSize: 30,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        backgroundColor: Colors.orange,
        selectedIconTheme: IconThemeData(color: Colors.white, size: 40),
        selectedItemColor: Colors.amberAccent,
        unselectedIconTheme: IconThemeData(
          color: Colors.black,
        ),
        unselectedItemColor: Colors.black,
        type: BottomNavigationBarType.fixed,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.sailing),
            label: 'Page 1',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.plus_one_sharp),
            label: 'Page 2',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.chat),
            label: 'Page 3',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_box),
            label: 'Page 4',
          ),
        ],
      ),
    );
  }
}

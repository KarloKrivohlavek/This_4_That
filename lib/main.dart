import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:this_4_that/app_router.dart';
import 'package:this_4_that/chat_page.dart';
import 'package:this_4_that/home_page.dart';
import 'package:this_4_that/add_item_page.dart';
import 'package:this_4_that/profile_page.dart';

import 'package:this_4_that/user_preferences.dart';
import 'package:this_4_that/user.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await UserPreferences.init();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: BottomTabBar(),
    );
  }
}

class BottomTabBar extends StatefulWidget {
  BottomTabBar({Key? key}) : super(key: key);

  @override
  State<BottomTabBar> createState() => _BottomTabBarState();
}

class _BottomTabBarState extends State<BottomTabBar> {
  int currentIndex = 0;

  List<Widget> pages = [];

  _BottomTabBarState() {
    pages = [
      HomePage(),
      MessagesPage(onReturn: returnToHOme),
      ChatPage(),
      ProfilePage(),
    ];
  }

  void returnToHOme() {
    setState(() {
      currentIndex = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    final user = UserPreferences.getUser();
    return Scaffold(
      body: pages[currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentIndex,
        onTap: (value) {
          setState(() {
            currentIndex = value;
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
            icon: ImageIcon(AssetImage('images/logo.png')),
            label: 'Page 1',
          ),
          BottomNavigationBarItem(
            icon: Icon(MdiIcons.plusThick),
            label: 'Page 2',
          ),
          BottomNavigationBarItem(
            icon: Icon(MdiIcons.message),
            label: 'Page 3',
          ),
          BottomNavigationBarItem(
            icon: Icon(MdiIcons.account),
            label: 'Page 4',
          ),
        ],
      ),
    );
  }
}
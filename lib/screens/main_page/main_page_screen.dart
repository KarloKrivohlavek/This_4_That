import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:this_4_that/constants/colors.dart';
import 'package:this_4_that/screens/home/home_page_screen.dart';
import 'package:this_4_that/screens/messages/messages_page_screen.dart';
import 'package:this_4_that/screens/profile/profile_page_screen.dart';

import '../add_item/add_item_page_screen.dart';
import 'main_page_controller.dart';

///
/// This is a screen in which we write widgets concerning [MainPageScreen]
///

class MainPageScreen extends GetView<MainPageController> {
  final List<Widget> pages = [
    HomePageScreen(),
    AddItemPageScreen(),
    MessagesPageScreen(),
    ProfilePageScreen(),
  ];

  @override
  Widget build(BuildContext context) => SafeArea(
        child: Obx(
          () => Scaffold(
            body: Center(child: pages[controller.currentIndex]),
            bottomNavigationBar: BottomNavigationBar(
              currentIndex: controller.currentIndex,
              onTap: (value) {
                controller.currentIndex = value;
              },
              iconSize: 30,
              showSelectedLabels: false,
              showUnselectedLabels: false,
              backgroundColor: MyColors.orange,
              selectedIconTheme: IconThemeData(color: MyColors.white, size: 40),
              selectedItemColor: Colors.amberAccent,
              unselectedIconTheme: IconThemeData(
                color: MyColors.black,
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
          ),
        ),
      );
}

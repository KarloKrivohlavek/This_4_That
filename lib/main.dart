import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:this_4_that/network/dependency_injection.dart';
import 'package:this_4_that/pages.dart';
import 'package:this_4_that/services/firebase_api.dart';
import 'package:this_4_that/services/firebase_service.dart';
import 'package:this_4_that/services/logger_service.dart';
import 'package:this_4_that/services/storage_service.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  Get.put(LoggerService());
  await GetStorage.init();
  // await FirebaseApi().initNotifications();
  await SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
  runApp(const This4ThatApp());
  DependencyInjection.init();
}

class InitialBinding extends Bindings {
  @override
  void dependencies() {
    Get
      ..put(StorageService())
      ..put(FirebaseService());
  }
}

class This4ThatApp extends StatelessWidget {
  const This4ThatApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      builder: (_, __) => GetMaterialApp(
        initialRoute: MyRoutes.splashPageScreen,
        initialBinding: InitialBinding(),
        getPages: pages,
      ),
    );
  }
}
//
// class BottomTabBar extends StatefulWidget {
//   BottomTabBar({Key? key}) : super(key: key);

//   @override
//   State<BottomTabBar> createState() => _BottomTabBarState();
// }
//
// class _BottomTabBarState extends State<BottomTabBar> {
//   int currentIndex = 0;
//
//   List<Widget> pages = [];
//
//   _BottomTabBarState() {
//     pages = [
//       HomePage(),
//       MessagesPage(onReturn: returnToHOme),
//       ChatPage(),
//       // ProfilePage(),
//     ];
//   }
//
//   void returnToHOme() {
//     setState(() {
//       currentIndex = 0;
//     });
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     // final user = UserPreferences.getUser();
//     return Scaffold(
//       body: pages[currentIndex],
//       bottomNavigationBar: BottomNavigationBar(
//         currentIndex: currentIndex,
//         onTap: (value) {
//           setState(() {
//             currentIndex = value;
//           });
//         },
//         iconSize: 30,
//         showSelectedLabels: false,
//         showUnselectedLabels: false,
//         backgroundColor: Colors.orange,
//         selectedIconTheme: IconThemeData(color: Colors.white, size: 40),
//         selectedItemColor: Colors.amberAccent,
//         unselectedIconTheme: IconThemeData(
//           color: Colors.black,
//         ),
//         unselectedItemColor: Colors.black,
//         type: BottomNavigationBarType.fixed,
//         items: const <BottomNavigationBarItem>[
//           BottomNavigationBarItem(
//             icon: ImageIcon(AssetImage('images/logo.png')),
//             label: 'Page 1',
//           ),
//           BottomNavigationBarItem(
//             icon: Icon(MdiIcons.plusThick),
//             label: 'Page 2',
//           ),
//           BottomNavigationBarItem(
//             icon: Icon(MdiIcons.message),
//             label: 'Page 3',
//           ),
//           BottomNavigationBarItem(
//             icon: Icon(MdiIcons.account),
//             label: 'Page 4',
//           ),
//         ],
//       ),
//     );
//   }
// }

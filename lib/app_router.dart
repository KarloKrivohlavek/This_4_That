import 'package:flutter/material.dart';
import 'package:this_4_that/chat_page.dart';
import 'package:this_4_that/home_page.dart';
import 'package:this_4_that/add_item_page.dart';
import 'package:this_4_that/main.dart';

class AppRouter {
  static Route onGenerateRoute(RouteSettings settings) {
    print('The route is ${settings.name}');

    switch (settings.name) {
      case '/':
        return HomePage.route();
      case HomePage.routeName:
        return HomePage.route();
      case MessagesPage.routeName:
        return MessagesPage.route();
        break;
      default:
        return _errorRoute();
    }
  }

  static Route _errorRoute() {
    return MaterialPageRoute(
      builder: (_) => Scaffold(
        appBar: AppBar(
          title: Text('Error'),
        ),
      ),
      settings: RouteSettings(name: '/error'),
    );
  }
}

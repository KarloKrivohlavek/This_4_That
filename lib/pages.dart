import 'package:get/get.dart';
import 'package:this_4_that/authentification_screens/authentification_binding.dart';
import 'package:this_4_that/authentification_screens/authentification_screen_1_login.dart';
import 'package:this_4_that/authentification_screens/authentification_screen_2_name_surname.dart';
import 'package:this_4_that/screens/add_item/add_item_page_binding.dart';
import 'package:this_4_that/screens/add_item/add_item_page_screen.dart';
import 'package:this_4_that/screens/add_item_page_0/add_item_page_0.dart';
import 'package:this_4_that/screens/home/home_page_binding.dart';
import 'package:this_4_that/screens/home/home_page_screen.dart';
import 'package:this_4_that/screens/main_page/main_page_binding.dart';
import 'package:this_4_that/screens/main_page/main_page_screen.dart';
import 'package:this_4_that/screens/messages/chat/chat_page_binding.dart';
import 'package:this_4_that/screens/messages/chat/chat_page_screen.dart';
import 'package:this_4_that/screens/messages/messages_page_binding.dart';
import 'package:this_4_that/screens/messages/messages_page_screen.dart';
import 'package:this_4_that/screens/messages/trade_confirmation/trade_confirmation_binding.dart';
import 'package:this_4_that/screens/profile/edit_profile/edit_profile_page_screen.dart';
import 'package:this_4_that/screens/profile/profile_page_binding.dart';
import 'package:this_4_that/screens/profile/profile_page_screen.dart';
import 'package:this_4_that/screens/splash_page/splash_page_binding.dart';
import 'package:this_4_that/screens/splash_page/splash_page_screen.dart';
import 'screens/add_item_page_0/add_item_page_0_binding.dart';
import 'screens/messages/trade_confirmation/trade_confirmation_screen.dart';

///
/// All pages used in the application
/// Also linked to the relevant bindings in order to
/// initialize / dispose proper controllers when neccesarry
///

final pages = [
  GetPage(
    name: MyRoutes.mainPageScreen,
    page: MainPageScreen.new,
    binding: MainPageBinding(),
  ),
  GetPage(
    name: MyRoutes.homePageScreen,
    page: HomePageScreen.new,
    binding: HomePageBinding(),
  ),
  GetPage(
    name: MyRoutes.addItemPageScreen,
    page: AddItemPageScreen.new,
    binding: AddItemPageBinding(),
  ),
  GetPage(
    name: MyRoutes.messagesPageScreen,
    page: MessagesPageScreen.new,
    binding: MessagesPageBinding(),
  ),
  GetPage(
    name: MyRoutes.profilePageScreen,
    page: ProfilePageScreen.new,
    binding: ProfilePageBinding(),
  ),
  GetPage(
    name: MyRoutes.editProfilePageScreen,
    page: EditProfilePageScreen.new,
    binding: ProfilePageBinding(),
  ),
  GetPage(
    name: MyRoutes.chatPageScreen,
    page: ChatPageScreen.new,
    binding: ChatPageBinding(),
  ),
  GetPage(
    name: MyRoutes.authentificationScreen,
    page: AuthentificationScreen1Login.new,
    binding: AuthentificationBinding(),
  ),
  GetPage(
    name: MyRoutes.authentificationScreenNameSurname,
    page: AuthentificationScreen2NameSurname.new,
    binding: AuthentificationBinding(),
  ),
  GetPage(
    name: MyRoutes.addItemPage0,
    page: AddItemPage0.new,
    binding: AddItemPage0Binding(),
  ),
  GetPage(
    name: MyRoutes.splashPageScreen,
    page: SplashPageScreen.new,
    binding: SplashPageBinding(),
  ),
  GetPage(
    name: MyRoutes.tradeConfirmationScreen,
    page: TradeConfirmationScreen.new,
    binding: TradeConfirmationBinding(),
  ),
];

/// All pages have their designated names which can be found here
class MyRoutes {
  static const mainPageScreen = '/main_page_screen';
  static const homePageScreen = '/home_page_screen';
  static const addItemPageScreen = '/add_item_page_screen';
  static const messagesPageScreen = '/messages_page_screen';
  static const profilePageScreen = '/profile_page_screen';
  static const editProfilePageScreen = '/edit_profile_page_screen';
  static const chatPageScreen = '/chat_page_screen';
  static const authentificationScreen = '/authentification_screen_1_login';
  static const authentificationScreenNameSurname =
      '/authentification_screen_2_name_surname';
  static const addItemPage0 = '/add_item_page_0';
  static const tradeConfirmationScreen = '/trade_confirmation_screen.dart';
  static const splashPageScreen = '/splash_page_screen';
}

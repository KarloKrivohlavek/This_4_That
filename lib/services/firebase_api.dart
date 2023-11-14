// import 'package:firebase_messaging/firebase_messaging.dart';
// import 'package:get/get.dart';
// import 'package:this_4_that/screens/messages/messages_page_screen.dart';
//
// Future<void> handleBackgroundMessage(RemoteMessage message) async {
//   print('Title: ${message.notification?.title}');
//   print('Body: ${message.notification?.body}');
//   print('Payload: ${message.data}');
// }
//
// class FirebaseApi {
//   final _firebaseMessaging = FirebaseMessaging.instance;
//   FirebaseApi() {
//     initPushNotifications();
//   }
//   void handleMessage(RemoteMessage? message) {
//     if (message == null) return;
//     final notificationTitle = message.notification?.title;
//     final notificationBody = message.notification?.body;
//     final data = message.data;
//     if (notificationTitle == "Imaš novu poruku"
//         // &&
//         // data["custom_data_key"] == "Your Custom Data Value"
//         ) {
//       // Get.to(MessagesPageScreen());
//     }
//   }
//
//   Future initPushNotifications() async {
//     await FirebaseMessaging.instance
//         .setForegroundNotificationPresentationOptions(
//       alert: true,
//       badge: true,
//       sound: true,
//     );
//
//     FirebaseMessaging.instance.getInitialMessage().then(handleMessage);
//     FirebaseMessaging.onMessageOpenedApp.listen(handleMessage);
//     FirebaseMessaging.onBackgroundMessage(handleBackgroundMessage);
//   }
//
//   Future<void> initNotifications() async {
//     await _firebaseMessaging.requestPermission();
//     final fCMToken = await _firebaseMessaging.getToken();
//     print(fCMToken);
//     initNotifications();
//     // FirebaseMessaging.onBackgroundMessage(handleBackgroundMessage);
//   }
// }

// import 'package:flutter/material.dart';
// import 'package:this_4_that/chatMessagePreview.dart';
//
// class ChatPage extends StatefulWidget {
//   const ChatPage({super.key});
//
//   @override
//   State<ChatPage> createState() => _ChatPageState();
// }
//
// class _ChatPageState extends State<ChatPage> {
//   final List _messages = [
//     'message 1',
//     'message 2',
//     'message 3',
//   ];
//
//   bool isActiveButton1On = false;
//   bool isActiveButton2On = false;
//   bool isActiveButton3On = false;
//
//   @override
//   Widget build(BuildContext context) {
//     return SafeArea(
//       child: Scaffold(
//         body: Column(
//           children: [
//             Container(
//               child: Row(
//                 children: [
//                   Expanded(
//                     child: TextButton(
//                       onPressed: () {},
//                       child: (Container(
//                         width: MediaQuery.of(context).size.width,
//                         height: MediaQuery.of(context).size.height * 0.05,
//                         decoration: BoxDecoration(
//                           border: Border.all(
//                             color: Colors.orange,
//                             width: 3,
//                           ),
//                           color: isActiveButton1On
//                               ? Colors.orange
//                               : Colors.transparent,
//                           borderRadius: BorderRadius.circular(20),
//                         ),
//                         child: Center(
//                           child: const Text(
//                             'Razgovori',
//                             style: TextStyle(
//                                 fontSize: 14,
//                                 fontWeight: FontWeight.w400,
//                                 color: Colors.black),
//                           ),
//                         ),
//                       )),
//                       // style: TextButton.styleFrom(
//                       //   textStyle: const TextStyle(fontSize: 20),
//                     ),
//                   ),
//                   Expanded(
//                     child: TextButton(
//                       onPressed: () {},
//                       child: (Container(
//                         width: MediaQuery.of(context).size.width,
//                         height: MediaQuery.of(context).size.height * 0.05,
//                         decoration: BoxDecoration(
//                           border: Border.all(
//                             color: Colors.orange,
//                             width: 3,
//                           ),
//                           color: isActiveButton2On
//                               ? Colors.orange
//                               : Colors.transparent,
//                           borderRadius: BorderRadius.circular(20),
//                         ),
//                         child: Center(
//                           child: const Text(
//                             'Matchevi',
//                             style: TextStyle(
//                                 fontSize: 14,
//                                 fontWeight: FontWeight.w400,
//                                 color: Colors.black),
//                           ),
//                         ),
//                       )),
//                       // style: TextButton.styleFrom(
//                       //   textStyle: const TextStyle(fontSize: 20),
//                     ),
//                   ),
//                   Expanded(
//                     child: Container(
//                       child: TextButton(
//                         onPressed: () {},
//                         child: (Container(
//                           width: MediaQuery.of(context).size.width,
//                           height: MediaQuery.of(context).size.height * 0.05,
//                           decoration: BoxDecoration(
//                             border: Border.all(
//                               color: Colors.orange,
//                               width: 3,
//                             ),
//                             color: isActiveButton3On
//                                 ? Colors.transparent
//                                 : Colors.orange,
//                             borderRadius: BorderRadius.circular(20),
//                           ),
//                           child: Center(
//                               child: const Text(
//                             'Nove Poruke',
//                             style: TextStyle(
//                                 fontSize: 14,
//                                 fontWeight: FontWeight.w400,
//                                 color: Colors.black),
//                           )),
//                         )),
//                         // style: TextButton.styleFrom(
//                         //   textStyle: const TextStyle(fontSize: 20),
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//             Container(
//               height: MediaQuery.of(context).size.height * 0.8,
//               child: ListView.builder(
//                 itemCount: _messages.length,
//                 itemBuilder: (context, index) {
//                   return MessagePreview();
//                 },
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

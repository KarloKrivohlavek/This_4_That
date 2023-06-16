import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:this_4_that/constants/colors.dart';
import 'package:this_4_that/constants/text_styles.dart';
import 'package:this_4_that/pages.dart';
import 'package:this_4_that/services/firebase_service.dart';
import 'package:this_4_that/widget/custom_dialog.dart';

import '../../chatMessagePreview.dart';
import 'messages_page_controller.dart';

///
/// This is a screen in which we write widgets concerning [HelloScreen]
///

class MessagesPageScreen extends GetView<MessagesPageController> {
  const MessagesPageScreen({super.key});

  @override
  Widget build(BuildContext context) => Obx(
        () => SafeArea(
          child: Scaffold(
            body: Column(
              children: [
//                 Row(
//                   children: [
//                     Expanded(
//                       child: TextButton(
//                         onPressed: () {},
//                         child: (Container(
//                           width: MediaQuery.of(context).size.width,
//                           height: MediaQuery.of(context).size.height * 0.05,
//                           decoration: BoxDecoration(
//                             border: Border.all(
//                               color: MyColors.orange,
//                               width: 3,
//                             ),
//                             color: controller.isActiveButton1On
//                                 ? MyColors.orange
//                                 : Colors.transparent,
//                             borderRadius: BorderRadius.circular(20),
//                           ),
//                           child: const Center(
//                             child: Text(
//                               'Razgovori',
//                               style: TextStyle(
//                                   fontSize: 14,
//                                   fontWeight: FontWeight.w400,
//                                   color: Colors.black),
//                             ),
//                           ),
//                         )),
//                       ),
//                     ),
//                     Expanded(
//                       child: TextButton(
//                         onPressed: () {},
//                         child: (Container(
//                           width: MediaQuery.of(context).size.width,
//                           height: MediaQuery.of(context).size.height * 0.05,
//                           decoration: BoxDecoration(
//                             border: Border.all(
//                               color: MyColors.orange,
//                               width: 3,
//                             ),
//                             color: controller.isActiveButton2On
//                                 ? MyColors.orange
//                                 : Colors.transparent,
//                             borderRadius: BorderRadius.circular(20),
//                           ),
//                           child: const Center(
//                             child: Text(
//                               'Matchevi',
//                               style: TextStyle(
//                                   fontSize: 14,
//                                   fontWeight: FontWeight.w400,
//                                   color: Colors.black),
//                             ),
//                           ),
//                         )),
// // style: TextButton.styleFrom(
// //   textStyle: const TextStyle(fontSize: 20),
//                       ),
//                     ),
//                     Expanded(
//                       child: TextButton(
//                         onPressed: () {},
//                         child: (Container(
//                           width: MediaQuery.of(context).size.width,
//                           height: MediaQuery.of(context).size.height * 0.05,
//                           decoration: BoxDecoration(
//                             border: Border.all(
//                               color: MyColors.orange,
//                               width: 3,
//                             ),
//                             color: controller.isActiveButton3On
//                                 ? Colors.transparent
//                                 : MyColors.orange,
//                             borderRadius: BorderRadius.circular(20),
//                           ),
//                           child: const Center(
//                               child: Text(
//                             'Nove Poruke',
//                             style: TextStyle(
//                                 fontSize: 14,
//                                 fontWeight: FontWeight.w400,
//                                 color: Colors.black),
//                           )),
//                         )),
//                       ),
//                     ),
//                   ],
//                 ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.7,
                  child: ListView.builder(
                    itemCount: controller.matchedItemsList.length,
                    itemBuilder: (context, index) {
                      final currentItem =
                          controller.matchedItemsList.elementAt(index);
                      bool isCurrentUserFirst = currentItem.user1ID ==
                          FirebaseAuth.instance.currentUser?.uid;
                      return GestureDetector(
                        onTap: () async {
                          final matchExists = await FirebaseService()
                              .doesMatchExist(currentItem.matchID);
                          if (matchExists) {
                            Get.toNamed(MyRoutes.chatPageScreen, arguments: {
                              'matchedItem':
                                  controller.matchedItemsList.elementAt(index)
                            });
                          } else {
                            Get.dialog(CustomDialog(
                                title: 'Unesrećenje',
                                text:
                                    'Drugi korisnik je izbrisao predmet za razmjenu',
                                button1: 'Izbrisi razgovor',
                                button2: 'Odustani',
                                action: () {
                                  controller.deleteItemFromMessagesList(
                                      currentItem, isCurrentUserFirst);
                                }));
                          }
                        },
                        child: MessagePreview(
                          currentUserItemImage: isCurrentUserFirst
                              ? currentItem.item1PictureURL
                              : currentItem.item2PictureURL,
                          differentUserItemImage: isCurrentUserFirst
                              ? currentItem.item2PictureURL
                              : currentItem.item1PictureURL,
                          differentUserName: isCurrentUserFirst
                              ? currentItem.user2Username
                              : currentItem.user1Username,
                          differentUserItemName: isCurrentUserFirst
                              ? currentItem.item2Name
                              : currentItem.item1Name,
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      );
}

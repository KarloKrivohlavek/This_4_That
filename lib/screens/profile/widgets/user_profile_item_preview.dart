import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:this_4_that/authentification_screens/authentification_screen_1_login.dart';
import 'package:this_4_that/constants/colors.dart';
import 'package:this_4_that/constants/strings.dart';
import 'package:this_4_that/data.dart';
import 'package:this_4_that/screens/profile/profile_page_controller.dart';
import 'package:this_4_that/services/firebase_service.dart';
import 'package:this_4_that/widget/custom_dialog.dart';
import 'package:get/get.dart';

class UserProfileItemPreview extends GetView<ProfilePageController> {
  const UserProfileItemPreview(
      {required this.itemName,
      required this.pictureURL,
      required this.index,
      required this.isActiveButtonOn});
  final String itemName;
  final String pictureURL;
  final bool isActiveButtonOn;

  final int index;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
          margin: const EdgeInsets.all(20),
          child: Column(
            children: [
              Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width * 0.35,
                      height: MediaQuery.of(context).size.height * 0.15,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        image: DecorationImage(
                            fit: BoxFit.cover, image: NetworkImage(pictureURL)),
                      ),
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                    Container(
                      height: MediaQuery.of(context).size.height * 0.15,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            margin: const EdgeInsets.only(right: 20),
                            child: Column(
                              children: [
                                Text(
                                  itemName,
                                  style: const TextStyle(
                                      fontWeight: FontWeight.w500,
                                      fontSize: 16),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(height: 30),
                          Container(
                            width: MediaQuery.of(context).size.width * 0.35,
                            child: isActiveButtonOn
                                //Ovo je row za aktivne predmete
                                ? Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      GestureDetector(
                                        onTap: () {},
                                        child: Container(
                                          margin:
                                              const EdgeInsets.only(bottom: 5),
                                          width: 35,
                                          height: 35,
                                          decoration: const BoxDecoration(
                                              shape: BoxShape.circle,
                                              color: MyColors.orange),
                                          child: const Icon(MdiIcons.pencil),
                                        ),
                                      ),
                                      GestureDetector(
                                        onTap: () {
                                          Get.dialog(CustomDialog(
                                              title: 'Arhiviraj',
                                              text: MyStrings.archiveItemDialog,
                                              button1: 'Arhiviraj',
                                              button2: 'Odustani',
                                              action: () {
                                                controller
                                                    .changeItemStateToArchived(
                                                        index);
                                                Get.back();
                                              }));
                                        },
                                        child: Container(
                                          width: 35,
                                          height: 35,
                                          decoration: const BoxDecoration(
                                              shape: BoxShape.circle,
                                              color: MyColors.orange),
                                          child: const Icon(
                                              MdiIcons.archiveOutline),
                                        ),
                                      )
                                    ],
                                  )
                                : Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      GestureDetector(
                                        onTap: () {
                                          final currentItem = controller
                                              .currentUserItemsArchived
                                              .elementAt(index);
                                          final itemID = currentItem.itemID;

                                          controller.changeItemStatus(
                                              itemID, 'active');
                                          controller.removeFromArchivedList(
                                              currentItem);
                                        },
                                        child: Container(
                                          margin:
                                              const EdgeInsets.only(bottom: 5),
                                          width: 35,
                                          height: 35,
                                          decoration: const BoxDecoration(
                                              shape: BoxShape.circle,
                                              color: MyColors.orange),
                                          child: const Icon(MdiIcons.upload),
                                        ),
                                      ),
                                      GestureDetector(
                                        onTap: () {},
                                        child: Container(
                                          margin:
                                              const EdgeInsets.only(bottom: 5),
                                          width: 35,
                                          height: 35,
                                          decoration: const BoxDecoration(
                                              shape: BoxShape.circle,
                                              color: MyColors.orange),
                                          child: const Icon(MdiIcons.pencil),
                                        ),
                                      ),
                                      GestureDetector(
                                        onTap: () async {
                                          await controller
                                              .deleteCurrentItem(index);
                                        },
                                        child: Container(
                                          width: 35,
                                          height: 35,
                                          decoration: const BoxDecoration(
                                              shape: BoxShape.circle,
                                              color: MyColors.orange),
                                          child: const Icon(MdiIcons.trashCan),
                                        ),
                                      ),
                                    ],
                                  ),
                          ),
                          // TextButton(
                          //     onPressed: () {
                          //       Navigator.push(
                          //         context,
                          //         MaterialPageRoute(
                          //             builder: (context) =>
                          //                 AuthentificationScreen1Login()),
                          //       );
                          //     },
                          //     child: Expanded(
                          //         child: Container(
                          //       color: Colors.pink,
                          //       child: Text('Auth Screen 1'),
                          //     )))
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ],
          )),
    );
  }
}

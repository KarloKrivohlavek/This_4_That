import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:this_4_that/constants/colors.dart';
import 'package:this_4_that/constants/strings.dart';
import 'package:this_4_that/constants/text_styles.dart';
import 'package:this_4_that/screens/profile/profile_page_controller.dart';
import 'package:this_4_that/screens/profile/widgets/profile_page_edit_profile_preview_widget.dart';
import 'package:this_4_that/screens/profile/widgets/user_profile_item_preview.dart';
import 'package:this_4_that/widget/custom_dialog.dart';

///
/// This is a screen in which we write widgets concerning [HelloScreen]
///

class ProfilePageScreen extends GetView<ProfilePageController> {
  const ProfilePageScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // final User user;
    // final ProfilePageController controller
    return Obx(() => Scaffold(
            body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ProfilePageEditProfilePreviewWidget(
                imagePath: controller.currentUserData.profilePicture != null &&
                        controller.currentUserData.profilePicture!.isEmpty
                    ? 'images/default_user_profile_picture.png'
                    : controller.currentUserData.profilePicture,
                // user: user,
                // controller: controller,
                fullName: controller.currentUserData.fullName,
                userName: controller.currentUserData.username),
            const Padding(
              padding: EdgeInsets.only(left: 16),
              child: Text(
                MyStrings.mojioglasi,
                style: TextStyle(fontWeight: FontWeight.w700, fontSize: 24),
              ),
            ),
            Center(
              child: SizedBox(
                width: Get.width * 0.95,
                child: Row(
                  children: [
                    Expanded(
                      child: TextButton(
                        onPressed: () {
                          if (controller.isActiveButtonOn == false) {
                            controller.isActiveButtonOn =
                                !controller.isActiveButtonOn;
                          }
                        },
                        child: (Container(
                          width: Get.size.width,
                          height: MediaQuery.of(context).size.height * 0.05,
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: MyColors.orange,
                              width: 3.w,
                            ),
                            color: controller.isActiveButtonOn
                                ? MyColors.orange
                                : Colors.transparent,
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: const Center(
                            child: Text(
                              'Aktivni',
                              style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400,
                                  color: Colors.black),
                            ),
                          ),
                        )),
                        // style: TextButton.styleFrom(
                        //   textStyle: const TextStyle(fontSize: 20),
                      ),
                    ),
                    Expanded(
                      child: TextButton(
                        onPressed: () {
                          if (controller.isActiveButtonOn == true) {
                            controller.isActiveButtonOn =
                                !controller.isActiveButtonOn;
                          }
                        },
                        child: (Container(
                          width: Get.size.width,
                          height: Get.size.height * 0.05,
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: MyColors.orange,
                              width: 3.w,
                            ),
                            color: controller.isActiveButtonOn
                                ? Colors.transparent
                                : MyColors.orange,
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: const Center(
                              child: Text(
                            'Arhivirani',
                            style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w400,
                                color: MyColors.black),
                          )),
                        )),
                        // style: TextButton.styleFrom(
                        //   textStyle: const TextStyle(fontSize: 20),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            controller.isActiveButtonOn
                ? Expanded(
                    child: Obx(
                      () => ListView.builder(
                        shrinkWrap: true,
                        itemCount: controller.currentUserItemsActive.length,
                        itemBuilder: (context, index) {
                          return UserProfileItemPreview(
                            isActiveButtonOn: controller.isActiveButtonOn,
                            index: index,
                            itemName: controller
                                .currentUserItemsActive[index].itemName,
                            pictureURL: controller.currentUserItemsActive[index]
                                .itemPictureList![0],
                          );
                          // } else {
                          //   return const SizedBox();
                          // }
                        },
                      ),
                    ),
                  )
                : Expanded(
                    child: Obx(
                      () => ListView.builder(
                        shrinkWrap: true,
                        itemCount: controller.currentUserItemsArchived.length,
                        itemBuilder: (context, index) {
                          return UserProfileItemPreview(
                            isActiveButtonOn: controller.isActiveButtonOn,
                            index: index,
                            itemName: controller
                                .currentUserItemsArchived[index].itemName,
                            pictureURL: controller
                                .currentUserItemsArchived[index]
                                .itemPictureList![0],
                          );
                          // } else {
                          //   return const SizedBox();
                          // }
                        },
                      ),
                    ),
                  ),
            // GestureDetector(
            //   onTap: () {
            //     Get.toNamed(MyRoutes.authentificationScreen);
            //   },
            //   child: Container(
            //     color: Colors.red,
            //     height: 100,
            //     width: 150,
            //     child: Center(
            //         child: Text(
            //       'Sign in screen',
            //       style: TextStyle(color: Colors.white),
            //     )),
            //   ),
            // ),
            GestureDetector(
              onTap: () {
                Get.dialog(CustomDialog(
                    title: 'Odjava?',
                    text:
                        'Jesi li siguran da se želiš odjaviti iz ove super kul aplikacije?',
                    button1: 'Odjavi',
                    button2: 'Odustani',
                    action: () {
                      controller.signOutUser();
                    }));
              },
              child: Container(
                padding: const EdgeInsets.only(bottom: 10),
                child:
                    Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                  Container(
                    height: 40,
                    width: 40,
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.grey,
                    ),
                    child: const Icon(
                      MdiIcons.logout,
                      size: 20,
                    ),
                  ),
                  Text(
                    'Odjavi se',
                    style: MyTextStyles.poppins16w400,
                  )
                ]),
              ),
            ),
          ],
        )));
  }
}

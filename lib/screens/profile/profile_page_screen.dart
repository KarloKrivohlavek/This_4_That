import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:this_4_that/authentification_screens/authentification_screen_1_login.dart';
import 'package:this_4_that/constants/colors.dart';
import 'package:this_4_that/constants/strings.dart';
import 'package:this_4_that/data.dart';
import 'package:this_4_that/screens/profile/profile_page_controller.dart';
import 'package:this_4_that/screens/profile/widgets/profile_page_edit_profile_preview_widget.dart';
import 'package:this_4_that/screens/profile/widgets/user_profile_item_preview.dart';
import 'package:this_4_that/src/edit_profile_page.dart';
import 'package:this_4_that/user.dart';
import 'package:this_4_that/user_preferences.dart';
import 'package:this_4_that/widget/profile_widget.dart';

///
/// This is a screen in which we write widgets concerning [HelloScreen]
///

class ProfilePageScreen extends GetView<ProfilePageController> {
  const ProfilePageScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final user = UserPreferences.getUser();
    // final User user;
    // final ProfilePageController controller
    return Obx(() => Scaffold(
            body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ProfilePageEditProfilePreviewWidget(
              imagePath: currentUser.imagePath,
              // user: user,
              // controller: controller,
              fullName: controller.thisUser.fullName,
              userName: currentUser.name,
            ),
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
                ? ListView.builder(
                    shrinkWrap: true,
                    itemCount: currentUserItems.length,
                    itemBuilder: (context, index) {
                      if (currentUserItems[index].isArchived == false) {
                        return UserProfileItemPreview(
                          isActiveButtonOn: controller.isActiveButtonOn,
                          index: index,
                          itemName: currentUserItems[index].title,
                          pictureURL: currentUserItems[index].imagesURLs[0],
                        );
                      } else {
                        return const SizedBox();
                      }
                    },
                  )
                : ListView.builder(
                    shrinkWrap: true,
                    itemCount: currentUserItems.length,
                    itemBuilder: (context, index) {
                      if (currentUserItems[index].isArchived == true) {
                        return UserProfileItemPreview(
                          isActiveButtonOn: controller.isActiveButtonOn,
                          index: index,
                          itemName: currentUserItems[index].title,
                          pictureURL: currentUserItems[index].imagesURLs[0],
                        );
                      } else {
                        return const SizedBox();
                      }
                    },
                  ),
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) =>
                          const AuthentificationScreen1Login()),
                );
              },
              child: Container(
                color: Colors.red,
                height: 100,
                width: 150,
                child: Center(
                    child: Text(
                  'Sign in screen',
                  style: TextStyle(color: Colors.white),
                )),
              ),
            )
          ],
        )));
  }
}
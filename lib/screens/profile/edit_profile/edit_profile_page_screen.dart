
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:this_4_that/constants/colors.dart';
import 'package:this_4_that/pages.dart';
import 'package:this_4_that/screens/profile/profile_page_controller.dart';
import 'package:this_4_that/widget/custom_dialog.dart';
import 'package:this_4_that/widget/filled_color_button_widget.dart';
import 'package:this_4_that/widget/profile_widget.dart';
import 'package:this_4_that/widget/textfield_widget.dart';


///
/// This is a screen in which we write widgets concerning [HelloScreen]
///

class EditProfilePageScreen extends GetView<ProfilePageController> {
  const EditProfilePageScreen({super.key});

  @override
  Widget build(BuildContext context) => Obx(
        () => Scaffold(
          appBar: AppBar(
            elevation: 0,
            backgroundColor: MyColors.orange,
          ),
          body: ListView(
            padding: const EdgeInsets.symmetric(horizontal: 32),
            physics: const BouncingScrollPhysics(),
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 20),
                child: ProfileWidget(
                    imagePath: controller.profileImage,
                    // controller.currentUserData.profilePicture.toString(),
                    isEdit: true,
                    onClicked: () async {
                      await controller.changeProfilePicture();
                    }),
              ),
              const SizedBox(height: 24),
              TextFieldWidget(
                controller: controller.userNameController,
                label: 'Korisničko ime',
                text: controller.currentUserData.username,
                onChanged: (name) {},
              ),
              const SizedBox(height: 24),
              const SizedBox(height: 24),
              TextFieldWidget(
                controller: controller.descriptionController,
                label: 'O meni',
                text: controller.currentUserData.description,
                maxLines: 5,
                onChanged: (vo) {},
              ),
              const SizedBox(height: 24),
              GestureDetector(
                onTap: () {
                  controller.updateUsernameAndDescription();
                  Get.back();
                },
                child: FilledColorButtonWidget(
                    buttonHeight: 50.h,
                    buttonText: 'Spremi',
                    buttonWidth: double.infinity,
                    isEnabled: controller.userNameIsEmpty &&
                        controller.descriptionIsEmpty),
              ),
              SizedBox(
                height: 100.h,
              ),
              GestureDetector(
                onTap: () {
                  Get.dialog(CustomDialog(
                      title: 'Brisanje računa',
                      text:
                          'Jeste li sigurni da želite trajno izbrisati račun, ovom akcijom će biti izbrisani svi vaši oglasi i matchevi s drugim korisnicima.',
                      button1: 'Izbriši',
                      button2: 'Odustani',
                      action: () async {
                        await controller.deleteUserAccount();
                        Get.offAllNamed(MyRoutes.authentificationScreen);
                      }));
                },
                child: Center(
                  child: Text(
                    'Izbriši računa',
                    style: GoogleFonts.poppins(
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                        color: Colors.red),
                  ),
                ),
              )
            ],
          ),
        ),
      );
}

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart';
import 'package:this_4_that/screens/profile/profile_page_controller.dart';
import 'package:this_4_that/widget/button_widget.dart';
import 'package:this_4_that/widget/filled_color_button_widget.dart';
import 'package:this_4_that/widget/profile_widget.dart';
import 'package:this_4_that/widget/textfield_widget.dart';

import 'edit_profile_page_controller.dart';

///
/// This is a screen in which we write widgets concerning [HelloScreen]
///

class EditProfilePageScreen extends GetView<ProfilePageController> {
  @override
  Widget build(BuildContext context) => Obx(
        () => Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.orange,
          ),
          body: ListView(
            padding: EdgeInsets.symmetric(horizontal: 32),
            physics: BouncingScrollPhysics(),
            children: [
              ProfileWidget(
                  imagePath: controller.profileImage,
                  // controller.currentUserData.profilePicture.toString(),
                  isEdit: true,
                  onClicked: () async {
                    await controller.changeProfilePicture();
                  }),
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
            ],
          ),
        ),
      );
}

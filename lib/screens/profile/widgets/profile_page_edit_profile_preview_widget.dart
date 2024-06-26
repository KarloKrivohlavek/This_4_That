import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:this_4_that/constants/colors.dart';
import 'package:this_4_that/pages.dart';

class ProfilePageEditProfilePreviewWidget extends StatelessWidget {
  ProfilePageEditProfilePreviewWidget(
      {super.key,
      // required this.user,
      // required this.controller,
      this.imagePath,
      required this.userName,
      required this.fullName});

  // final User user;
  // final ProfilePageController controller;
  String? imagePath;
  String userName;
  String fullName;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      margin: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: MyColors.orange,
        borderRadius: BorderRadius.circular(50),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            height: 80.h,
            width: 80.w,
            decoration: BoxDecoration(
                shape: BoxShape.circle,
                image: DecorationImage(
                    fit: BoxFit.fill,
                    image: imagePath == null
                        ? const AssetImage(
                                'images/default_user_profile_picture.png')
                            as ImageProvider
                        : CachedNetworkImageProvider(imagePath!))),
            // child: ProfileWidget(
            //   imagePath: imagePath,
            //   onClicked: () {},
            // ),
          ),
          SizedBox(
            width: 20.w,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  userName,
                  style: const TextStyle(
                      fontWeight: FontWeight.w700, fontSize: 24),
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                ),
                SizedBox(
                  height: 15.h,
                ),
                Text(
                  fullName,
                  style: const TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: 16,
                  ),
                )
              ],
            ),
          ),
          FloatingActionButton(
            onPressed: () {
              Get.toNamed(MyRoutes.editProfilePageScreen);
            },
            backgroundColor: Colors.white,
            foregroundColor: MyColors.black,
            elevation: 0,
            child: const Icon(MdiIcons.pencil),
          )
        ],
      ),
    );
  }
}

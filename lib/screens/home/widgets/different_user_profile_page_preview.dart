import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:this_4_that/constants/colors.dart';
import 'package:this_4_that/constants/text_styles.dart';

class DifferentUserProfilePagePreview extends StatelessWidget {
  DifferentUserProfilePagePreview(
      {super.key,
      required this.userProfileName,
      required this.userProfileDescription,
      required this.userProfilePicture,
      required this.location,
      required this.userAge});
  final String userProfileName;
  final String userProfileDescription;
  final String userProfilePicture;
  final String location;
  final String userAge;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          appBar: AppBar(
            leading: GestureDetector(
              onTap: () {
                Get.back();
              },
              child: const Icon(
                MdiIcons.arrowLeft,
                color: MyColors.black,
              ),
            ),
            backgroundColor: Colors.transparent,
            elevation: 0,
          ),
          backgroundColor: MyColors.white,
          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: Column(
                    children: [
                      Container(
                        height: 160.h,
                        width: 160.w,
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            image: DecorationImage(
                              image: userProfilePicture!.contains('default')
                                  ? const AssetImage(
                                          'images/default_user_profile_picture.png')
                                      as ImageProvider
                                  : CachedNetworkImageProvider(
                                      userProfilePicture!),
                            )),
                      ),
                      SizedBox(
                        height: 20.h,
                      ),
                      Container(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              width: Get.width * 0.7,
                              child: Text(
                                userProfileName,
                                overflow: TextOverflow.ellipsis,
                                style: MyTextStyles.poppins24w700,
                                textAlign: TextAlign.center,
                              ),
                            ),
                            Container(
                              child: Text(
                                ", $userAge",
                                style: MyTextStyles.poppins24w400,
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  children: [
                    const Icon(MdiIcons.mapMarker),
                    Text(
                      location,
                      style: MyTextStyles.poppins16w400,
                    )
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                Text(
                  'O meni',
                  style: MyTextStyles.poppins24w700,
                ),
                Text(
                  userProfileDescription,
                  style: MyTextStyles.poppins16w400,
                ),
                const SizedBox(
                  height: 20,
                ),
                // Text(
                //   'Recenzije korisnika',
                //   style: MyTextStyles.poppins24w700,
                // ),
                // Container(
                //   child: Column(
                //     children: [
                //       Row(
                //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
                //         children: [
                //           Text(
                //             '5,0',
                //             style: MyTextStyles.poppins24w700,
                //           ),
                //           Text(
                //             '3 Recenzije',
                //             style: MyTextStyles.poppins16w400,
                //           )
                //         ],
                //       ),
                //       NumberOfRatingsIndicator(
                //         ratingCountPerCategory: 20,
                //         scoreCategory: '5',
                //       ),
                //       NumberOfRatingsIndicator(
                //         ratingCountPerCategory: 2,
                //         scoreCategory: '4',
                //       ),
                //       NumberOfRatingsIndicator(
                //         ratingCountPerCategory: 1,
                //         scoreCategory: '3',
                //       ),
                //       NumberOfRatingsIndicator(
                //         ratingCountPerCategory: 1,
                //         scoreCategory: '2',
                //       ),
                //       NumberOfRatingsIndicator(
                //         ratingCountPerCategory: 1,
                //         scoreCategory: '1',
                //       ),
                //     ],
                //   ),
                // )
              ],
            ),
          )),
    );
  }
}

class NumberOfRatingsIndicator extends StatelessWidget {
  const NumberOfRatingsIndicator({
    required this.ratingCountPerCategory,
    required this.scoreCategory,
    super.key,
  });
  final String scoreCategory;
  final double ratingCountPerCategory;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          margin: EdgeInsets.only(right: 15),
          child: Text(
            scoreCategory,
            style: MyTextStyles.poppins16w400,
          ),
        ),
        Expanded(
          child: Stack(
            children: [
              Container(
                height: 10,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: MyColors.grey,
                ),
              ),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: MyColors.orange,
                ),
                height: 10,
                width: 20.w * ratingCountPerCategory,
              )
            ],
          ),
        )
      ],
    );
  }
}

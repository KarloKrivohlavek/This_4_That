import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:this_4_that/constants/colors.dart';
import 'package:this_4_that/constants/text_styles.dart';
import 'package:this_4_that/pages.dart';
import 'package:this_4_that/screens/messages/chat/chat_page_controller.dart';
import 'package:this_4_that/screens/messages/chat/widgets/custom_appbar.dart';
import 'package:this_4_that/widget/outlined_color_button_widget.dart';

import 'trade_confirmation_controller.dart';

///
/// This is a screen in which we write widgets concerning [HelloScreen]
///

// var data = Get.arguments;

class TradeConfirmationScreen extends GetView<ChatPageController> {
  const TradeConfirmationScreen({super.key});

  @override
  Widget build(BuildContext context) => SafeArea(
        child: Scaffold(
            resizeToAvoidBottomInset: false,
            body: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      // Container(
                      //   height: 144.h,
                      //   width: 144.w,
                      //   decoration: BoxDecoration(
                      //       shape: BoxShape.circle,
                      //       image: DecorationImage(
                      //           fit: BoxFit.fill,
                      //           image: AssetImage(
                      //               'images/default_user_profile_picture.png')
                      //           imagePath == null
                      //               ? const AssetImage(
                      //                       'images/default_user_profile_picture.png')
                      //                   as ImageProvider
                      //               : NetworkImage(imagePath!)
                      //           )),
                      //   // child: ProfileWidget(
                      //   //   imagePath: imagePath,
                      //   //   onClicked: () {},
                      //   // ),
                      // ),
                      Container(
                        width: 144.w,
                        height: 144.h,
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            image: DecorationImage(
                              image: controller
                                      .differentUserItemImageURL()!
                                      .contains('default')
                                  ? const AssetImage(
                                          'images/default_user_profile_picture.png')
                                      as ImageProvider
                                  : NetworkImage(
                                      controller.differentUserItemImageURL()!),
                            )),
                      ),
                      Text(
                        controller.differentUserUsername(),
                        // controller.differentUserUsername(),
                        style: MyTextStyles.poppins24w700,
                      ),
                      Text(
                        'Ocijeni koliko ste zadovoljni s korisnikom',
                        style: MyTextStyles.poppins16w400,
                      ),
                      SizedBox(
                        height: 20.h,
                      ),
                      RatingBar.builder(
                        glow: false,
                        itemSize: 40,
                        ignoreGestures: false,
                        initialRating: 0,
                        minRating: 1,
                        unratedColor: MyColors.grey,
                        direction: Axis.horizontal,
                        allowHalfRating: false,
                        itemCount: 5,
                        itemPadding:
                            const EdgeInsets.symmetric(horizontal: 4.0),
                        itemBuilder: (context, _) => const Icon(
                          Icons.star,
                          color: MyColors.orange,
                        ),
                        onRatingUpdate: (rating) {},
                      ),
                      SizedBox(
                        height: 20.h,
                      ),
                      SizedBox(
                        height: 128.h,
                        child: TextField(
                          onTap: () {
                            // FocusScope.of(context).requestFocus(controller.node2);
                          },
                          // focusNode: controller.node2,
                          maxLines: 12,
                          // controller: controller.itemDescriptionController,
                          textInputAction: TextInputAction.done,
                          decoration: InputDecoration(
                              enabledBorder: OutlineInputBorder(
                                borderSide: const BorderSide(
                                    width: 3, color: MyColors.grey),
                                borderRadius: BorderRadius.circular(30.0),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: const BorderSide(
                                    width: 3, color: MyColors.orange),
                                borderRadius: BorderRadius.circular(30.0),
                              ),
                              hintText: 'Dodatni komentar...'),
                        ),
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      GestureDetector(
                        onTap: () {
                          Get.offAllNamed(
                            MyRoutes.messagesPageScreen,
                          );
                        },
                        child: OutlinedColorButtonWidget(
                            buttonHeight: 50.h,
                            buttonText: 'Podnesi',
                            buttonWidth: double.infinity,
                            isOn: true),
                      ),
                      SizedBox(
                        height: 10.h,
                      ),
                      GestureDetector(
                        onTap: () {
                          Get.back();
                          Get.back();
                        },
                        child: OutlinedColorButtonWidget(
                            buttonHeight: 50.h,
                            buttonText: 'Odustani',
                            buttonWidth: double.infinity,
                            isOn: false),
                      ),
                      SizedBox(
                        height: 20.h,
                      ),
                    ],
                  )
                ],
              ),
            )),
      );
}

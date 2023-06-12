import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:this_4_that/add_item_pages/add_item_page_item_added.dart';
import 'package:this_4_that/constants/colors.dart';
import 'package:this_4_that/constants/strings.dart';
import 'package:this_4_that/constants/text_styles.dart';
import 'package:this_4_that/pages.dart';
import 'package:this_4_that/screens/main_page/main_page_controller.dart';
import 'package:this_4_that/widget/filled_color_button_widget.dart';
import 'package:this_4_that/widget/number_of_pages_indicator_widget.dart';
import 'package:this_4_that/widget/outlined_color_button_widget.dart';
import 'package:this_4_that/widget/overlapped_images_widget.dart';

class MatchedItemPage extends StatefulWidget {
  const MatchedItemPage({Key? key}) : super(key: key);

  @override
  State<MatchedItemPage> createState() => _MatchedItemPageState();
}

class _MatchedItemPageState extends State<MatchedItemPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
        ),
        body: Padding(
          padding: EdgeInsets.all(16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(height: 10),
                  Container(
                    width: 200.w,
                    child: Text(
                      'Vaša ponuda se poklapa!',
                      style: MyTextStyles.poppins24w700,
                      textAlign: TextAlign.center,
                    ),
                  ),
                  SizedBox(height: 30),
                  Container(
                    height: 200.h,
                    width: MediaQuery.of(context).size.width * 0.75,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Expanded(
                          child: OverlappedImagesWidget(
                            image1URL: Get.arguments.item1PictureURL,
                            image2URL: Get.arguments.item2PictureURL,
                            image1WidthHeight: 142,
                            image2WidthHeight: 190,
                            logoWidthHeight: 71,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    width: 270.w,
                    child: Text(
                      'Javite se korisniku ${Get.arguments.user2Username} i razmjenite predmete!',
                      textAlign: TextAlign.center,
                      style: MyTextStyles.poppins16w400,
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                ],
              ),
              Column(
                children: [
                  GestureDetector(
                    onTap: () {
                      Get.find<MainPageController>().currentIndex = 2;
                      Get.offNamed(MyRoutes.mainPageScreen);
                    },
                    child: OutlinedColorButtonWidget(
                        buttonHeight: 48.h,
                        buttonText: 'Pošalji poruku',
                        buttonWidth: MediaQuery.of(context).size.width,
                        isOn: true),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  GestureDetector(
                    onTap: () {
                      Get.back();
                    },
                    child: OutlinedColorButtonWidget(
                        buttonHeight: 48.h,
                        buttonText: 'Ne sada',
                        buttonWidth: MediaQuery.of(context).size.width,
                        isOn: false),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}

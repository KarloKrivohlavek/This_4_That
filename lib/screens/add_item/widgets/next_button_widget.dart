import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:this_4_that/constants/colors.dart';
import 'package:this_4_that/screens/add_item/add_item_page_controller.dart';
import 'package:this_4_that/screens/main_page/main_page_controller.dart';

Widget nextButton() {
  final addItemController = Get.find<AddItemPageController>();
  return Expanded(
    child: ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: MyColors.orange,
        foregroundColor: Colors.black,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
      ),
      child: const Padding(
        padding: EdgeInsets.all(16),
        child: Text(
          'Dalje',
          style: TextStyle(fontWeight: FontWeight.w400, fontSize: 16),
        ),
      ),
      onPressed: () {
        if (addItemController.activeStep == 4) {
          Get.find<MainPageController>().currentIndex = 0;
        }

        /// ACTIVE STEP MUST BE CHECKED FOR (dotCount - 1) AND NOT FOR dotCount To PREVENT Overflow ERROR.
        if (addItemController.activeStep < addItemController.dotCount - 1) {
          addItemController.activeStep++;
          addItemController.pageController
              .jumpToPage(addItemController.activeStep);
        }
      },
    ),
  );
}

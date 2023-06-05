import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:im_stepper/stepper.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:this_4_that/add_item_pages/add_item_page_item_added.dart';
import 'package:this_4_that/constants/colors.dart';
import 'package:this_4_that/constants/text_styles.dart';
import 'package:this_4_that/screens/add_item/widgets/next_button_widget.dart';
import 'package:this_4_that/screens/main_page/main_page_controller.dart';
import 'package:this_4_that/widget/filled_color_button_widget.dart';
import 'package:this_4_that/widget/number_of_pages_indicator_widget.dart';
import 'package:this_4_that/widget/outlined_color_button_widget.dart';

import '../../add_item_pages/add_item_page_1.dart';
import '../../add_item_pages/add_item_page_2.dart';
import '../../add_item_pages/add_item_page_3.dart';
import '../../add_item_pages/add_item_page_4.dart';
import '../../add_item_pages/add_item_page_5.dart';
import 'add_item_page_controller.dart';

///
/// This is a screen in which we write widgets concerning [HelloScreen]
///

class AddItemPageScreen extends GetView<AddItemPageController> {
  const AddItemPageScreen({super.key});

  @override
  Widget build(BuildContext context) => Obx(
        () => SafeArea(
          child: Scaffold(
            appBar: AppBar(
              leading: GestureDetector(
                  child: controller.activeStep > 0
                      ? GestureDetector(
                          onTap: () {
                            controller.activeStep--;
                            controller.pageController.jumpToPage(
                              (controller.pageController.page ?? 1).toInt() - 1,
                            );
                          },
                          child: Icon(
                            MdiIcons.arrowLeft,
                            color: MyColors.black,
                          ),
                        )
                      : Container()),
              backgroundColor: Colors.transparent,
              elevation: 0,
            ),
            resizeToAvoidBottomInset: false,
            body: Padding(
              padding: const EdgeInsets.all(8.0),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Container(
                      height: 5.h,
                      child: NumberOfPagesIndicator(
                          numberOfItems: controller.dotCount,
                          currentPosition: controller.activeStep),
                    ),
                    // DotStepper(
                    //   // direction: Axis.vertical,
                    //   dotCount: controller.dotCount,
                    //
                    //   /// THIS MUST BE SET. SEE HOW IT IS CHANGED IN NEXT/PREVIOUS BUTTONS AND JUMP BUTTONS.
                    //   activeStep: controller.activeStep,
                    //   shape: Shape.pipe,
                    //   spacing: 10,
                    //   indicator: Indicator.shift,
                    //
                    //   /// TAPPING WILL NOT FUNCTION PROPERLY WITHOUT THIS PIECE OF CODE.
                    //   onDotTapped: (tappedDotIndex) {
                    //     controller.activeStep = tappedDotIndex;
                    //   },
                    //
                    //   // DOT-STEPPER DECORATIONS
                    //   fixedDotDecoration: const FixedDotDecoration(
                    //     color: Colors.black,
                    //   ),
                    //
                    //   indicatorDecoration: const IndicatorDecoration(
                    //     // style: PaintingStyle.stroke,
                    //     strokeWidth: 0,
                    //     color: MyColors.orange,
                    //   ),
                    //   lineConnectorDecoration: const LineConnectorDecoration(
                    //     color: MyColors.grey,
                    //     strokeWidth: 0,
                    //   ),
                    // ),

                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.70,
                      child: PageView(
                        physics: const NeverScrollableScrollPhysics(),
                        controller: controller.pageController,
                        children: [
                          AddItemPage1(),
                          AddItemPage2(),
                          AddItemPage3(),
                          AddItemPage4(),
                          AddItemPage5(),
                        ],
                      ),
                    ),

                    /// Jump buttons.
                    // Padding(padding: const EdgeInsets.all(18.0), child: steps()),

                    // Next and Previous buttons.
                    // Row(
                    //   mainAxisAlignment: MainAxisAlignment.spaceAround,
                    //   children: [
                    //     // previousButton(),
                    //     nextButton()
                    //   ],
                    // ),
                    GestureDetector(
                      onTap: () {
                        // switch (controller.activeStep) {
                        //   case 1:
                        //     controller.itemNameIsEmpty
                        //         ? controller.saveItemName()
                        //         : () {};
                        //     break;
                        // }

                        if (controller.activeStep == 4) {
                          controller.saveSelectedIndexCondition();
                          controller.sendItemDataToFirebase();
                          Get.to(() => AddItemPageItemAdded());
                        }

                        /// ACTIVE STEP MUST BE CHECKED FOR (dotCount - 1) AND NOT FOR dotCount To PREVENT Overflow ERROR.
                        if (controller.activeStep < controller.dotCount - 1) {
                          if (controller.activeStep == 1) {
                            controller.saveItemName();
                            controller.saveItemDescription();
                          }

                          if (controller.activeStep == 3) {
                            controller.saveSelectedIndexPrice();
                          }

                          controller.activeStep++;
                          controller.pageController
                              .jumpToPage(controller.activeStep);
                        }
                        print(controller.itemNameIsEmpty);
                        print(controller.activeStep);
                      },
                      child: FilledColorButtonWidget(
                          buttonHeight: 50,
                          buttonText: 'Dalje',
                          buttonWidth: double.infinity,
                          isEnabled: controller.itemNameIsEmpty),
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      );
}

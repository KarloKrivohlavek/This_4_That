import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:im_stepper/stepper.dart';
import 'package:this_4_that/screens/add_item/widgets/next_button_widget.dart';

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
            resizeToAvoidBottomInset: false,
            body: Padding(
              padding: const EdgeInsets.all(8.0),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    DotStepper(
                      // direction: Axis.vertical,
                      dotCount: controller.dotCount,

                      /// THIS MUST BE SET. SEE HOW IT IS CHANGED IN NEXT/PREVIOUS BUTTONS AND JUMP BUTTONS.
                      activeStep: controller.activeStep,
                      shape: Shape.pipe,
                      spacing: 10,
                      indicator: Indicator.shift,

                      /// TAPPING WILL NOT FUNCTION PROPERLY WITHOUT THIS PIECE OF CODE.
                      onDotTapped: (tappedDotIndex) {
                        controller.activeStep = tappedDotIndex;
                      },

                      // DOT-STEPPER DECORATIONS
                      fixedDotDecoration: const FixedDotDecoration(
                        color: Colors.black,
                      ),

                      indicatorDecoration: const IndicatorDecoration(
                        // style: PaintingStyle.stroke,
                        strokeWidth: 0,
                        color: Colors.orange,
                      ),
                      lineConnectorDecoration: const LineConnectorDecoration(
                        color: Colors.blue,
                        strokeWidth: 0,
                      ),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.70,
                      child: PageView(
                        physics: const NeverScrollableScrollPhysics(),
                        controller: controller.pageController,
                        children: [
                          const AddItemPage1(),
                          AddItemPage2(),
                          AddItemPage3(),
                          const AddItemPage4(),
                          const AddItemPage5(),
                        ],
                      ),
                    ),

                    /// Jump buttons.
                    // Padding(padding: const EdgeInsets.all(18.0), child: steps()),

                    // Next and Previous buttons.
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        // previousButton(),
                        nextButton()
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      );
}

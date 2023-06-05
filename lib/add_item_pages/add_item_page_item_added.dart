import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:this_4_that/constants/colors.dart';
import 'package:this_4_that/constants/strings.dart';
import 'package:this_4_that/constants/text_styles.dart';
import 'package:this_4_that/screens/add_item/add_item_page_controller.dart';
import 'package:this_4_that/screens/home/home_page_screen.dart';
import 'package:this_4_that/screens/main_page/main_page_controller.dart';
import 'package:this_4_that/screens/main_page/main_page_screen.dart';
import 'package:this_4_that/widget/filled_color_button_widget.dart';
import 'package:this_4_that/widget/number_of_pages_indicator_widget.dart';
import 'package:this_4_that/widget/outlined_color_button_widget.dart';

class AddItemPageItemAdded extends GetView<AddItemPageController> {
  const AddItemPageItemAdded({Key? key}) : super(key: key);

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
                  Icon(
                    MdiIcons.checkCircleOutline,
                    size: 300,
                    color: MyColors.orange,
                  ),
                  Text(
                    'Oglas je objavljen!',
                    style: MyTextStyles.poppins24w700,
                  ),
                  SizedBox(height: 10),
                  Container(
                    width: 300.w,
                    child: Text(
                      'Vaš oglas je sada vidljiv i dostupan drugim korisnicima!',
                      style: MyTextStyles.poppins16w400,
                      textAlign: TextAlign.center,
                    ),
                  ),
                  SizedBox(height: 10),
                  const SizedBox(
                    height: 20,
                  ),
                ],
              ),
              Column(
                children: [
                  GestureDetector(
                    onTap: () {
                      Get.find<MainPageController>().currentIndex = 0;
                      Get.to(MainPageScreen());
                    },
                    child: OutlinedColorButtonWidget(
                        buttonHeight: 48.h,
                        buttonText: 'Nastavi s oglasima u Zagrebu',
                        buttonWidth: MediaQuery.of(context).size.width,
                        isOn: true),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  OutlinedColorButtonWidget(
                      buttonHeight: 48.h,
                      buttonText: 'Preporuka drugog grada',
                      buttonWidth: MediaQuery.of(context).size.width,
                      isOn: false),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}

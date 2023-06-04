import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:this_4_that/authentification_screens/authentification_controller.dart';
import 'package:this_4_that/authentification_screens/authentification_screen_6_location.dart';
import 'package:this_4_that/constants/colors.dart';
import 'package:this_4_that/constants/strings.dart';
import 'package:this_4_that/constants/text_styles.dart';
import 'package:this_4_that/widget/filled_color_button_widget.dart';
import 'package:this_4_that/widget/number_of_pages_indicator_widget.dart';

class AuthentificationScreen5Description
    extends GetView<AuthentificationController> {
  const AuthentificationScreen5Description({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: true,
        appBar: AppBar(
          leading: BackButton(
            color: MyColors.black,
            onPressed: () {
              Get.back();
            },
          ),
          backgroundColor: Colors.transparent,
          elevation: 0,
        ),
        body: Padding(
          padding: EdgeInsets.only(left: 16, right: 16, bottom: 16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    height: 10,
                    child: NumberOfPagesIndicator(
                      numberOfItems: 5,
                      currentPosition: 3,
                    ),
                  ),
                  SizedBox(height: 10),
                  Text(
                    'Reci nam nešto o sebi',
                    style: MyTextStyles.poppins40w700,
                  ),
                  SizedBox(height: 10),
                  Text(
                    'Ovo će biti prikazano javno na profilu',
                    style: MyTextStyles.poppins16w400,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  SizedBox(
                    height: 120.h,
                    child: TextField(
                      style: MyTextStyles.poppins16w400,
                      maxLength: 120,
                      // onTap: () {
                      //   FocusScope.of(context).requestFocus(node2);
                      // },
                      // focusNode: node2,
                      controller: controller.descriptionController,
                      maxLines: 12,
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
                          hintText: 'Opis profila'),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                ],
              ),
              GestureDetector(
                  onTap: () {
                    // Navigator.push(
                    //   context,
                    //   MaterialPageRoute(
                    //       builder: (context) =>
                    //           const AuthentificationScreen6Location()),
                    // );

                    controller.descriptionIsEmpty
                        ? controller.saveDescription()
                        : () {};
                  },
                  child: Obx(
                    () => FilledColorButtonWidget(
                        buttonHeight: 48.w,
                        buttonText: 'Dalje',
                        buttonWidth: MediaQuery.of(context).size.width,
                        isEnabled: controller.descriptionIsEmpty),
                  ))
            ],
          ),
        ),
      ),
    );
  }
}

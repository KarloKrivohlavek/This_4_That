import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:this_4_that/constants/colors.dart';
import 'package:this_4_that/constants/text_styles.dart';
import 'package:this_4_that/pages.dart';
import 'package:this_4_that/screens/add_item_page_0/add_item_page_0_controller.dart';
import 'package:this_4_that/widget/number_of_pages_indicator_widget.dart';
import 'package:this_4_that/widget/outlined_color_button_widget.dart';

class AddItemPage0 extends GetView<AddItemPage0Controller> {
  const AddItemPage0({Key? key}) : super(key: key);

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
          padding: const EdgeInsets.all(16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 10,
                    child: NumberOfPagesIndicator(
                      numberOfItems: 5,
                      currentPosition: 0,
                    ),
                  ),
                  const SizedBox(height: 20),
                  Row(
                    children: [
                      Text(
                        'Dobrodošao ',
                        style: MyTextStyles.poppins24w700,
                      ),
                      Obx(
                        () => Text(
                          controller.userNickname,
                          style: GoogleFonts.poppins(
                              fontSize: 24,
                              fontWeight: FontWeight.w700,
                              color: MyColors.orange),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  Text(
                    'Započnimo s razmjenom!',
                    style: MyTextStyles.poppins40w700,
                  ),
                  const SizedBox(height: 10),
                  Text(
                    'Možeš preskočiti zasad ali bez objavljenog oglasa ne možemo te spajati sa drugim ljudima. .',
                    style: MyTextStyles.poppins16w400,
                  ),
                  const SizedBox(height: 70),
                  const SizedBox(
                    height: 20,
                  ),
                ],
              ),
              Column(
                children: [
                  GestureDetector(
                    onTap: () {
                      Get.offAllNamed(MyRoutes.addItemPageScreen,
                          arguments: {'advertType': 'first'});
                    },
                    child: OutlinedColorButtonWidget(
                        buttonHeight: 48.h,
                        buttonText: 'Dodaj oglas',
                        buttonWidth: MediaQuery.of(context).size.width,
                        isOn: true),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  GestureDetector(
                    onTap: () {
                      Get.offAllNamed(MyRoutes.mainPageScreen);
                    },
                    child: OutlinedColorButtonWidget(
                        buttonHeight: 48.h,
                        buttonText: 'Preskoči',
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

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:this_4_that/authentification_screens/authentification_controller.dart';
import 'package:this_4_that/authentification_screens/authentification_screen_3_username.dart';
import 'package:this_4_that/constants/colors.dart';
import 'package:this_4_that/constants/strings.dart';
import 'package:this_4_that/constants/text_styles.dart';
import 'package:this_4_that/widget/filled_color_button_widget.dart';
import 'package:this_4_that/widget/number_of_pages_indicator_widget.dart';

class AuthentificationScreen2NameSurname
    extends GetView<AuthentificationController> {
  AuthentificationScreen2NameSurname({Key? key}) : super(key: key);

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
                      currentPosition: 0,
                    ),
                  ),
                  SizedBox(height: 10.h),
                  Text(
                    'Kako se zoveš?',
                    style: MyTextStyles.poppins40w700,
                  ),
                  SizedBox(height: 10.h),
                  Text(
                    'Ovo nećeš moći mijenjati, ali se neće prikazivati javno na profilu.',
                    style: MyTextStyles.poppins16w400,
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  TextField(
                    style: MyTextStyles.poppins16w400,
                    maxLength: 40,
                    controller: controller.firstAndLastNameController,
                    decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                        borderSide:
                            const BorderSide(width: 3, color: MyColors.grey),
                        borderRadius: BorderRadius.circular(50.0),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide:
                            const BorderSide(width: 3, color: MyColors.orange),
                        borderRadius: BorderRadius.circular(50.0),
                      ),
                      hintText: 'Ime i prezime',
                      // suffixIcon: titleController.text.isEmpty
                      //     ? Container(
                      //         width: 0,
                      //       )
                      //     : IconButton(
                      //         icon: const Icon(
                      //           Icons.close,
                      //           color: MyColors.grey,
                      //         ),
                      //         onPressed: () {
                      //           titleController.clear();
                      //         },
                      //       )
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
                  //           const AuthentificationScreen3Username()),
                  // );
                  controller.firstAndLastNameIsEmpty
                      ? controller.saveFirstNameAndLastName()
                      : () {};
                },
                child: Obx(
                  () => FilledColorButtonWidget(
                      buttonHeight: 48.w,
                      buttonText: 'Dalje',
                      buttonWidth: MediaQuery.of(context).size.width,
                      isEnabled: controller.firstAndLastNameIsEmpty),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:this_4_that/pages.dart';
import 'package:this_4_that/authentification_screens/authentification_controller.dart';
import 'package:this_4_that/constants/colors.dart';
import 'package:this_4_that/constants/text_styles.dart';
import 'package:this_4_that/widget/number_of_pages_indicator_widget.dart';
import 'package:this_4_that/widget/outlined_color_button_widget.dart';

class AuthentificationScreen6Location
    extends GetView<AuthentificationController> {
  const AuthentificationScreen6Location({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          leading: BackButton(
            color: MyColors.black,
            onPressed: () {
              Get.back();
            },
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.only(left: 16, right: 16, bottom: 16),
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
                      currentPosition: 4,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    'Hello Zagreb!',
                    style: MyTextStyles.poppins40w700,
                  ),
                  const SizedBox(height: 10),
                  Text(
                    'Trenutno smo samo u Zagrebu. Trudimo se doći i u druge gradove. Da bismo znali gdje, treba nam tvoja preporuka.',
                    style: MyTextStyles.poppins16w400,
                  ),
                  const SizedBox(height: 70),
                  Center(
                    child: Image.asset(
                      'images/katedrala.png',
                      width: 140.w,
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
                      // Navigator.push(
                      //   context,
                      //   MaterialPageRoute(builder: (context) => AddItemPage0()),
                      // );
                      controller.saveLocation();
                      controller.saveUserDataToFirebase();
                      Get.offAllNamed(MyRoutes.addItemPage0);
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
                  // GestureDetector(
                  //   onTap: () {
                  //     Navigator.push(
                  //       context,
                  //       MaterialPageRoute(
                  //           builder: (context) => MatchedItemPage()),
                  //     );
                  //   },
                  //   child: OutlinedColorButtonWidget(
                  //       buttonHeight: 48.h,
                  //       buttonText: 'Preporuka drugog grada',
                  //       buttonWidth: MediaQuery.of(context).size.width,
                  //       isOn: false),
                  // ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}

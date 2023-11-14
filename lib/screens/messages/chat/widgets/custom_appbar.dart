import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:this_4_that/constants/colors.dart';
import 'package:this_4_that/constants/text_styles.dart';
import 'package:this_4_that/pages.dart';
import 'package:this_4_that/widget/custom_dialog.dart';
import 'package:this_4_that/widget/overlapped_images_widget.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({
    Key? key,
    required this.image1,
    required this.image2,
    required this.differentUsername,
  }) : super(key: key);

  final String image1;
  final String image2;
  final String differentUsername;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80.h,
      color: Colors.transparent,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          BackButton(
            onPressed: () {
              Get.back();
            },
          ),
          SizedBox(
            width: Get.width * 0.3,
            child: OverlappedImagesWidget(
                image1WidthHeight: 48,
                image2WidthHeight: 64,
                logoWidthHeight: 32,
                position1: 0,
                position3: 25,
                position2: 30,
                image1URL: image1,
                image2URL: image2),
          ),
          Text(
            differentUsername,
            style: MyTextStyles.poppins24w700,
          ),
          // GestureDetector(
          //   onTap: () {
          //     Get.dialog(CustomDialog(
          //         title: 'Potvrda razmjene',
          //         text:
          //             'Jeste li sigurni da želite potvrditi razmjenu? Nakon potvrde, vaš predmet će biti uklonjen s popisa dostupnih predmeta i više se neće prikazivati drugim korisnicima aplikacije.',
          //         button1: 'Potvrdi',
          //         button2: 'Odustani',
          //         action: () {
          //           Get.toNamed(
          //             MyRoutes.tradeConfirmationScreen,
          //           );
          //         }));
          //   },
          //   child: Container(
          //     margin: EdgeInsets.only(left: 30),
          //     height: 24,
          //     width: 24,
          //     decoration: BoxDecoration(
          //       color: MyColors.green,
          //       shape: BoxShape.circle,
          //     ),
          //     child: Icon(
          //       Icons.check,
          //       color: MyColors.white,
          //     ),
          //   ),
          // )
        ],
      ),
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => const Size(double.infinity, 200);
}

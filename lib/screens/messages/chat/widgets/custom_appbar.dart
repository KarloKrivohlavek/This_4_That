import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:this_4_that/constants/text_styles.dart';
import 'package:this_4_that/widget/overlapped_images_widget.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar(
      {Key? key,
      required this.image1,
      required this.image2,
      required this.differentUsername})
      : super(key: key);

  final String image1;
  final String image2;
  final String differentUsername;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
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
          )
        ],
      ),
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => const Size(double.infinity, 200);
}

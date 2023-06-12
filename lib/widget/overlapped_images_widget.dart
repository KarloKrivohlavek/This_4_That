import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:this_4_that/constants/colors.dart';

class OverlappedImagesWidget extends StatelessWidget {
  const OverlappedImagesWidget(
      {super.key,
      required this.image1WidthHeight,
      required this.image2WidthHeight,
      required this.logoWidthHeight,
      required this.image1URL,
      required this.image2URL});

  final String image1URL;
  final String image2URL;
  final double? image1WidthHeight;
  final double? image2WidthHeight;
  final double? logoWidthHeight;
  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        Positioned(
          left: 0,
          child: Container(
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              image: DecorationImage(
                fit: BoxFit.cover,
                image: NetworkImage(image1URL),
              ),
            ),
            width: image1WidthHeight,
            height: image1WidthHeight,
          ),
        ),
        Positioned(
          left: 100,
          child: Container(
            decoration: BoxDecoration(
              border: Border.all(
                color: Colors.white,
                width: 5,
              ),
              shape: BoxShape.circle,
              image: DecorationImage(
                fit: BoxFit.cover,
                image: NetworkImage(image2URL),
              ),
            ),
            width: image2WidthHeight,
            height: image2WidthHeight,
          ),
        ),
        Positioned(
          left: 75,
          child: Container(
            child: SizedBox(
              width: logoWidthHeight,
              height: logoWidthHeight,
              child: Image.asset(
                'images/logo.png',
              ),
            ),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: MyColors.orange,
            ),
            width: logoWidthHeight,
            height: logoWidthHeight,
            padding: EdgeInsets.all(5),
          ),
        ),
      ],
    );
  }
}

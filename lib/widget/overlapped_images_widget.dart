
import 'package:flutter/material.dart';
import 'package:this_4_that/constants/colors.dart';

class OverlappedImagesWidget extends StatelessWidget {
  const OverlappedImagesWidget(
      {super.key,
      required this.image1WidthHeight,
      required this.image2WidthHeight,
      required this.logoWidthHeight,
      required this.image1URL,
      required this.image2URL,
      this.position1 = 0,
      this.position2 = 100,
      this.position3 = 75});

  final String image1URL;
  final String image2URL;
  final double? image1WidthHeight;
  final double? image2WidthHeight;
  final double? logoWidthHeight;

  final double position1;
  final double position2;
  final double position3;

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        Positioned(
          left: position1,
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
          left: position2,
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
          left: position3,
          child: Container(
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              color: MyColors.orange,
            ),
            width: logoWidthHeight,
            height: logoWidthHeight,
            padding: const EdgeInsets.all(5),
            child: SizedBox(
              width: logoWidthHeight,
              height: logoWidthHeight,
              child: Image.asset(
                'images/logo.png',
              ),
            ),
          ),
        ),
      ],
    );
  }
}

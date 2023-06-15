import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:this_4_that/constants/text_styles.dart';
import 'package:this_4_that/different_user_profile_page_preview.dart';

class SwappablePageDifferentUserPreview extends StatelessWidget {
  SwappablePageDifferentUserPreview({
    super.key,
    required this.userProfileName,
    required this.userProfileRating,
    this.userProfilePicture,
  });

  String userProfileName;
  double userProfileRating;
  String? userProfilePicture;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: 100.w,
          height: 100.h,
          decoration: BoxDecoration(
              shape: BoxShape.circle,
              image: DecorationImage(
                image: userProfilePicture!.contains('default')
                    ? AssetImage('images/default_user_profile_picture.png')
                        as ImageProvider
                    : NetworkImage(userProfilePicture!),
              )),
        ),
        Container(
          margin: EdgeInsets.only(left: 10, right: 10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 15.h,
              ),
              Container(
                width: 150.w,
                child: Text(
                  userProfileName,
                  style: GoogleFonts.poppins(
                    fontSize: 14,
                    fontWeight: FontWeight.w700,
                  ),
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                ),
              ),
              Row(
                children: [
                  Text(
                    userProfileRating.toString(),
                    style: GoogleFonts.poppins(
                      fontSize: 24,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  RatingBar.builder(
                    itemSize: 25,
                    ignoreGestures: true,
                    initialRating: userProfileRating,
                    minRating: 1,
                    direction: Axis.horizontal,
                    allowHalfRating: true,
                    itemCount: 5,
                    itemPadding: const EdgeInsets.symmetric(horizontal: 4.0),
                    itemBuilder: (context, _) => const Icon(
                      Icons.star,
                      color: Colors.amber,
                    ),
                    onRatingUpdate: (rating) {},
                  ),
                ],
              )
            ],
          ),
        )
      ],
    );
  }
}

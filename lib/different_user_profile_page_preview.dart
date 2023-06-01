import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:this_4_that/constants/colors.dart';
import 'package:this_4_that/constants/text_styles.dart';

class DifferentUserProfilePagePreview extends StatefulWidget {
  const DifferentUserProfilePagePreview({
    super.key,
  });

  @override
  State<DifferentUserProfilePagePreview> createState() =>
      _DifferentUserProfilePagePreviewState();
}

class _DifferentUserProfilePagePreviewState
    extends State<DifferentUserProfilePagePreview> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          appBar: AppBar(
            leading: GestureDetector(
              onTap: () {
                Get.back();
              },
              child: Icon(
                MdiIcons.arrowLeft,
                color: MyColors.black,
              ),
            ),
            backgroundColor: Colors.transparent,
            elevation: 0,
          ),
          backgroundColor: MyColors.white,
          body: Padding(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: Column(
                    children: [
                      Container(
                        height: 160.h,
                        width: 160.w,
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            image: DecorationImage(
                              image: AssetImage(
                                  'images/default_user_profile_picture.png'),
                            )),
                      ),
                      SizedBox(
                        height: 20.h,
                      ),
                      Container(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              child: Text(
                                'Username,',
                                style: MyTextStyles.poppins24w700,
                                textAlign: TextAlign.center,
                              ),
                            ),
                            Container(
                              child: Text(
                                '21-Godine',
                                style: MyTextStyles.poppins24w400,
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Row(
                  children: [
                    Icon(MdiIcons.mapMarker),
                    Text(
                      'Grad korisnika',
                      style: MyTextStyles.poppins16w400,
                    )
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                Text(
                  'O meni',
                  style: MyTextStyles.poppins24w700,
                ),
                Text(
                  'Tekst povezan s korisnikom lorem ipsum Studiram medicinu i volim računala. Veliki sam fan Marvela pa se javite',
                  style: MyTextStyles.poppins16w400,
                ),
                SizedBox(
                  height: 20,
                ),
                Text(
                  'Recenzije korisnika',
                  style: MyTextStyles.poppins24w700,
                ),
              ],
            ),
          )),
    );
  }
}

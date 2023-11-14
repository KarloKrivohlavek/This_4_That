import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:this_4_that/constants/colors.dart';
import 'package:this_4_that/constants/text_styles.dart';
import 'package:this_4_that/screens/home/widgets/different_user_profile_page_preview.dart';
import 'package:this_4_that/models/swipe_item/swipe_item.dart';
import 'package:this_4_that/screens/home/widgets/swappable_page_different_user_profile_preview.dart';

import 'package:shadow_overlay/shadow_overlay.dart';

// ignore: must_be_immutable
class SwappablePage extends StatefulWidget {
  SwappablePage({
    super.key,
    required this.item,
  });

  SwipeItem item;

  @override
  State<SwappablePage> createState() => _SwappablePageState();
}

class _SwappablePageState extends State<SwappablePage> {
  int currentPosition = 0;
  static final customCacheManager = CacheManager(Config(
    'customCacheKey',
    maxNrOfCacheObjects: 150,
  ));

  @override
  Widget build(BuildContext context) => Container(
        padding: const EdgeInsets.all(0),
        decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(20)),
        child: Scaffold(
          backgroundColor: Colors.transparent,
          body: Padding(
            padding: const EdgeInsets.all(4),
            child: SingleChildScrollView(
              child: Stack(
                children: [
                  GestureDetector(
                    onTapDown: (tapDetails) {
                      if (tapDetails.localPosition.dx >
                          MediaQuery.of(context).size.width / 2) {
                        if (currentPosition >=
                            widget.item.itemPictureList.length - 1) {
                          setState(() {
                            currentPosition =
                                widget.item.itemPictureList.length - 1;
                          });
                        } else {
                          setState(() {
                            currentPosition++;
                          });
                        }
                      } else {
                        if (currentPosition <= 0) {
                          setState(() {
                            currentPosition = 0;
                          });
                        } else {
                          setState(() {
                            currentPosition--;
                          });
                        }
                      }
                    },
                    child: SizedBox(
                      height: 800,
                      child: PageView.builder(
                        physics: const NeverScrollableScrollPhysics(),
                        onPageChanged: (value) {
                          setState(() => currentPosition = value);
                        },
                        itemCount: widget.item.itemPictureList.length,
                        itemBuilder: (context, index) => Padding(
                          padding: const EdgeInsets.only(top: 0),
                          child: Column(
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(
                                      20.0), // Adjust the radius as needed
                                  topRight: Radius.circular(
                                      20.0), // Adjust the radius as needed
                                ),
                                child: ShaderMask(
                                  shaderCallback: (rect) {
                                    return const LinearGradient(
                                      begin: Alignment.center,
                                      end: Alignment.bottomCenter,
                                      colors: [
                                        Colors.black,
                                        Colors.transparent
                                      ],
                                    ).createShader(Rect.fromLTRB(
                                        0, 0, rect.width, rect.height));
                                  },
                                  blendMode: BlendMode.dstIn,
                                  child: CachedNetworkImage(
                                    cacheManager: customCacheManager,
                                    imageUrl: widget
                                        .item.itemPictureList[currentPosition],
                                    height: 400,
                                    width: double.infinity,
                                    fit: BoxFit.cover,
                                    placeholder: (context, url) =>
                                        SpinKitChasingDots(
                                      color: MyColors.orange,
                                    ),
                                    errorWidget: (context, url, error) =>
                                        Icon(Icons.error),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  widget.item.userName.isEmpty
                      ? SizedBox(
                          child: Center(
                            child: Text(
                              'Učitavanje',
                              style: MyTextStyles.poppins40w700,
                            ),
                          ),
                        )
                      : const SizedBox(),
                  Container(
                    margin: const EdgeInsets.only(top: 350),
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    width: MediaQuery.of(context).size.width,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Row(children: [
                          Text(
                            widget.item.itemName,
                            style: const TextStyle(
                                fontSize: 24,
                                fontWeight: FontWeight.w700,
                                overflow: TextOverflow.ellipsis),
                            textAlign: TextAlign.left,
                          ),
                        ]),
                        const SizedBox(
                          height: 20,
                        ),
                        Row(
                          children: [
                            widget.item.userName.isEmpty
                                ? const SizedBox()
                                : const Icon(Icons.location_pin),
                            Text(
                              widget.item.location,
                              style: const TextStyle(fontSize: 16),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            widget.item.userName.isEmpty
                                ? const SizedBox()
                                : const Icon(Icons.search),
                            Text(
                              widget.item.condition[0]!,
                              style: const TextStyle(fontSize: 16),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 130,
                        ),
                        Row(
                          children: [
                            widget.item.userName.isEmpty
                                ? const SizedBox()
                                : const Text(
                                    'O predmetu',
                                    style: TextStyle(
                                      fontSize: 25,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  )
                          ],
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Row(
                          children: [
                            SizedBox(
                              width: MediaQuery.of(context).size.width * 0.85,
                              child: Text(
                                widget.item.itemDescription,
                                style: const TextStyle(fontSize: 20),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Row(
                          children: [
                            widget.item.userName.isEmpty
                                ? const SizedBox()
                                : const Text(
                                    'Tko mijenja?',
                                    style: TextStyle(
                                      fontSize: 25,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  )
                          ],
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      DifferentUserProfilePagePreview(
                                        userProfilePicture:
                                            widget.item.userPictureURL,
                                        userProfileName: widget.item.userName,
                                        userProfileDescription:
                                            widget.item.userDescription,
                                        location: widget.item.location,
                                        userAge: widget.item.userDateOfBirth,
                                      )),
                            );
                          },
                          child: widget.item.userName.isEmpty
                              ? const SizedBox()
                              : SwappablePageDifferentUserPreview(
                                  userProfileName: widget.item.userName,
                                  userProfileRating: 5,
                                  userProfilePicture:
                                      widget.item.userPictureURL,
                                ),
                        ),
                        const SizedBox(
                          height: 100,
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 10),
                    child: Center(
                      child: SizedBox(
                        height: 5,
                        child:

                            /// Dots indicator:
                            ListView.builder(
                                shrinkWrap: true,
                                physics: const NeverScrollableScrollPhysics(),
                                scrollDirection: Axis.horizontal,
                                itemCount: widget.item.itemPictureList.length,
                                itemBuilder: (context, index) {
                                  return Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 5),
                                    child: Container(
                                      width: (MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              0.8) /
                                          widget.item.itemPictureList.length,
                                      height: 50,
                                      decoration: BoxDecoration(
                                          borderRadius: const BorderRadius.all(
                                              Radius.circular(5)),
                                          color: currentPosition == index
                                              ? Colors.black
                                              : Colors.white),
                                    ),
                                  );
                                }),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      );
}

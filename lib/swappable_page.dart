import 'package:flutter/material.dart';
import 'package:this_4_that/constants/text_styles.dart';
import 'package:this_4_that/different_user_profile_page_preview.dart';
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
                              ShadowOverlay(
                                shadowHeight: 150,
                                shadowWidth: MediaQuery.of(context).size.width,
                                child: Container(
                                  margin: const EdgeInsets.only(bottom: 20),
                                  height: 400,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                    image: DecorationImage(
                                      image: NetworkImage(widget.item
                                          .itemPictureList[currentPosition]),
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                  // width: MediaQuery.of(context).size.width,
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
                    margin: const EdgeInsets.only(top: 300),
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
                            ),
                            textAlign: TextAlign.left,
                          ),
                        ]),
                        const SizedBox(
                          height: 10,
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
                              widget.item.condition,
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
                                            widget.item.itemDescription,
                                        location: widget.item.location,
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

import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';
import 'package:this_4_that/different_user_profile_page_preview.dart';
import 'package:this_4_that/screens/home/widgets/swappable_page_different_user_profile_preview.dart';

import 'package:this_4_that/swappable_item.dart';
import 'package:shadow_overlay/shadow_overlay.dart';

// ignore: must_be_immutable
class SwappablePage extends StatefulWidget {
  SwappablePage({
    super.key,
    required this.item,
  });

  SwapItem item;

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
                            widget.item.imagesURLs.length - 1) {
                          setState(() {
                            currentPosition = widget.item.imagesURLs.length - 1;
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
                        itemCount: widget.item.imagesURLs.length,
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
                                      image: AssetImage(widget
                                          .item.imagesURLs[currentPosition]),
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
                  Container(
                    margin: EdgeInsets.only(top: 300),
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    width: MediaQuery.of(context).size.width,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Row(children: [
                          Text(
                            widget.item.title,
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
                            const Icon(Icons.location_pin),
                            Text(
                              widget.item.location,
                              style: const TextStyle(fontSize: 16),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            const Icon(Icons.cake),
                            Text(
                              widget.item.age,
                              style: const TextStyle(fontSize: 16),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            const Icon(Icons.search),
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
                          children: const [
                            Text(
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
                                widget.item.description,
                                style: const TextStyle(fontSize: 20),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Row(
                          children: const [
                            Text(
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
                                      DifferentUserProfilePagePreview()),
                            );
                          },
                          child: SwappablePageDifferentUserPreview(
                            userProfileName: widget.item.userName,
                            userProfileRating: widget.item.rating,
                            userProfilePicture: widget.item.userProfilePicture,
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
                                itemCount: widget.item.imagesURLs.length,
                                itemBuilder: (context, index) {
                                  return Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 5),
                                    child: Container(
                                      width:
                                          (MediaQuery.of(context).size.width *
                                                  0.8) /
                                              widget.item.imagesURLs.length,
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

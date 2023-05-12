import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:this_4_that/swappable_item.dart';
import 'package:shadow_overlay/shadow_overlay.dart';
import 'package:this_4_that/home_page.dart';

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
        margin: const EdgeInsets.only(top: 0),
        decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(20)),
        child: Scaffold(
          body: SingleChildScrollView(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(4),
                  child: Stack(
                    children: [
                      GestureDetector(
                        onTapDown: (tapDetails) {
                          if (tapDetails.localPosition.dx >
                              MediaQuery.of(context).size.width / 2) {
                            if (currentPosition >=
                                widget.item.imagesURLs.length - 1) {
                              setState(() {
                                currentPosition =
                                    widget.item.imagesURLs.length - 1;
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
                          height: 1200,
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
                                    shadowWidth:
                                        MediaQuery.of(context).size.width,
                                    child: Container(
                                      margin: const EdgeInsets.only(bottom: 20),
                                      height: 400,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(20),
                                        image: DecorationImage(
                                          image: AssetImage(widget.item
                                              .imagesURLs[currentPosition]),
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
                      Positioned(
                        top: 370,
                        child: Container(
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
                                    width: MediaQuery.of(context).size.width *
                                        0.85,
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
                              Container(
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Container(
                                      margin: const EdgeInsets.only(left: 10),
                                      width: 80,
                                      height: 80,
                                      decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          image: DecorationImage(
                                            image: AssetImage(
                                                widget.item.userProfilePicture),
                                          )),
                                    ),
                                    Container(
                                      margin: const EdgeInsets.only(left: 10),
                                      child: Column(
                                        children: [
                                          Text(
                                            widget.item.userName,
                                            style: const TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 20,
                                            ),
                                          ),
                                          RatingBar.builder(
                                            ignoreGestures: true,
                                            initialRating: widget.item.rating,
                                            minRating: 1,
                                            direction: Axis.horizontal,
                                            allowHalfRating: true,
                                            itemCount: 5,
                                            itemPadding:
                                                const EdgeInsets.symmetric(
                                                    horizontal: 4.0),
                                            itemBuilder: (context, _) =>
                                                const Icon(
                                              Icons.star,
                                              color: Colors.amber,
                                            ),
                                            onRatingUpdate: (rating) {},
                                          )
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                            ],
                          ),
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
                                    physics:
                                        const NeverScrollableScrollPhysics(),
                                    scrollDirection: Axis.horizontal,
                                    itemCount: widget.item.imagesURLs.length,
                                    itemBuilder: (context, index) {
                                      return Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 5),
                                        child: Container(
                                          width: (MediaQuery.of(context)
                                                      .size
                                                      .width *
                                                  0.8) /
                                              widget.item.imagesURLs.length,
                                          height: 50,
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  const BorderRadius.all(
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
                )
              ],
            ),
          ),
        ),
      );
}

import 'package:flutter/material.dart';
import 'package:flutter_card_swiper/flutter_card_swiper.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:this_4_that/constants/colors.dart';
import 'package:this_4_that/screens/home/widgets/filter_widget_preview.dart';

import '../../widget/button_widget.dart';
import 'home_page_controller.dart';

///
/// This is a screen in which we write widgets concerning [HelloScreen]
///

class HomePageScreen extends GetView<HomePageController> {
  const HomePageScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(() => Scaffold(
        backgroundColor: MyColors.orange,
        body:

            /// Stack widget with two children:

            Stack(
          children: [
            /// Your item - when clicked it opens a dialog
            GestureDetector(
              onTap: () {
                showModalBottomSheet(
                    context: context,
                    builder: (context) {
                      return Wrap(
                        spacing: 40,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                padding: const EdgeInsets.only(
                                  left: 20,
                                  top: 20,
                                ),
                                child: const Text(
                                  'Koji predmet mijenjaš?',
                                  style: TextStyle(
                                      fontWeight: FontWeight.w700,
                                      fontSize: 16),
                                ),
                              ),
                              Container(
                                height: 300,
                                padding: const EdgeInsets.all(20),
                                child: GridView.builder(
                                  shrinkWrap: true,
                                  itemCount: controller.images.length,
                                  gridDelegate:
                                      const SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: 2,
                                    mainAxisSpacing: 15,
                                    crossAxisSpacing: 15,
                                  ),
                                  itemBuilder: (context, index) {
                                    return GestureDetector(
                                        onTap: () {
                                          controller.onContainerTapped(index);
                                        },
                                        child: Container(
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(20),
                                          ),
                                          child: Container(
                                            decoration: BoxDecoration(
                                                border: Border.all(
                                                    color: MyColors.orange,
                                                    width: 2.w)),
                                            child: Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                Expanded(
                                                  child: Container(
                                                    decoration: BoxDecoration(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              20),
                                                      image: DecorationImage(
                                                        fit: BoxFit.cover,
                                                        image: AssetImage(
                                                            controller.images[
                                                                index]['url']),
                                                      ),
                                                    ),
                                                  ),
                                                  // child: Image.asset(
                                                  //   _images[index]['url'],
                                                  //   fit: BoxFit.cover,
                                                  // ),
                                                ),
                                                Container(
                                                    padding:
                                                        const EdgeInsets.all(3),
                                                    child: Text(
                                                      controller.images[index]
                                                          ['name'],
                                                      style: const TextStyle(
                                                          fontSize: 16,
                                                          fontWeight:
                                                              FontWeight.w400),
                                                    ))
                                              ],
                                            ),
                                          ),
                                        ));
                                  },
                                ),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Expanded(
                                child: Padding(
                                  padding: const EdgeInsets.all(10),
                                  child: ButtonWidget(
                                      color: Colors.black,
                                      text: 'Primjeni',
                                      onClicked: () {
                                        Navigator.pop(context);
                                      }),
                                ),
                              ),
                            ],
                          )
                        ],
                      );
                    });
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    margin: const EdgeInsets.only(left: 16, right: 0, top: 30),
                    padding: const EdgeInsets.only(left: 0, right: 10),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(40)),
                    height: 60,
                    width: Get.width * 0.8,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Container(
                          margin: const EdgeInsets.only(top: 5, bottom: 5),
                          width: 75.w,
                          height: 75.h,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                                image: AssetImage(
                                  controller.images[
                                          controller.pendingImageIndex != -1
                                              ? controller.pendingImageIndex
                                              : controller.selectedImageIndex]
                                      ['url'],
                                ),
                                fit: BoxFit.fill),
                            shape: BoxShape.circle,
                          ),
                        ),
                        const SizedBox(width: 25),
                        SizedBox(
                          width: Get.width * 0.4,
                          child: Text(
                            controller.getSelectedImageName(),
                            style: const TextStyle(
                                fontWeight: FontWeight.w400, fontSize: 16),
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                        const SizedBox(width: 10),
                        const Icon(MdiIcons.arrowDown),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 30),
                    child: FloatingActionButton(
                        elevation: 0,
                        backgroundColor: Colors.transparent,
                        foregroundColor: Colors.black,
                        onPressed: () {
                          showModalBottomSheet(
                              context: context,
                              builder: (context) {
                                return Wrap(
                                  spacing: 40,
                                  children: [
                                    Container(
                                      padding: const EdgeInsets.all(20),
                                      child: Column(
                                        children: const [
                                          FilterWidgetPreview(
                                            filterType: 'Vrijednost',
                                            filterValue: '100 - 500€',
                                          ),
                                          FilterWidgetPreview(
                                            filterType: 'Stanje',
                                            filterValue: 'Vrlo dobro',
                                          ),
                                          FilterWidgetPreview(
                                            filterType: 'Udaljenost(km)',
                                            filterValue: '25',
                                          ),
                                          FilterWidgetPreview(
                                            filterType: 'Kategorija',
                                            filterValue: 'Uredski pribor',
                                          ),
                                        ],
                                      ),
                                    ),
                                    Row(
                                      children: [
                                        Expanded(
                                          child: Container(
                                            padding: const EdgeInsets.all(10),
                                            child: ButtonWidget(
                                              color: Colors.black,
                                              text: 'Primjeni',
                                              onClicked: () {
                                                Navigator.pop(context);
                                              },
                                            ),
                                          ),
                                        ),
                                      ],
                                    )
                                  ],
                                );
                              });
                        },
                        child: const Icon(Icons.settings)),
                  )
                ],
              ),
            ),

            /// Card swiper with the card pages with all other user's items
            controller.cards.isEmpty
                ? Column(
                    children: [
                      Expanded(
                        child: Container(
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          margin: const EdgeInsets.only(
                              top: 20, left: 10, right: 10),
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(20)),
                          child: Center(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              // mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.end,
                              // crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const SizedBox(
                                  height: 80,
                                ),
                                Container(
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: Colors.orange.shade100,
                                  ),
                                  child: const Icon(
                                    Icons.settings,
                                    size: 70,
                                    color: MyColors.orange,
                                  ),
                                ),
                                const SizedBox(
                                  height: 20,
                                ),
                                const Text(
                                  'To je sve za sad!',
                                  style: TextStyle(
                                      fontSize: 40,
                                      fontWeight: FontWeight.w700),
                                ),
                                const SizedBox(
                                  height: 20,
                                ),
                                const Text(
                                  'Pogledao si sve oglase svih korisnika u blizini. Promijeni filtere ili pokušaj kasnije.',
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w400),
                                ),
                                const SizedBox(
                                  height: 250,
                                ),
                                TextButton(
                                  onPressed: () {},
                                  child: (Container(
                                    width: Get.width * 0.85,
                                    height: Get.height * 0.06,
                                    decoration: BoxDecoration(
                                      color: MyColors.orange,
                                      borderRadius: BorderRadius.circular(56),
                                    ),
                                    child: const Center(
                                        child: Text(
                                      'Promijeni filter',
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontWeight: FontWeight.w400,
                                          fontSize: 16),
                                    )),
                                  )),
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  )
                : Padding(
                    padding: const EdgeInsets.only(top: 100),
                    child: CardSwiper(
                      controller: controller.cardswipercontroller,
                      cardsCount: controller.cards.length,
                      cardBuilder: (context, index) {
                        return controller.cards[index];
                      },
                      isVerticalSwipingEnabled: false,
                      onSwipe: controller.onSwipe,
                      onEnd: controller.onEnd,
                      numberOfCardsDisplayed: controller.numberOfCardsDisplayed,
                      padding: const EdgeInsets.only(
                        left: 15,
                        right: 15,
                      ),
                    ),
                  ),
          ],
        ),
        floatingActionButton: controller.cards.isEmpty
            ? const SizedBox()
            : Container(
                width: Get.size.width,
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: (Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: Get.size.width * 0.25,
                    ),
                    FloatingActionButton(
                      onPressed: () {
                        controller.cardswipercontroller.swipeLeft();
                      },
                      backgroundColor: Colors.redAccent,
                      child:
                          const Icon(MdiIcons.closeThick, color: Colors.black),
                    ),
                    SizedBox(
                      width: Get.size.width * 0.25,
                    ),
                    FloatingActionButton(
                      onPressed: () {
                        controller.cardswipercontroller.swipeRight();
                      },
                      backgroundColor: Colors.greenAccent,
                      child:
                          const Icon(MdiIcons.checkBold, color: Colors.black),
                    ),
                  ],
                )),
              )));
  }
}

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_card_swiper/flutter_card_swiper.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:this_4_that/constants/colors.dart';
import 'package:this_4_that/constants/text_styles.dart';
import 'package:this_4_that/screens/home/widgets/filterModalBottomSheet.dart';
import 'package:this_4_that/screens/home/widgets/filter_widget_preview.dart';
import 'package:this_4_that/screens/home/widgets/snappableBottomSheet.dart';
import 'package:this_4_that/screens/main_page/main_page_controller.dart';
import 'package:this_4_that/widget/filled_color_button_widget.dart';
import 'package:wtf_sliding_sheet/wtf_sliding_sheet.dart';

import '../../widget/button_widget.dart';
import 'home_page_controller.dart';

///
/// This is a screen in which we write widgets concerning [HelloScreen]
///

class HomePageScreen extends GetView<HomePageController> {
  HomePageScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      if (controller.isLoaderLoading) {
        return SpinKitChasingDots(color: MyColors.orange);
      } else {
        return Scaffold(
            backgroundColor: MyColors.orange,
            body:

                /// Stack widget with two children:

                controller.currentUserItems.isNotEmpty
                    ? Stack(
                        children: [
                          /// Your item - when clicked it opens a dialog

                          SnappableBottomSheet(
                            controller: controller,
                          ),

                          /// Card swiper with the card pages with all other user's items
                          controller.cards.isEmpty
                              ? Column(
                                  children: [
                                    /// ovo je to stajalo

                                    SnappableBottomSheet(
                                      controller: controller,
                                    ),
                                    Container(
                                      height: 500.h,
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 10),
                                      margin: const EdgeInsets.only(
                                          top: 10, left: 10, right: 10),
                                      decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius:
                                              BorderRadius.circular(20)),
                                      child: Center(
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
// mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment:
                                              MainAxisAlignment.end,
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
                                            const SizedBox(height: 200),
                                            TextButton(
                                              onPressed: () {},
                                              child: (Container(
                                                width: Get.width * 0.85,
                                                height: Get.height * 0.06,
                                                decoration: BoxDecoration(
                                                  color: MyColors.orange,
                                                  borderRadius:
                                                      BorderRadius.circular(56),
                                                ),
                                                child: const Center(
                                                    child: Text(
                                                  'Promijeni filter',
                                                  style: TextStyle(
                                                      color: Colors.black,
                                                      fontWeight:
                                                          FontWeight.w400,
                                                      fontSize: 16),
                                                )),
                                              )),
                                            )
                                          ],
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
                                    allowedSwipeDirection:
                                        AllowedSwipeDirection.symmetric(
                                            horizontal: true),
                                    onSwipe: controller.onSwipe,
                                    onEnd: controller.onEnd,
                                    numberOfCardsDisplayed:
                                        controller.cards.isEmpty
                                            ? 1
                                            : controller.numberOfCardsDisplayed,
                                    padding: const EdgeInsets.only(
                                      left: 15,
                                      right: 15,
                                    ),
                                  ),
                                ),
                        ],
                      )
                    : Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: MyColors.white,
                        ),
                        margin:
                            const EdgeInsets.only(top: 16, left: 16, right: 16),
                        padding: const EdgeInsets.all(16),
                        height: Get.height,
                        child: Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SizedBox(
                                    height: 180.h,
                                  ),
                                  Text(
                                    'Dodaj oglas!',
                                    style: MyTextStyles.poppins40w700,
                                  ),
                                  SizedBox(
                                    width: Get.width * 0.6,
                                    child: Text(
                                      'Moraš dodati oglas ili imati aktivan oglas kako bi ti mogli prikazivati oglase drugih korisnika.',
                                      style: MyTextStyles.poppins16w400,
                                    ),
                                  )
                                ],
                              ),
                              GestureDetector(
                                behavior: HitTestBehavior.translucent,
                                onTap: () {
                                  Get.find<MainPageController>().currentIndex =
                                      1;
                                },
                                child: FilledColorButtonWidget(
                                    buttonHeight: 50.h,
                                    buttonText: 'Dodaj oglas',
                                    buttonWidth: double.infinity,
                                    isEnabled: true),
                              )
                            ],
                          ),
                        ),
                      ),
            floatingActionButton: controller.cards.isEmpty ||
                    controller.cards.last.item.itemName.isEmpty ||
                    controller.currentUserItems.isEmpty
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
                          heroTag: 'swipeLeftButton',
                          onPressed: () {
                            controller.cardswipercontroller.swipeLeft();
                          },
                          backgroundColor: Colors.redAccent,
                          child: const Icon(MdiIcons.closeThick,
                              color: Colors.black),
                        ),
                        SizedBox(
                          width: Get.size.width * 0.25,
                        ),
                        FloatingActionButton(
                          heroTag: 'swipeRightButton',
                          onPressed: () {
                            controller.cardswipercontroller.swipeRight();
                          },
                          backgroundColor: Colors.greenAccent,
                          child: const Icon(MdiIcons.checkBold,
                              color: Colors.black),
                        ),
                      ],
                    )),
                  ));
      }
    });
  }
}

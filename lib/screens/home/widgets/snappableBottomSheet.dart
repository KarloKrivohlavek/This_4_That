import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:this_4_that/constants/colors.dart';
import 'package:this_4_that/constants/text_styles.dart';
import 'package:this_4_that/screens/home/home_page_controller.dart';
import 'package:this_4_that/screens/home/widgets/filterModalBottomSheet.dart';
import 'package:this_4_that/widget/filled_color_button_widget.dart';

class SnappableBottomSheet extends StatelessWidget {
  const SnappableBottomSheet({
    super.key,
    required this.controller,
  });

  final HomePageController controller;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        controller.modalBottomSheetItemIndex = controller.selectedItemIndex;
        showModalBottomSheet(
            isScrollControlled: true,
            shape: const RoundedRectangleBorder(
                borderRadius:
                    BorderRadius.vertical(top: Radius.circular(25.0))),
            context: context,
            builder: (context) {
              return Container(
                height: Get.height * 0.5,
                child: Material(
                  type: MaterialType.transparency,
                  child: Wrap(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Divider(
                            color: MyColors.orange,
                            thickness: 3,
                            indent: 150,
                            endIndent: 150,
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Container(
                            padding: const EdgeInsets.only(
                              left: 20,
                            ),
                            child: Text(
                              'Koji predmet mijenjaš?',
                              style: MyTextStyles.poppins24w700,
                            ),
                          ),
                          Container(
                            padding: const EdgeInsets.all(20),
                            child: Obx(
                              () => GridView.builder(
                                shrinkWrap: true,
                                itemCount: controller.currentUserItems.length,
                                gridDelegate:
                                    const SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 2,
                                  mainAxisSpacing: 15,
                                  crossAxisSpacing: 15,
                                ),
                                itemBuilder: (context, index) {
                                  return GestureDetector(
                                      onTap: () {
                                        controller.modalBottomSheetItemIndex =
                                            index;
                                      },
                                      child: Obx(
                                        () => Container(
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(20),
                                          ),
                                          child: Container(
                                            decoration: const BoxDecoration(),
                                            child: Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                Expanded(
                                                  child: Container(
                                                    decoration: BoxDecoration(
                                                      border: Border.all(
                                                          color: controller
                                                                      .modalBottomSheetItemIndex ==
                                                                  index
                                                              ? MyColors.orange
                                                              : Colors
                                                                  .transparent,
                                                          width: 4),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              20),
                                                      image: DecorationImage(
                                                        fit: BoxFit.cover,
                                                        image: CachedNetworkImageProvider(
                                                            controller
                                                                .currentUserItems
                                                                .elementAt(
                                                                    index)
                                                                .itemPictureList![0]),
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
                                                      controller
                                                          .currentUserItems
                                                          .elementAt(index)
                                                          .itemName,
                                                      style: MyTextStyles
                                                          .poppins16w400,
                                                    ))
                                              ],
                                            ),
                                          ),
                                        ),
                                      ));
                                },
                              ),
                            ),
                          ),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                            left: 16, right: 16, bottom: 16),
                        child: GestureDetector(
                          behavior: HitTestBehavior.translucent,
                          onTap: () {
                            controller.selectedItemIndex =
                                controller.modalBottomSheetItemIndex;
                            Get.back();
                          },
                          child: FilledColorButtonWidget(
                              buttonHeight: 50,
                              buttonText: 'Primijeni',
                              buttonWidth: double.infinity,
                              isEnabled: true),
                        ),
                      )
                    ],
                  ),
                ),
              );
            });
      },
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            margin: const EdgeInsets.only(left: 16, right: 0, top: 30),
            padding: const EdgeInsets.all(0),
            decoration: BoxDecoration(
                color: MyColors.white, borderRadius: BorderRadius.circular(40)),
            height: 60,
            width: Get.width * 0.8,
            child: Obx(
              () => Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(
                    child: Container(
                      // padding: EdgeInsets.only(left: 20),
                      margin: const EdgeInsets.only(left: 1, right: 20),
                      width: 50.w,
                      height: 50.h,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(120),
                          image: DecorationImage(
                              image: CachedNetworkImageProvider(controller
                                  .currentUserItems
                                  .elementAt(controller.selectedItemIndex)
                                  .itemPictureList![0]),
                              fit: BoxFit.fill),
                          border: Border.all(
                              style: BorderStyle.solid,
                              color: MyColors.white,
                              width: 3)
                          // shape: BoxShape.circle,
                          ),
                    ),
                  ),
                  // const SizedBox(width: 25),
                  SizedBox(
                    width: Get.width * 0.4,
                    child: Text(
                      controller.currentUserItems
                          .elementAt(controller.selectedItemIndex)
                          .itemName,
                      style: const TextStyle(
                          fontWeight: FontWeight.w400, fontSize: 16),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  const Icon(
                    MdiIcons.chevronDown,
                    size: 40,
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 30),
            child: FloatingActionButton(
                heroTag: 'filterButton',
                elevation: 0,
                backgroundColor: Colors.transparent,
                foregroundColor: MyColors.black,
                onPressed: () {
                  showModalBottomSheet(
                      context: context,
                      shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.vertical(
                          top: Radius.circular(20.0),
                        ),
                      ),
                      builder: (context) {
                        return filterModalBottomSheet(
                          controller: controller,
                        );
                      });
                },
                child: const Icon(MdiIcons.tuneVariant)),
          )
        ],
      ),
    );
  }
}

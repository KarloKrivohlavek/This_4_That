// import 'package:flutter/material.dart';
// import 'package:flutter_card_swiper/flutter_card_swiper.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:get/get.dart';
// import 'package:get_storage/get_storage.dart';
// import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
// import 'package:this_4_that/constants/colors.dart';
// import 'package:this_4_that/constants/text_styles.dart';
// import 'package:this_4_that/screens/home/widgets/filterModalBottomSheet.dart';
// import 'package:this_4_that/screens/home/widgets/filter_widget_preview.dart';
// import 'package:this_4_that/screens/main_page/main_page_controller.dart';
// import 'package:this_4_that/widget/filled_color_button_widget.dart';
// import 'package:wtf_sliding_sheet/wtf_sliding_sheet.dart';
//
// import '../../widget/button_widget.dart';
// import 'home_page_controller.dart';
//
// ///
// /// This is a screen in which we write widgets concerning [HelloScreen]
// ///
//
// class HomePageScreen extends GetView<HomePageController> {
//   HomePageScreen({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return Obx(() => Scaffold(
//         backgroundColor: MyColors.orange,
//         body:
//
//         /// Stack widget with two children:
//
//         controller.currentUserItems.isNotEmpty
//             ? Stack(
//           children: [
//             /// Your item - when clicked it opens a dialog
//
//             GestureDetector(
//               onTap: () {
//                 controller.modalBottomSheetItemIndex =
//                     controller.selectedItemIndex;
//                 showSlidingBottomSheet(context, builder: (context) {
//                   return SlidingSheetDialog(
//                       elevation: 8,
//                       cornerRadius: 20,
//                       snapSpec: const SnapSpec(
//                           snap: true,
//                           snappings: [0.5, 0.8],
//                           positioning: SnapPositioning
//                               .relativeToAvailableSpace),
//                       builder: (context, state) {
//                         return Material(
//                           type: MaterialType.transparency,
//                           child: Wrap(
//                             children: [
//                               Column(
//                                 crossAxisAlignment:
//                                 CrossAxisAlignment.start,
//                                 children: [
//                                   const Divider(
//                                     color: MyColors.orange,
//                                     thickness: 3,
//                                     indent: 150,
//                                     endIndent: 150,
//                                   ),
//                                   const SizedBox(
//                                     height: 10,
//                                   ),
//                                   Container(
//                                     padding: const EdgeInsets.only(
//                                       left: 20,
//                                     ),
//                                     child: Text(
//                                       'Koji predmet mijenjaš?',
//                                       style:
//                                       MyTextStyles.poppins24w700,
//                                     ),
//                                   ),
//                                   Container(
//                                     padding: const EdgeInsets.all(20),
//                                     child: Obx(
//                                           () => GridView.builder(
//                                         shrinkWrap: true,
//                                         itemCount: controller
//                                             .currentUserItems.length,
//                                         gridDelegate:
//                                         const SliverGridDelegateWithFixedCrossAxisCount(
//                                           crossAxisCount: 2,
//                                           mainAxisSpacing: 15,
//                                           crossAxisSpacing: 15,
//                                         ),
//                                         itemBuilder:
//                                             (context, index) {
//                                           return GestureDetector(
//                                               onTap: () {
//                                                 controller
//                                                     .modalBottomSheetItemIndex =
//                                                     index;
//                                               },
//                                               child: Obx(
//                                                     () => Container(
//                                                   decoration:
//                                                   BoxDecoration(
//                                                     borderRadius:
//                                                     BorderRadius
//                                                         .circular(
//                                                         20),
//                                                   ),
//                                                   child: Container(
//                                                     decoration:
//                                                     const BoxDecoration(),
//                                                     child: Column(
//                                                       mainAxisAlignment:
//                                                       MainAxisAlignment
//                                                           .center,
//                                                       children: [
//                                                         Expanded(
//                                                           child:
//                                                           Container(
//                                                             decoration:
//                                                             BoxDecoration(
//                                                               border: Border.all(
//                                                                   color: controller.modalBottomSheetItemIndex == index
//                                                                       ? MyColors.orange
//                                                                       : Colors.transparent,
//                                                                   width: 4),
//                                                               borderRadius:
//                                                               BorderRadius.circular(20),
//                                                               image:
//                                                               DecorationImage(
//                                                                 fit: BoxFit
//                                                                     .cover,
//                                                                 image: NetworkImage(controller
//                                                                     .currentUserItems
//                                                                     .elementAt(index)
//                                                                     .itemPictureList![0]),
//                                                               ),
//                                                             ),
//                                                           ),
//                                                           // child: Image.asset(
//                                                           //   _images[index]['url'],
//                                                           //   fit: BoxFit.cover,
//                                                           // ),
//                                                         ),
//                                                         Container(
//                                                             padding:
//                                                             const EdgeInsets.all(
//                                                                 3),
//                                                             child:
//                                                             Text(
//                                                               controller
//                                                                   .currentUserItems
//                                                                   .elementAt(index)
//                                                                   .itemName,
//                                                               style: MyTextStyles
//                                                                   .poppins16w400,
//                                                             ))
//                                                       ],
//                                                     ),
//                                                   ),
//                                                 ),
//                                               ));
//                                         },
//                                       ),
//                                     ),
//                                   ),
//                                 ],
//                               ),
//                               Padding(
//                                 padding: const EdgeInsets.only(
//                                     left: 16, right: 16, bottom: 16),
//                                 child: GestureDetector(
//                                   behavior:
//                                   HitTestBehavior.translucent,
//                                   onTap: () {
//                                     controller.selectedItemIndex =
//                                         controller
//                                             .modalBottomSheetItemIndex;
//                                     Get.back();
//                                   },
//                                   child: FilledColorButtonWidget(
//                                       buttonHeight: 50,
//                                       buttonText: 'Primijeni',
//                                       buttonWidth: double.infinity,
//                                       isEnabled: true),
//                                 ),
//                               )
//                             ],
//                           ),
//                         );
//                       });
//                 });
//               },
//               child: Row(
//                 mainAxisAlignment: MainAxisAlignment.start,
//                 children: [
//                   Container(
//                     margin: const EdgeInsets.only(
//                         left: 16, right: 0, top: 30),
//                     padding:
//                     const EdgeInsets.only(left: 0, right: 10),
//                     decoration: BoxDecoration(
//                         color: Colors.white,
//                         borderRadius: BorderRadius.circular(40)),
//                     height: 60,
//                     width: Get.width * 0.8,
//                     child: Row(
//                       mainAxisAlignment: MainAxisAlignment.start,
//                       children: [
//                         Container(
//                           margin: const EdgeInsets.only(
//                               top: 5, bottom: 5),
//                           width: 75.w,
//                           height: 75.h,
//                           decoration: BoxDecoration(
//                             image: DecorationImage(
//                                 image: NetworkImage(controller
//                                     .currentUserItems
//                                     .elementAt(
//                                     controller.selectedItemIndex)
//                                     .itemPictureList![0]),
//                                 fit: BoxFit.fill),
//                             shape: BoxShape.circle,
//                           ),
//                         ),
//                         const SizedBox(width: 25),
//                         SizedBox(
//                           width: Get.width * 0.4,
//                           child: Text(
//                             controller.currentUserItems
//                                 .elementAt(
//                                 controller.selectedItemIndex)
//                                 .itemName,
//                             style: const TextStyle(
//                                 fontWeight: FontWeight.w400,
//                                 fontSize: 16),
//                             overflow: TextOverflow.ellipsis,
//                           ),
//                         ),
//                         const Icon(
//                           MdiIcons.chevronDown,
//                           size: 40,
//                         ),
//                       ],
//                     ),
//                   ),
//                   Padding(
//                     padding: const EdgeInsets.only(top: 30),
//                     child: FloatingActionButton(
//                         heroTag: 'filterButton',
//                         elevation: 0,
//                         backgroundColor: Colors.transparent,
//                         foregroundColor: Colors.black,
//                         onPressed: () {
//                           showModalBottomSheet(
//                               context: context,
//                               shape: const RoundedRectangleBorder(
//                                 borderRadius: BorderRadius.vertical(
//                                   top: Radius.circular(20.0),
//                                 ),
//                               ),
//                               builder: (context) {
//                                 return filterModalBottomSheet(
//                                   controller: controller,
//                                 );
//                               });
//                         },
//                         child: const Icon(MdiIcons.tuneVariant)),
//                   )
//                 ],
//               ),
//             ),
//
//             /// Card swiper with the card pages with all other user's items
//             controller.cards.isEmpty
//                 ? Column(
//               children: [
//                 /// ovo je to stajalo
//
//                 GestureDetector(
//                   behavior: HitTestBehavior.translucent,
//                   onTap: () {
//                     showModalBottomSheet(
//                         shape: RoundedRectangleBorder(
//                             borderRadius:
//                             BorderRadius.circular(20)),
//                         context: context,
//                         builder: (context) {
//                           return Wrap(
//                             spacing: 40,
//                             children: [
//                               Column(
//                                 crossAxisAlignment:
//                                 CrossAxisAlignment.start,
//                                 children: [
//                                   const Divider(
//                                     color: MyColors.orange,
//                                     thickness: 3,
//                                     indent: 150,
//                                     endIndent: 150,
//                                   ),
//                                   const SizedBox(
//                                     height: 10,
//                                   ),
//                                   Container(
//                                     padding:
//                                     const EdgeInsets.only(
//                                       left: 20,
//                                     ),
//                                     child: Text(
//                                       'Koji predmet mijenjaš?',
//                                       style: MyTextStyles
//                                           .poppins24w700,
//                                     ),
//                                   ),
//                                   Container(
//                                     height: 300,
//                                     padding:
//                                     const EdgeInsets.all(
//                                         20),
//                                     child: GridView.builder(
//                                       shrinkWrap: true,
//                                       itemCount: controller
//                                           .currentUserItems
//                                           .length,
//                                       gridDelegate:
//                                       const SliverGridDelegateWithFixedCrossAxisCount(
//                                         crossAxisCount: 2,
//                                         mainAxisSpacing: 15,
//                                         crossAxisSpacing: 15,
//                                       ),
//                                       itemBuilder:
//                                           (context, index) {
//                                         return GestureDetector(
//                                             behavior:
//                                             HitTestBehavior
//                                                 .translucent,
//                                             onTap: () {
//                                               controller
//                                                   .onContainerTapped(
//                                                   index);
//                                             },
//                                             child: Container(
//                                               decoration:
//                                               BoxDecoration(
//                                                 borderRadius:
//                                                 BorderRadius
//                                                     .circular(
//                                                     20),
//                                               ),
//                                               child: Container(
//                                                 decoration:
//                                                 const BoxDecoration(),
//                                                 child: Column(
//                                                   mainAxisAlignment:
//                                                   MainAxisAlignment
//                                                       .center,
//                                                   children: [
//                                                     Expanded(
//                                                       child:
//                                                       Container(
//                                                         decoration:
//                                                         BoxDecoration(
//                                                           borderRadius:
//                                                           BorderRadius.circular(20),
//                                                           image:
//                                                           DecorationImage(
//                                                             fit:
//                                                             BoxFit.cover,
//                                                             image:
//                                                             NetworkImage(controller.currentUserItems.elementAt(index).itemPictureList![0]),
//                                                           ),
//                                                         ),
//                                                       ),
//                                                       // child: Image.asset(
//                                                       //   _images[index]['url'],
//                                                       //   fit: BoxFit.cover,
//                                                       // ),
//                                                     ),
//                                                     Container(
//                                                         padding:
//                                                         const EdgeInsets.all(
//                                                             3),
//                                                         child:
//                                                         Text(
//                                                           controller
//                                                               .currentUserItems
//                                                               .elementAt(index)
//                                                               .itemName,
//                                                           style:
//                                                           MyTextStyles.poppins16w400,
//                                                         ))
//                                                   ],
//                                                 ),
//                                               ),
//                                             ));
//                                       },
//                                     ),
//                                   ),
//                                 ],
//                               ),
//                               Padding(
//                                 padding: const EdgeInsets.only(
//                                     left: 16,
//                                     right: 16,
//                                     bottom: 16),
//                                 child: GestureDetector(
//                                   behavior: HitTestBehavior
//                                       .translucent,
//                                   onTap: () {
//                                     controller
//                                         .selectedItemIndex =
//                                         controller
//                                             .modalBottomSheetItemIndex;
//                                   },
//                                   child:
//                                   FilledColorButtonWidget(
//                                       buttonHeight: 50,
//                                       buttonText:
//                                       'Primjeni',
//                                       buttonWidth:
//                                       double.infinity,
//                                       isEnabled: true),
//                                 ),
//                               )
//                             ],
//                           );
//                         });
//                   },
//                   child: Row(
//                     mainAxisAlignment: MainAxisAlignment.start,
//                     children: [
//                       Container(
//                         margin: const EdgeInsets.only(
//                             left: 16, right: 0, top: 30),
//                         padding: const EdgeInsets.only(
//                             left: 0, right: 10),
//                         decoration: BoxDecoration(
//                             color: Colors.white,
//                             borderRadius:
//                             BorderRadius.circular(40)),
//                         height: 60,
//                         width: Get.width * 0.8,
//                         child: Row(
//                           mainAxisAlignment:
//                           MainAxisAlignment.start,
//                           children: [
//                             Container(
//                               margin: const EdgeInsets.only(
//                                   top: 5, bottom: 5),
//                               width: 75.w,
//                               height: 75.h,
//                               decoration: BoxDecoration(
//                                 image: DecorationImage(
//                                     image: NetworkImage(
//                                       controller
//                                           .currentUserItems
//                                           .elementAt(controller
//                                           .selectedItemIndex)
//                                           .itemPictureList![0],
//                                     ),
//                                     fit: BoxFit.fill),
//                                 shape: BoxShape.circle,
//                               ),
//                             ),
//                             const SizedBox(width: 25),
//                             SizedBox(
//                               width: Get.width * 0.4,
//                               child: Text(
//                                 controller.currentUserItems
//                                     .elementAt(controller
//                                     .selectedItemIndex)
//                                     .itemName,
//                                 style: const TextStyle(
//                                     fontWeight: FontWeight.w400,
//                                     fontSize: 16),
//                                 overflow: TextOverflow.ellipsis,
//                               ),
//                             ),
//                             const Icon(
//                               MdiIcons.chevronDown,
//                               size: 40,
//                             ),
//                           ],
//                         ),
//                       ),
//                       Padding(
//                         padding: const EdgeInsets.only(top: 30),
//                         child: FloatingActionButton(
//                             heroTag: 'filterButton',
//                             elevation: 0,
//                             backgroundColor: Colors.transparent,
//                             foregroundColor: Colors.black,
//                             onPressed: () {
//                               showModalBottomSheet(
//                                   context: context,
//                                   builder: (context) {
//                                     return Wrap(
//                                       spacing: 40,
//                                       children: [
//                                         Container(
//                                           padding:
//                                           const EdgeInsets
//                                               .all(20),
//                                           child: const Column(
//                                             children: [
//                                               FilterWidgetPreview(
//                                                 filterType:
//                                                 'Vrijednost',
//                                                 filterValue:
//                                                 '100 - 500€',
//                                               ),
//                                               FilterWidgetPreview(
//                                                 filterType:
//                                                 'Stanje',
//                                                 filterValue:
//                                                 'Vrlo dobro',
//                                               ),
//                                               FilterWidgetPreview(
//                                                 filterType:
//                                                 'Udaljenost(km)',
//                                                 filterValue:
//                                                 '25',
//                                               ),
//                                               FilterWidgetPreview(
//                                                 filterType:
//                                                 'Kategorija',
//                                                 filterValue:
//                                                 'Uredski pribor',
//                                               ),
//                                             ],
//                                           ),
//                                         ),
//                                         Row(
//                                           children: [
//                                             Expanded(
//                                               child: Container(
//                                                 padding:
//                                                 const EdgeInsets
//                                                     .all(10),
//                                                 child:
//                                                 ButtonWidget(
//                                                   color: Colors
//                                                       .black,
//                                                   text:
//                                                   'Primjeni',
//                                                   onClicked:
//                                                       () {
//                                                     Navigator.pop(
//                                                         context);
//                                                   },
//                                                 ),
//                                               ),
//                                             ),
//                                           ],
//                                         )
//                                       ],
//                                     );
//                                   });
//                             },
//                             child: const Icon(
//                                 MdiIcons.tuneVariant)),
//                       )
//                     ],
//                   ),
//                 ),
//                 Container(
//                   height: 500.h,
//                   padding: const EdgeInsets.symmetric(
//                       horizontal: 10),
//                   margin: const EdgeInsets.only(
//                       top: 10, left: 10, right: 10),
//                   decoration: BoxDecoration(
//                       color: Colors.white,
//                       borderRadius: BorderRadius.circular(20)),
//                   child: Center(
//                     child: Column(
//                       crossAxisAlignment:
//                       CrossAxisAlignment.start,
// // mainAxisSize: MainAxisSize.max,
//                       mainAxisAlignment: MainAxisAlignment.end,
// // crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         const SizedBox(
//                           height: 80,
//                         ),
//                         Container(
//                           decoration: BoxDecoration(
//                             shape: BoxShape.circle,
//                             color: Colors.orange.shade100,
//                           ),
//                           child: const Icon(
//                             Icons.settings,
//                             size: 70,
//                             color: MyColors.orange,
//                           ),
//                         ),
//                         const SizedBox(
//                           height: 20,
//                         ),
//                         const Text(
//                           'To je sve za sad!',
//                           style: TextStyle(
//                               fontSize: 40,
//                               fontWeight: FontWeight.w700),
//                         ),
//                         const SizedBox(
//                           height: 20,
//                         ),
//                         const Text(
//                           'Pogledao si sve oglase svih korisnika u blizini. Promijeni filtere ili pokušaj kasnije.',
//                           style: TextStyle(
//                               fontSize: 16,
//                               fontWeight: FontWeight.w400),
//                         ),
//                         const SizedBox(height: 200),
//                         TextButton(
//                           onPressed: () {},
//                           child: (Container(
//                             width: Get.width * 0.85,
//                             height: Get.height * 0.06,
//                             decoration: BoxDecoration(
//                               color: MyColors.orange,
//                               borderRadius:
//                               BorderRadius.circular(56),
//                             ),
//                             child: const Center(
//                                 child: Text(
//                                   'Promijeni filter',
//                                   style: TextStyle(
//                                       color: Colors.black,
//                                       fontWeight: FontWeight.w400,
//                                       fontSize: 16),
//                                 )),
//                           )),
//                         )
//                       ],
//                     ),
//                   ),
//                 ),
//               ],
//             )
//                 : Padding(
//               padding: const EdgeInsets.only(top: 100),
//               child: CardSwiper(
//                 controller: controller.cardswipercontroller,
//                 cardsCount: controller.cards.length,
//                 cardBuilder: (context, index) {
//                   return controller.cards[index];
//                 },
//                 allowedSwipeDirection:
//                 AllowedSwipeDirection.symmetric(
//                     horizontal: true),
//                 onSwipe: controller.onSwipe,
//                 onEnd: controller.onEnd,
//                 numberOfCardsDisplayed: controller.cards.isEmpty
//                     ? 1
//                     : controller.numberOfCardsDisplayed,
//                 padding: const EdgeInsets.only(
//                   left: 15,
//                   right: 15,
//                 ),
//               ),
//             ),
//           ],
//         )
//             : Container(
//           decoration: BoxDecoration(
//             borderRadius: BorderRadius.circular(20),
//             color: MyColors.white,
//           ),
//           margin: const EdgeInsets.only(top: 16, left: 16, right: 16),
//           padding: const EdgeInsets.all(16),
//           height: Get.height,
//           child: Center(
//             child: Column(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: [
//                 Column(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     SizedBox(
//                       height: 180.h,
//                     ),
//                     Text(
//                       'Dodaj oglas!',
//                       style: MyTextStyles.poppins40w700,
//                     ),
//                     SizedBox(
//                       width: Get.width * 0.6,
//                       child: Text(
//                         'Moraš dodati oglas ili imati aktivan oglas kako bi ti mogli prikazivati oglase drugih korisnika.',
//                         style: MyTextStyles.poppins16w400,
//                       ),
//                     )
//                   ],
//                 ),
//                 GestureDetector(
//                   behavior: HitTestBehavior.translucent,
//                   onTap: () {
//                     Get.find<MainPageController>().currentIndex = 1;
//                   },
//                   child: FilledColorButtonWidget(
//                       buttonHeight: 50.h,
//                       buttonText: 'Dodaj oglas',
//                       buttonWidth: double.infinity,
//                       isEnabled: true),
//                 )
//               ],
//             ),
//           ),
//         ),
//         floatingActionButton: controller.cards.isEmpty ||
//             controller.cards.last.item.itemName.isEmpty ||
//             controller.currentUserItems.isEmpty
//             ? const SizedBox()
//             : Container(
//           width: Get.size.width,
//           padding: const EdgeInsets.symmetric(horizontal: 10),
//           child: (Row(
//             mainAxisAlignment: MainAxisAlignment.start,
//             children: [
//               SizedBox(
//                 width: Get.size.width * 0.25,
//               ),
//               FloatingActionButton(
//                 heroTag: 'swipeLeftButton',
//                 onPressed: () {
//                   controller.cardswipercontroller.swipeLeft();
//                 },
//                 backgroundColor: Colors.redAccent,
//                 child:
//                 const Icon(MdiIcons.closeThick, color: Colors.black),
//               ),
//               SizedBox(
//                 width: Get.size.width * 0.25,
//               ),
//               FloatingActionButton(
//                 heroTag: 'swipeRightButton',
//                 onPressed: () {
//                   controller.cardswipercontroller.swipeRight();
//                 },
//                 backgroundColor: Colors.greenAccent,
//                 child:
//                 const Icon(MdiIcons.checkBold, color: Colors.black),
//               ),
//             ],
//           )),
//         )));
//   }
// }

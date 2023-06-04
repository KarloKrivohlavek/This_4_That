import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:this_4_that/authentification_screens/authentification_screen_1_login.dart';
import 'package:this_4_that/constants/colors.dart';
import 'package:this_4_that/data.dart';
import 'package:this_4_that/widget/custom_dialog.dart';

class UserProfileItemPreview extends StatefulWidget {
  const UserProfileItemPreview(
      {required this.itemName,
      required this.pictureURL,
      required this.index,
      required this.isActiveButtonOn});
  final String itemName;
  final String pictureURL;
  final bool isActiveButtonOn;

  final int index;

  @override
  State<UserProfileItemPreview> createState() => _UserProfileItemPreviewState();
}

class _UserProfileItemPreviewState extends State<UserProfileItemPreview> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
          margin: const EdgeInsets.all(20),
          child: Column(
            children: [
              Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width * 0.35,
                      height: MediaQuery.of(context).size.height * 0.15,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        image: DecorationImage(
                          fit: BoxFit.cover,
                          image: AssetImage(widget.pictureURL),
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                    Container(
                      height: MediaQuery.of(context).size.height * 0.15,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            margin: const EdgeInsets.only(right: 20),
                            child: Column(
                              children: [
                                Text(
                                  widget.itemName,
                                  style: const TextStyle(
                                      fontWeight: FontWeight.w500,
                                      fontSize: 16),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(height: 30),
                          Container(
                            width: MediaQuery.of(context).size.width * 0.35,
                            child: widget.isActiveButtonOn
                                ? Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      GestureDetector(
                                        onTap: () async {
                                          // setState(() {
                                          //   currentUserItems[widget.index] =
                                          //       currentUserItems[widget.index]
                                          //           .copyWith(isArchived: true);
                                          // });
                                          // await getAllUsers();
                                          showDialog(
                                              context: context,
                                              builder: (context) =>
                                                  CustomDialog(
                                                    title: 'Arhiviraj',
                                                    text:
                                                        'Jeste li sigurni da želite arhivirati ovaj oglas? Oglas će biti premješten u arhivu i više ga nećete vidjeti u glavnom prikazu aplikacije. Ako u budućnosti želite ponovno aktivirati ovaj oglas, moći ćete ga izvući iz arhive.',
                                                    button1: 'Arhiviraj',
                                                    button2: 'Odustani',
                                                    action: () {
                                                      setState(() {
                                                        currentUserItems[
                                                                widget.index] =
                                                            currentUserItems[
                                                                    widget
                                                                        .index]
                                                                .copyWith(
                                                                    isArchived:
                                                                        true);

                                                        Navigator.pop(context);
                                                      });
                                                    },
                                                  ));
                                        },
                                        child: Container(
                                          margin:
                                              const EdgeInsets.only(bottom: 5),
                                          width: 35,
                                          height: 35,
                                          decoration: const BoxDecoration(
                                              shape: BoxShape.circle,
                                              color: MyColors.orange),
                                          child: const Icon(MdiIcons.pencil),
                                        ),
                                      ),
                                      GestureDetector(
                                        onTap: () {
                                          // showDialog(
                                          //   context: context,
                                          //   builder: (context) =>
                                          //       StatefulBuilder(builder:
                                          //           (context,
                                          //               StateSetter setState) {
                                          //     return Center(
                                          //         child: Container(
                                          //       decoration: BoxDecoration(
                                          //         color: Color(0xFF262626),
                                          //         borderRadius:
                                          //             BorderRadius.circular(20),
                                          //       ),
                                          //       padding:
                                          //           const EdgeInsets.all(20),
                                          //       height: MediaQuery.of(context)
                                          //               .size
                                          //               .height *
                                          //           0.35,
                                          //       width: MediaQuery.of(context)
                                          //               .size
                                          //               .width *
                                          //           0.7,
                                          //       child: Column(
                                          //           mainAxisAlignment:
                                          //               MainAxisAlignment.start,
                                          //           crossAxisAlignment:
                                          //               CrossAxisAlignment
                                          //                   .start,
                                          //           children: [
                                          //             const Text(
                                          //               'Arhiviraj',
                                          //               style: TextStyle(
                                          //                   color: Colors.white,
                                          //                   fontWeight:
                                          //                       FontWeight.w700,
                                          //                   fontSize: 24),
                                          //             ),
                                          //             SizedBox(
                                          //               height: 10,
                                          //             ),
                                          //             Text(
                                          //               'Jeste li sigurni da želite arhivirati ovaj oglas? Oglas će biti premješten u arhivu i više ga nećete vidjeti u glavnom prikazu aplikacije. Ako u budućnosti želite ponovno aktivirati ovaj oglas, moći ćete ga izvući iz arhive',
                                          //               style: TextStyle(
                                          //                   color:
                                          //                       Colors.white),
                                          //             ),
                                          //             Row(
                                          //               children: [
                                          //                 TextButton(
                                          //                   onPressed: () {
                                          //                     currentUserItems[widget
                                          //                         .index] = currentUserItems[
                                          //                             widget
                                          //                                 .index]
                                          //                         .copyWith(
                                          //                             isArchived:
                                          //                                 true);
                                          //
                                          //                     Navigator.pop(
                                          //                         context);
                                          //                     setState(() {});
                                          //                   },
                                          //                   child: const Text(
                                          //                     'Arhiviraj',
                                          //                     style: TextStyle(
                                          //                         color: MyColors
                                          //                             .orange),
                                          //                   ),
                                          //                 ),
                                          //                 TextButton(
                                          //                   onPressed: () {
                                          //                     Navigator.pop(
                                          //                         context);
                                          //                   },
                                          //                   child: const Text(
                                          //                     'Odustani',
                                          //                     style: TextStyle(
                                          //                         color: MyColors
                                          //                             .orange),
                                          //                   ),
                                          //                 )
                                          //               ],
                                          //             )
                                          //           ]),
                                          //     ));
                                          //   }),
                                          // );

                                          // currentUserItems[index] =
                                          //     currentUserItems[index]
                                          //         .copyWith(isArchived: true);
                                        },
                                        child: Container(
                                          width: 35,
                                          height: 35,
                                          decoration: const BoxDecoration(
                                              shape: BoxShape.circle,
                                              color: MyColors.orange),
                                          child: const Icon(
                                              MdiIcons.archiveOutline),
                                        ),
                                      ),
                                    ],
                                  )
                                : Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      GestureDetector(
                                        onTap: () {},
                                        child: Container(
                                          margin:
                                              const EdgeInsets.only(bottom: 5),
                                          width: 35,
                                          height: 35,
                                          decoration: const BoxDecoration(
                                              shape: BoxShape.circle,
                                              color: MyColors.orange),
                                          child: const Icon(MdiIcons.upload),
                                        ),
                                      ),
                                      GestureDetector(
                                        onTap: () {},
                                        child: Container(
                                          margin:
                                              const EdgeInsets.only(bottom: 5),
                                          width: 35,
                                          height: 35,
                                          decoration: const BoxDecoration(
                                              shape: BoxShape.circle,
                                              color: MyColors.orange),
                                          child: const Icon(MdiIcons.pencil),
                                        ),
                                      ),
                                      GestureDetector(
                                        onTap: () {
                                          currentUserItems[widget.index] =
                                              currentUserItems[widget.index]
                                                  .copyWith(isArchived: true);
                                        },
                                        child: Container(
                                          width: 35,
                                          height: 35,
                                          decoration: const BoxDecoration(
                                              shape: BoxShape.circle,
                                              color: MyColors.orange),
                                          child: const Icon(MdiIcons.trashCan),
                                        ),
                                      ),
                                    ],
                                  ),
                          ),
                          // TextButton(
                          //     onPressed: () {
                          //       Navigator.push(
                          //         context,
                          //         MaterialPageRoute(
                          //             builder: (context) =>
                          //                 AuthentificationScreen1Login()),
                          //       );
                          //     },
                          //     child: Expanded(
                          //         child: Container(
                          //       color: Colors.pink,
                          //       child: Text('Auth Screen 1'),
                          //     )))
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ],
          )),
    );
  }
}

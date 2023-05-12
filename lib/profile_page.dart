import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:this_4_that/src/edit_profile_page.dart';
import 'package:this_4_that/swappablePage.dart';
import 'package:this_4_that/swappable_item.dart';
import 'package:this_4_that/user.dart';
import 'package:this_4_that/user_preferences.dart';
import 'package:this_4_that/widget/profile_widget.dart';

import 'data.dart';

class ProfilePage extends StatefulWidget {
  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  bool isActiveButtonOn = true;
  List<SwappablePage> cards = cardsElements;
  // all available cards with item image description etc.
  int numberOfCardsDisplayed = 2;
  // number of cards that are displayed on the main screen
  List<int> removedItemsFromList = [];
  // list of indices of items that will be removed from the list when the end is reached
  @override
  Widget build(BuildContext context) {
    final user = UserPreferences.getUser();

    return Scaffold(
      body: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: EdgeInsets.all(10),
              margin: EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Colors.orange,
                borderRadius: BorderRadius.circular(50),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    height: 80,
                    width: 80,
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        image: DecorationImage(
                          fit: BoxFit.fill,
                          image: AssetImage(user.imagePath),
                        )),
                    child: ProfileWidget(
                      imagePath: user.imagePath,
                      onClicked: () {},
                    ),
                  ),
                  Container(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          currentUser.name,
                          style: TextStyle(
                              fontWeight: FontWeight.w700, fontSize: 24),
                        ),
                        Text(
                          'Bozidar Bozic',
                          style: TextStyle(
                            fontWeight: FontWeight.w400,
                            fontSize: 16,
                          ),
                        )
                      ],
                    ),
                  ),
                  FloatingActionButton(
                    onPressed: () {
                      Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => EditProfilePage()))
                          .then((value) => setState(() {}));
                    },
                    child: Icon(MdiIcons.pencil),
                    backgroundColor: Colors.white,
                    foregroundColor: Colors.black,
                    elevation: 0,
                  )
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 16),
              child: Text(
                'Moji oglasi',
                style: TextStyle(fontWeight: FontWeight.w700, fontSize: 24),
              ),
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              child: Row(
                children: [
                  Expanded(
                    child: Container(
                      child: TextButton(
                        onPressed: () {
                          setState(() {
                            if (isActiveButtonOn == false) {
                              isActiveButtonOn = !isActiveButtonOn;
                            }
                          });
                        },
                        child: (Container(
                          width: MediaQuery.of(context).size.width,
                          height: 60,
                          child: Text('Aktivni'),
                          decoration: BoxDecoration(
                            color: isActiveButtonOn
                                ? Colors.orange
                                : Colors.greenAccent,
                            borderRadius: BorderRadius.circular(10),
                          ),
                        )),
                        // style: TextButton.styleFrom(
                        //   textStyle: const TextStyle(fontSize: 20),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      child: TextButton(
                        onPressed: () {
                          setState(() {
                            if (isActiveButtonOn == true) {
                              isActiveButtonOn = !isActiveButtonOn;
                            }
                          });
                        },
                        child: (Container(
                          width: MediaQuery.of(context).size.width,
                          height: 60,
                          child: Text('Arhivirani'),
                          decoration: BoxDecoration(
                            color: isActiveButtonOn
                                ? Colors.greenAccent
                                : Colors.orange,
                            borderRadius: BorderRadius.circular(10),
                          ),
                        )),
                        // style: TextButton.styleFrom(
                        //   textStyle: const TextStyle(fontSize: 20),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            isActiveButtonOn
                ? ListView.builder(
                    shrinkWrap: true,
                    itemCount: currentUserItems.length,
                    itemBuilder: (context, index) {
                      if (currentUserItems[index].isArchived == false)
                        return userProfileItemPreview(
                          isActiveButtonOn: isActiveButtonOn,
                          index: index,
                          itemName: currentUserItems[index].title,
                          pictureURL: currentUserItems[index].imagesURLs[0],
                        );
                      else {
                        return SizedBox();
                      }
                    },
                  )
                : ListView.builder(
                    shrinkWrap: true,
                    itemCount: currentUserItems.length,
                    itemBuilder: (context, index) {
                      if (currentUserItems[index].isArchived == true)
                        return userProfileItemPreview(
                          isActiveButtonOn: isActiveButtonOn,
                          index: index,
                          itemName: currentUserItems[index].title,
                          pictureURL: currentUserItems[index].imagesURLs[0],
                        );
                      else {
                        return SizedBox();
                      }
                    },
                  ),
          ],
        ),
      ),
    );
  }
}

class userProfileItemPreview extends StatefulWidget {
  const userProfileItemPreview(
      {required this.itemName,
      required this.pictureURL,
      required this.index,
      required this.isActiveButtonOn});
  final String itemName;
  final String pictureURL;
  final bool isActiveButtonOn;

  final int index;

  @override
  State<userProfileItemPreview> createState() => _userProfileItemPreviewState();
}

class _userProfileItemPreviewState extends State<userProfileItemPreview> {
  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.all(20),
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
                  SizedBox(
                    width: 20,
                  ),
                  Container(
                    height: MediaQuery.of(context).size.height * 0.15,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          margin: EdgeInsets.only(right: 20),
                          child: Column(
                            children: [
                              Text(
                                widget.itemName,
                                style: TextStyle(
                                    fontWeight: FontWeight.w500, fontSize: 16),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: 30),
                        Container(
                          width: MediaQuery.of(context).size.width * 0.35,
                          child: widget.isActiveButtonOn
                              ? Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    GestureDetector(
                                      onTap: () {
                                        setState(() {
                                          currentUserItems[widget.index] =
                                              currentUserItems[widget.index]
                                                  .copyWith(isArchived: true);
                                        });
                                      },
                                      child: Container(
                                        margin: EdgeInsets.only(bottom: 5),
                                        width: 35,
                                        height: 35,
                                        child: Icon(MdiIcons.pencil),
                                        decoration: BoxDecoration(
                                            shape: BoxShape.circle,
                                            color: Colors.orange),
                                      ),
                                    ),
                                    GestureDetector(
                                      onTap: () {
                                        showDialog(
                                          context: context,
                                          builder: (context) => StatefulBuilder(
                                              builder: (context,
                                                  StateSetter setState) {
                                            return Center(
                                                child: Container(
                                              padding: EdgeInsets.all(20),
                                              color: Colors.yellow,
                                              height: MediaQuery.of(context)
                                                      .size
                                                      .height *
                                                  0.4,
                                              width: MediaQuery.of(context)
                                                      .size
                                                      .width *
                                                  0.7,
                                              child: Column(children: [
                                                Text(
                                                  'Arhiviraj',
                                                  style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.w700,
                                                      fontSize: 24),
                                                ),
                                                TextButton(
                                                    onPressed: () {
                                                      currentUserItems[
                                                              widget.index] =
                                                          currentUserItems[
                                                                  widget.index]
                                                              .copyWith(
                                                                  isArchived:
                                                                      true);

                                                      Navigator.pop(context);
                                                      setState(() {});
                                                    },
                                                    child: Text('Arhiviraj')),
                                                TextButton(
                                                  onPressed: () {
                                                    Navigator.pop(context);
                                                  },
                                                  child: Text('Odustani'),
                                                )
                                              ]),
                                            ));
                                          }),
                                        );
                                        ;
                                        // currentUserItems[index] =
                                        //     currentUserItems[index]
                                        //         .copyWith(isArchived: true);
                                      },
                                      child: Container(
                                        width: 35,
                                        height: 35,
                                        child: Icon(MdiIcons.archiveOutline),
                                        decoration: BoxDecoration(
                                            shape: BoxShape.circle,
                                            color: Colors.orange),
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
                                        margin: EdgeInsets.only(bottom: 5),
                                        width: 35,
                                        height: 35,
                                        child: Icon(MdiIcons.upload),
                                        decoration: BoxDecoration(
                                            shape: BoxShape.circle,
                                            color: Colors.orange),
                                      ),
                                    ),
                                    GestureDetector(
                                      onTap: () {},
                                      child: Container(
                                        margin: EdgeInsets.only(bottom: 5),
                                        width: 35,
                                        height: 35,
                                        child: Icon(MdiIcons.pencil),
                                        decoration: BoxDecoration(
                                            shape: BoxShape.circle,
                                            color: Colors.orange),
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
                                        child: Icon(MdiIcons.trashCan),
                                        decoration: BoxDecoration(
                                            shape: BoxShape.circle,
                                            color: Colors.orange),
                                      ),
                                    ),
                                  ],
                                ),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          ],
        ));
  }
}

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:this_4_that/authentification_screens/authentification_screen_1_login.dart';
import 'package:this_4_that/models/user/user.dart';
import 'package:this_4_that/src/edit_profile_page.dart';
import 'package:this_4_that/swappablePage.dart';
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
  User thisUser = User(
      dateOfBirth: '',
      description: '',
      fullName: '',
      location: '',
      userID: '',
      username: '');
  @override
  void initState() {
    super.initState();
    () async {
      List<User> allUsers = await getAllUsers();
      setState(() {
        thisUser = allUsers[0];
        print(thisUser);
      });
    }();
  }

  @override
  Widget build(BuildContext context) {
    final user = UserPreferences.getUser();

    return Scaffold(
      body: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: const EdgeInsets.all(10),
              margin: const EdgeInsets.all(20),
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
                          style: const TextStyle(
                              fontWeight: FontWeight.w700, fontSize: 24),
                        ),
                        Text(
                          thisUser.fullName,
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
                    backgroundColor: Colors.white,
                    foregroundColor: Colors.black,
                    elevation: 0,
                    child: const Icon(MdiIcons.pencil),
                  )
                ],
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(left: 16),
              child: Text(
                'Moji oglasi',
                style: TextStyle(fontWeight: FontWeight.w700, fontSize: 24),
              ),
            ),
            Center(
              child: Container(
                width: MediaQuery.of(context).size.width * 0.95,
                child: Row(
                  children: [
                    Expanded(
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
                          height: MediaQuery.of(context).size.height * 0.05,
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: Colors.orange,
                              width: 3,
                            ),
                            color: isActiveButtonOn
                                ? Colors.orange
                                : Colors.transparent,
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Center(
                            child: const Text(
                              'Aktivni',
                              style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400,
                                  color: Colors.black),
                            ),
                          ),
                        )),
                        // style: TextButton.styleFrom(
                        //   textStyle: const TextStyle(fontSize: 20),
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
                            height: MediaQuery.of(context).size.height * 0.05,
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: Colors.orange,
                                width: 3,
                              ),
                              color: isActiveButtonOn
                                  ? Colors.transparent
                                  : Colors.orange,
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: Center(
                                child: const Text(
                              'Arhivirani',
                              style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400,
                                  color: Colors.black),
                            )),
                          )),
                          // style: TextButton.styleFrom(
                          //   textStyle: const TextStyle(fontSize: 20),
                        ),
                      ),
                    ),
                  ],
                ),
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
                        return const SizedBox();
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
                        return const SizedBox();
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
                                    fontWeight: FontWeight.w500, fontSize: 16),
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
                                        await getAllUsers();
                                      },
                                      child: Container(
                                        margin:
                                            const EdgeInsets.only(bottom: 5),
                                        width: 35,
                                        height: 35,
                                        decoration: const BoxDecoration(
                                            shape: BoxShape.circle,
                                            color: Colors.orange),
                                        child: const Icon(MdiIcons.pencil),
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
                                              decoration: BoxDecoration(
                                                color: Color(0xFF262626),
                                                borderRadius:
                                                    BorderRadius.circular(20),
                                              ),
                                              padding: const EdgeInsets.all(20),
                                              height: MediaQuery.of(context)
                                                      .size
                                                      .height *
                                                  0.35,
                                              width: MediaQuery.of(context)
                                                      .size
                                                      .width *
                                                  0.7,
                                              child: Column(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.start,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    const Text(
                                                      'Arhiviraj',
                                                      style: TextStyle(
                                                          color: Colors.white,
                                                          fontWeight:
                                                              FontWeight.w700,
                                                          fontSize: 24),
                                                    ),
                                                    SizedBox(
                                                      height: 10,
                                                    ),
                                                    Text(
                                                      'Jeste li sigurni da želite arhivirati ovaj oglas? Oglas će biti premješten u arhivu i više ga nećete vidjeti u glavnom prikazu aplikacije. Ako u budućnosti želite ponovno aktivirati ovaj oglas, moći ćete ga izvući iz arhive',
                                                      style: TextStyle(
                                                          color: Colors.white),
                                                    ),
                                                    Row(
                                                      children: [
                                                        TextButton(
                                                          onPressed: () {
                                                            currentUserItems[
                                                                    widget
                                                                        .index] =
                                                                currentUserItems[
                                                                        widget
                                                                            .index]
                                                                    .copyWith(
                                                                        isArchived:
                                                                            true);

                                                            Navigator.pop(
                                                                context);
                                                            setState(() {});
                                                          },
                                                          child: const Text(
                                                            'Arhiviraj',
                                                            style: TextStyle(
                                                                color: Colors
                                                                    .orange),
                                                          ),
                                                        ),
                                                        TextButton(
                                                          onPressed: () {
                                                            Navigator.pop(
                                                                context);
                                                          },
                                                          child: const Text(
                                                            'Odustani',
                                                            style: TextStyle(
                                                                color: Colors
                                                                    .orange),
                                                          ),
                                                        )
                                                      ],
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
                                        decoration: const BoxDecoration(
                                            shape: BoxShape.circle,
                                            color: Colors.orange),
                                        child:
                                            const Icon(MdiIcons.archiveOutline),
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
                                            color: Colors.orange),
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
                                            color: Colors.orange),
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
                                            color: Colors.orange),
                                        child: const Icon(MdiIcons.trashCan),
                                      ),
                                    ),
                                  ],
                                ),
                        ),
                        TextButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        AuthentificationScreen1Login()),
                              );
                            },
                            child: Container(
                              width: 30,
                              height: 20,
                              color: Colors.pink,
                              child: Text('Auth Screen 1'),
                            ))
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

Future<List<User>> getAllUsers() async {
  final allUsers = await FirebaseFirestore.instance
      .collection('users')
      .get()
      .then((value) =>
          value.docs.map((doc) => User.fromJson(doc.data())).toList());
  print(allUsers);
  return allUsers;
}

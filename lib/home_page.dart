import 'package:flutter/material.dart';
import 'package:logger_fork/logger_fork.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:this_4_that/data.dart';
import 'package:this_4_that/swappablePage.dart';
import 'package:this_4_that/profile_page.dart';
import 'package:flutter_card_swiper/flutter_card_swiper.dart';
import 'package:logger_fork/logger_fork.dart';
import 'package:this_4_that/widget/button_widget.dart';

class HomePage extends StatefulWidget {
  static const String routeName = '/';

  static Route route() {
    return MaterialPageRoute(
      builder: (_) => HomePage(),
      settings: const RouteSettings(name: routeName),
    );
  }

  HomePage({super.key});

  final logger = Logger();

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final CardSwiperController controller = CardSwiperController();
  int _selectedImageIndex = 0;
  int _pendingImageIndex = -1;
  int _currentIndex = 0;
  List<Map<String, dynamic>> _images = [
    {
      'name': 'Lampa',
      'url': 'images/lamp.jpg',
    },
    {
      'name': 'Logitech mis',
      'url': 'images/mouse.jpg',
    },
    {
      'name': 'Novcanik',
      'url': 'images/wallet.jpg',
    },
    {
      'name': 'Sat',
      'url': 'images/watch.jpg',
    },
  ];
  void _onContainerTapped(int index) {
    setState(() {
      _pendingImageIndex = index;
    });
  }

  void _onConfirmButtonPressed() {
    if (_pendingImageIndex != -1) {
      setState(() {
        _selectedImageIndex = _pendingImageIndex;
        _pendingImageIndex = -1;
      });
    }
  }

  String getSelectedImageName() {
    if (_pendingImageIndex != -1) {
      return _images[_pendingImageIndex]['name'];
    } else {
      return _images[_selectedImageIndex]['name'];
    }
  }

  /// variables:
  List<SwappablePage> cards =
      cardsElements; // all available cards with item image description etc.
  int numberOfCardsDisplayed =
      2; // number of cards that are displayed on the main screen
  List<int> removedItemsFromList =
      []; // list of indices of items that will be removed from the list when the end is reached

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.orange,
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
                                  itemCount: _images.length,
                                  gridDelegate:
                                      const SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: 2,
                                    mainAxisSpacing: 15,
                                    crossAxisSpacing: 15,
                                  ),
                                  itemBuilder: (context, index) {
                                    return GestureDetector(
                                        onTap: () => _onContainerTapped(index),
                                        child: Container(
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(20),
                                          ),
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
                                                          _images[index]
                                                              ['url']),
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
                                                    _images[index]['name'],
                                                    style: const TextStyle(
                                                        fontSize: 16,
                                                        fontWeight:
                                                            FontWeight.w400),
                                                  ))
                                            ],
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
                                  padding: EdgeInsets.all(10),
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
                    width: MediaQuery.of(context).size.width * 0.8,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Container(
                          margin: const EdgeInsets.only(top: 5, bottom: 5),
                          width: 75,
                          height: 75,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                                image: AssetImage(
                                  _images[_pendingImageIndex != -1
                                      ? _pendingImageIndex
                                      : _selectedImageIndex]['url'],
                                ),
                                fit: BoxFit.fill),
                            shape: BoxShape.circle,
                          ),
                        ),
                        const SizedBox(width: 25),
                        SizedBox(
                          width: MediaQuery.of(context).size.width * 0.4,
                          child: Text(
                            getSelectedImageName(),
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
                                        children: [
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
                                            // width: MediaQuery.of(context).size.width *
                                            //     0.8,
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
            cards.isEmpty
                ? Container(
                    child: Column(
                      children: [
                        Expanded(
                          child: Container(
                            padding: const EdgeInsets.symmetric(horizontal: 10),
                            margin: const EdgeInsets.only(
                                top: 20, left: 10, right: 10),
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(20)),
                            // width: MediaQuery.of(context).size.width,
                            // height: MediaQuery.of(context).size.height * 0.75,
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
                                      color: Colors.orange,
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
                                      width: MediaQuery.of(context).size.width *
                                          0.85,
                                      height:
                                          MediaQuery.of(context).size.height *
                                              0.06,
                                      decoration: BoxDecoration(
                                        color: Colors.orange,
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
                    ),
                  )
                : Padding(
                    padding: const EdgeInsets.only(top: 100),
                    child: CardSwiper(
                      controller: controller,
                      cardsCount: cards.length,
                      cardBuilder: (context, index) {
                        return cards[index];
                      },
                      isVerticalSwipingEnabled: false,
                      onSwipe: _onSwipe,
                      onEnd: _onEnd,
                      numberOfCardsDisplayed: numberOfCardsDisplayed,
                      padding: const EdgeInsets.only(
                        left: 15,
                        right: 15,
                      ),
                    ),
                  ),
          ],
        ),
        floatingActionButton: cards.isEmpty
            ? SizedBox()
            : Padding(
                padding: EdgeInsets.symmetric(horizontal: 10),
                child: (Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: 100,
                    ),
                    FloatingActionButton(
                      onPressed: () {
                        controller.swipeLeft();
                      },
                      child: Icon(MdiIcons.closeThick, color: Colors.black),
                      backgroundColor: Colors.redAccent,
                    ),
                    SizedBox(
                      width: 80,
                    ),
                    FloatingActionButton(
                      onPressed: () {
                        controller.swipeRight();
                      },
                      child: Icon(MdiIcons.checkBold, color: Colors.black),
                      backgroundColor: Colors.greenAccent,
                    ),
                  ],
                )),
              ));
  }

//* Function that is called when user swaps item:
//* ----- it defines what happens when user swaps to certain side
  bool _onSwipe(
    int previousIndex,
    int? currentIndex,
    CardSwiperDirection direction,
  ) {
    /// when user swipes left:
    /// ----- put the index of the item to be removed into a list
    if (direction.name == 'left') {
      removedItemsFromList.add(previousIndex);
    }

    /// when user swipes right:
    /// ----- put the index of the item to be removed into a list
    /// ---- go to the next page, then get back to previous
    if (direction.name == 'right') {
      cards[previousIndex].item =
          cards[previousIndex].item.copyWith(isMatched: true);
      removedItemsFromList.add(previousIndex);
      // Future.delayed(const Duration(milliseconds: 300), () {
      //   //Get.find<HomeController>().currentTab = 2;
      //
      //   Navigator.push(
      //       context, MaterialPageRoute(builder: (context) => ProfilePage()));
      //   Future.delayed(
      //       const Duration(seconds: 2), () => Navigator.pop(context));
      // }
      // );
    }

    /// if there is the only one item left - change number of cards to display to 1
    if ((cards.length - removedItemsFromList.length) == 1) {
      setState(() {
        numberOfCardsDisplayed = 1;
      });
    }

    widget.logger.w(
      'The card $previousIndex was swiped to the ${direction.name}. Now the card $currentIndex is on top',
    );
    widget.logger.wtf(cards[previousIndex].item);

    return true;
  }

//* Function that is called when the list reaches its end
//* ------ it defines what happens on lists end
  void _onEnd() {
    final remainedItems = <SwappablePage>[];

    setState(() {
      /// when the end of the list of items is reached, keep the items that are not swapped left
      for (var j = 0; j < cards.length; ++j) {
        if (!removedItemsFromList.contains(j)) {
          remainedItems.add(cards.elementAt(j));
        }
      }

      /// clear previous list with items and set as new list with items not swapped left
      removedItemsFromList.clear();
      cards.clear();
      cards = remainedItems;
    });
  }
}

class FilterWidgetPreview extends StatelessWidget {
  FilterWidgetPreview({required this.filterType, required this.filterValue});
  final String filterType;
  final String filterValue;
  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {},
      style: TextButton.styleFrom(
        foregroundColor: Colors.black, // Text Color
      ),
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 15),
        color: Colors.white,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              filterType,
              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w700),
            ),
            Text(
              filterValue,
              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
            ),
          ],
        ),
      ),
    );
  }
}

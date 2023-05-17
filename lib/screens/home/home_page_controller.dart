import 'dart:ffi';

import 'package:get/get.dart';
import 'package:this_4_that/data.dart';
import 'package:this_4_that/swappablePage.dart';

import '../../flutter_card_swiper.dart';

class HomePageController extends GetxController {
  /// DEPENDENCIES

  ///REACTIVE VARIABLES

  final RxInt _currentIndex = 0.obs;
  int get currentIndex => _currentIndex.value;
  set currentIndex(int value) => _currentIndex.value = value;

  final RxInt _numberOfCardsDisplayed = 2.obs;
  int get numberOfCardsDisplayed => _numberOfCardsDisplayed.value;
  set numberOfCardsDisplayed(int value) =>
      _numberOfCardsDisplayed.value = value;

  final RxList<SwappablePage> _cards = <SwappablePage>[].obs;
  List<SwappablePage> get cards => _cards;
  set cards(List<SwappablePage> value) => _cards.assignAll(value);

  // final logger = Get.find<LoggerService>();

  ///VARIABLES

  // all available cards with item image description etc.
  // int numberOfCardsDisplayed =
  //     2; // number of cards that are displayed on the main screen
  List<int> removedItemsFromList =
      []; // list of indices of items that will be removed from the list when the end is reached

  late CardSwiperController cardswipercontroller;

  int selectedImageIndex = 0;
  int pendingImageIndex = -1;
  int currentSwapPageIndex = 0;
  List<Map<String, dynamic>> images = [
    {
      'name': 'Lampa',
      'url': 'images/lamp.jpg',
      'isOn': false,
    },
    {
      'name': 'Logitech mis',
      'url': 'images/mouse.jpg',
      'isOn': false,
    },
    {
      'name': 'Novcanik',
      'url': 'images/wallet.jpg',
      'isOn': false,
    },
    {
      'name': 'Sat',
      'url': 'images/watch.jpg',
      'isOn': false,
    },
  ];

  /// INIT

  @override
  Future<void> onInit() async {
    super.onInit();
    cards = cardsElements;
    cardswipercontroller = CardSwiperController();
  }

  /// METHODS

//* Function that is called when user swaps item:
//* ----- it defines what happens when user swaps to certain side

  bool onSwipe(
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
    ///
    if (direction.name == 'right') {
      cards[previousIndex].item =
          cards[previousIndex].item.copyWith(isMatched: true);
      removedItemsFromList.add(previousIndex);
    }

    /// if there is the only one item left - change number of cards to display to 1
    if ((cards.length - removedItemsFromList.length) == 1) {
      numberOfCardsDisplayed = 1;
    }
    return true;
  }

//* Function that is called when the list reaches its end
//* ------ it defines what happens on lists end
  void onEnd() {
    final remainedItems = <SwappablePage>[];

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
  }

  void onContainerTapped(int index) {
    pendingImageIndex = index;
  }

  void onConfirmButtonPressed() {
    if (pendingImageIndex != -1) {
      selectedImageIndex = pendingImageIndex;
      pendingImageIndex = -1;
    }
  }

  String getSelectedImageName() {
    if (pendingImageIndex != -1) {
      return images[pendingImageIndex]['name'];
    } else {
      return images[selectedImageIndex]['name'];
    }
  }
}

// import 'dart:ffi';

import 'package:get/get.dart';
import 'package:this_4_that/data.dart';
import 'package:this_4_that/models/matchedChatData/matched_chat_data.dart';
import 'package:this_4_that/screens/matched_item_screen.dart';
import 'package:this_4_that/models/item/item.dart';
import 'package:this_4_that/models/match/match.dart';
import 'package:this_4_that/models/swipe_item/swipe_item.dart';
import 'package:this_4_that/models/user/user.dart';
import 'package:this_4_that/services/firebase_service.dart';
import 'package:this_4_that/services/logger_service.dart';
import 'package:this_4_that/swapItem.dart';
import 'package:this_4_that/swappable_page.dart';

import '../../flutter_card_swiper.dart';

class HomePageController extends GetxController {
  /// DEPENDENCIES

  final firebaseService = Get.find<FirebaseService>();

  ///REACTIVE VARIABLES

  final RxInt _currentIndex = 0.obs;
  int get currentIndex => _currentIndex.value;
  set currentIndex(int value) => _currentIndex.value = value;

  final RxInt _numberOfCardsDisplayed = 1.obs;
  int get numberOfCardsDisplayed => _numberOfCardsDisplayed.value;
  set numberOfCardsDisplayed(int value) =>
      _numberOfCardsDisplayed.value = value;

  final Rx<UserData> _currentUserData = UserData(
          dateOfBirth: '',
          description: '',
          fullName: '',
          location: '',
          userID: '',
          username: '',
          email: '')
      .obs;
  UserData get currentUserData => _currentUserData.value;
  set currentUserData(UserData value) => _currentUserData.value = value;

  final RxList<SwappablePage> _cards = <SwappablePage>[
    SwappablePage(
        item: SwipeItem(
            itemDescription: '',
            itemName: '',
            condition: '',
            location: '',
            itemPictureList: [],
            userID: '',
            itemID: '',
            itemState: '',
            userPictureURL: 'default_user_profile_picture.png',
            userName: ''))
  ].obs;
  List<SwappablePage> get cards => _cards;
  set cards(List<SwappablePage> value) => _cards.assignAll(value);

  final logger = Get.find<LoggerService>();

  final RxInt _selectedItemIndex = 0.obs;
  int get selectedItemIndex => _selectedItemIndex.value;
  set selectedItemIndex(int value) => _selectedItemIndex.value = value;

  final RxInt _modalBottomSheetItemIndex = 0.obs;
  int get modalBottomSheetItemIndex => _modalBottomSheetItemIndex.value;
  set modalBottomSheetItemIndex(int value) =>
      _modalBottomSheetItemIndex.value = value;

  ///VARIABLES

  // all available cards with item image description etc.
  // int numberOfCardsDisplayed =
  //     2; // number of cards that are displayed on the main screen
  List<int> removedItemsFromList =
      []; // list of indices of items that will be removed from the list when the end is reached

  final RxList<Item> _differentUserItems = <Item>[].obs;
  List<Item> get differentUserItems => _differentUserItems;
  set differentUserItems(List<Item> value) =>
      _differentUserItems.assignAll(value);

  late CardSwiperController cardswipercontroller;

  int selectedImageIndex = 0;
  int pendingImageIndex = -1;
  int currentSwapPageIndex = 0;
  // List<Map<String, dynamic>> images = [
  //   {
  //     'name': 'Lampa',
  //     'url': 'images/lamp.jpg',
  //     'isOn': false,
  //   },
  //   {
  //     'name': 'Logitech mis',
  //     'url': 'images/mouse.jpg',
  //     'isOn': false,
  //   },
  //   {
  //     'name': 'Novcanik',
  //     'url': 'images/wallet.jpg',
  //     'isOn': false,
  //   },
  //   {
  //     'name': 'Sat',
  //     'url': 'images/watch.jpg',
  //     'isOn': false,
  //   },
  // ];

  final RxList<Item> _currentUserItems = <Item>[].obs;
  List<Item> get currentUserItems => _currentUserItems;
  set currentUserItems(List<Item> value) => _currentUserItems.assignAll(value);

  /// INIT

  @override
  Future<void> onInit() async {
    super.onInit();
    cardswipercontroller = CardSwiperController();
    currentUserData = await firebaseService.getCurrentUserData();
    currentUserItems = await firebaseService.getCurrentUserItemsActive();
    logger.wtf(currentUserItems);
    differentUserItems = await firebaseService.getDifferentUserItems();

    await fillCardsList(currentUserData.matchedItemListIds ?? []);
    logger.w(cards);
    cards.removeLast();
    if (cards.length > 1) {
      numberOfCardsDisplayed = 2;
    }
  }

  /// METHODS

  Future<MatchedItems> checkIfMatched(int previousIndex) async {
    MatchedItems match = MatchedItems(
        item1Name: '',
        item2Name: '',
        user1Username: '',
        user2Username: '',
        item1PictureURL: '',
        item2PictureURL: '',
        user1ID: '',
        user2ID: '',
        item1ID: '',
        item2ID: '',
        matchID: '',
        chatID: '');
    //varijabla koja sadrzi item od drugog usera
    final differentUserItem =
        await firebaseService.getItemData(cards[previousIndex].item.itemID);
    logger.e(differentUserItem);
    //varijabla koja sadrzi podatke od drugog usera
    final differentUserData =
        await firebaseService.getDifferentUserData(differentUserItem.userID);
    logger.w(differentUserData);
    if (differentUserData.matchedItemListIds != null &&
        differentUserData.matchedItemListIds!.isNotEmpty) {
      logger.wtf(differentUserData.matchedItemListIds);
      final currentUserItem = currentUserItems.elementAt(selectedItemIndex);
      if (differentUserData.matchedItemListIds!
          .contains(currentUserItems.elementAt(selectedItemIndex).itemID)) {
        //varijabla koja sadrzi matchedChatData podatke
        final matchedChatData = MatchedChatData(
            user1ID: currentUserData.userID,
            user2ID: differentUserData.userID,
            chatID: '');
        //stvara novi chat i vraca novi chatID

        final chatID = await firebaseService.createNewChat(matchedChatData);
        //varijabla koja sprema sve podatke o matchu
        match = MatchedItems(
            item1Name: currentUserItem.itemName,
            item2Name: differentUserItem.itemName,
            user1Username: currentUserData.username,
            user2Username: differentUserData.username,
            item1PictureURL: currentUserItem.itemPictureList![0],
            item2PictureURL: differentUserItem.itemPictureList![0],
            user1ID: currentUserData.userID,
            user2ID: differentUserData.userID,
            item1ID: currentUserItem.itemID,
            item2ID: differentUserItem.itemID,
            matchID: '',
            chatID: chatID);
        await firebaseService.sendNewMatchData(match);
      }
    }
    return match;
  }

  Future<void> fillCardsList(List<String> matchedItems) async {
    logger.e(matchedItems);
    for (final item in differentUserItems) {
      if (!matchedItems.contains(item.itemID)) {
        logger.v(item);
        final userData =
            await firebaseService.getDifferentUserData(item.userID);
        final swapItem = SwipeItem(
            itemDescription: item.itemDescription,
            itemName: item.itemName,
            condition: item.condition,
            location: userData.location,
            userID: item.userID,
            itemID: item.itemID,
            itemState: item.itemState,
            itemPictureList: item.itemPictureList!,
            userPictureURL:
                userData.profilePicture ?? 'default_user_profile_picture.png',
            userName: userData.username);
        final swapPage = SwappablePage(item: swapItem);
        // cards.add(swapPage);
        cards.insert(0, swapPage);
      }
    }
  }

//* Function that is called when user swaps item:
//* ----- it defines what happens when user swaps to certain side

  Future<bool> onSwipe(
    int previousIndex,
    int? currentIndex,
    CardSwiperDirection direction,
  ) async {
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
      firebaseService
          .updateUserDataMatchedList(cards[previousIndex].item.itemID);
      final match = await checkIfMatched(previousIndex);
      logger.e(match);

      removedItemsFromList.add(previousIndex);

      if (match.chatID.isNotEmpty) {
        Get.to(() => MatchedItemPage(), arguments: match);
      }
    }

    /// if there is the only one item left - change number of cards to display to 1
    if ((cards.length - removedItemsFromList.length) == 1) {
      numberOfCardsDisplayed = 1;
    }
    return true;
  }

// * Function that is called when the list reaches its end
// * ------ it defines what happens on lists end
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

  // String getSelectedImageName() {
  //   if (pendingImageIndex != -1) {
  //     return images[pendingImageIndex]['name'];
  //   } else {
  //     return images[selectedImageIndex]['name'];
  //   }
  // }
}

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:this_4_that/constants/constants.dart';
import 'package:this_4_that/models/categoryType/categoryType.dart';
import 'package:this_4_that/models/matchedChatData/matched_chat_data.dart';
import 'package:this_4_that/models/price_filter/price_filter.dart';
import 'package:this_4_that/screens/matched_item_screen.dart';
import 'package:this_4_that/models/item/item.dart';
import 'package:this_4_that/models/match/match.dart';
import 'package:this_4_that/models/swipe_item/swipe_item.dart';
import 'package:this_4_that/models/user/user.dart';
import 'package:this_4_that/services/firebase_service.dart';
import 'package:this_4_that/services/logger_service.dart';
import 'package:this_4_that/swappable_page.dart';

import '../../flutter_card_swiper.dart';

class HomePageController extends GetxController {
  /// DEPENDENCIES

  final firebaseService = Get.find<FirebaseService>();

  ///REACTIVE VARIABLES

  final controller = TextEditingController();

  final RxInt _currentIndex = 0.obs;
  int get currentIndex => _currentIndex.value;
  set currentIndex(int value) => _currentIndex.value = value;

  final RxInt _numberOfCardsDisplayed = 1.obs;
  int get numberOfCardsDisplayed => _numberOfCardsDisplayed.value;
  set numberOfCardsDisplayed(int value) =>
      _numberOfCardsDisplayed.value = value;

  final RxBool _buttonIsEnabled = false.obs;
  bool get buttonIsEnabled => _buttonIsEnabled.value;
  set buttonIsEnabled(bool value) => _buttonIsEnabled.value = value;

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

  // List<PriceFilter> priceFilterList = [];

  // final Rx<PriceFilter> _selectedPriceFilter = PriceFilter(
  //   price: '',
  //   isOn: false,
  // ).obs;
  // PriceFilter get selectedPriceFilter => _selectedPriceFilter.value;
  // set selectedPriceFilter(PriceFilter value) =>
  //     _selectedPriceFilter.value = value;

  final List<String> filterListNames = MyConstants.buttonValuesPrice;

  final List<PriceFilter> priceFilters = [
    PriceFilter(price: "0 - 50 €", isOn: true),
    PriceFilter(price: "50 - 100 €", isOn: true),
    PriceFilter(price: "100 - 200 €", isOn: true),
    PriceFilter(price: "200 - 500 €", isOn: true),
    PriceFilter(price: "500 - 1000 €", isOn: true),
    PriceFilter(price: "1000 - 1500 €", isOn: true),
    PriceFilter(price: "1500+ €", isOn: true),
  ].obs;

  final RxList<PriceFilter> selectedPriceFilters = <PriceFilter>[].obs;
  final RxString firstSelectedPriceFilterValue = ''.obs;

  final List<PriceFilter> conditionFilters = [
    PriceFilter(price: "Novo nekorišteno", isOn: true),
    PriceFilter(price: "Novo raspakirano", isOn: true),
    PriceFilter(price: "Rabljeno bez tragova korištenja", isOn: true),
    PriceFilter(price: "Rabljeno sa tragovima korištenja", isOn: true),
    PriceFilter(price: "Rabljeno s defektima", isOn: true),
    PriceFilter(price: "Potrgano/neispravno", isOn: true),
  ].obs;

  final RxList<PriceFilter> selectedConditionFilters = <PriceFilter>[].obs;
  final RxString firstSelectedConditionFilterValue = ''.obs;

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

  int countIsOn(List<CategoryType> categories) {
    int counter = 0;
    for (int i = 0; i < categories.length; ++i) {
      if (categories[i].isOn == true) {
        counter++;
      }
    }
    return counter;
  }

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

  final RxList<Item> _currentUserItems = <Item>[].obs;
  List<Item> get currentUserItems => _currentUserItems;
  set currentUserItems(List<Item> value) => _currentUserItems.assignAll(value);

  final RxList<String> _pickedCategories = <String>[].obs;
  List<String> get pickedCategories => _pickedCategories;
  set pickedCategories(List<String> value) =>
      _pickedCategories.assignAll(value);

  final RxList<CategoryType> _pickedCategoriesConstants = <CategoryType>[].obs;
  List<CategoryType> get pickedCategoriesConstants =>
      _pickedCategoriesConstants;
  set pickedCategoriesConstants(List<CategoryType> value) =>
      _pickedCategoriesConstants.assignAll(value);

  /// INIT

  @override
  Future<void> onInit() async {
    super.onInit();
    cardswipercontroller = CardSwiperController();
    currentUserData = await firebaseService.getCurrentUserData();
    currentUserItems = await firebaseService.getCurrentUserItemsActive();
    logger.wtf(currentUserItems);
    differentUserItems = await firebaseService.getDifferentUserItems();
    pickedCategoriesConstants = MyConstants.allCategories;
    logger.wtf(pickedCategoriesConstants);
    // List.generate(
    //     MyConstants.buttonValuesPrice.length,
    //     (index) => priceFilterList.add(PriceFilter(
    //         price: MyConstants.buttonValuesPrice[index], isOn: false)));

    await fillCardsList(currentUserData.matchedItemListIds ?? []);
    logger.w(cards);
    cards.removeLast();
    if (cards.length > 1) {
      numberOfCardsDisplayed = 2;
    }
  }

  /// METHODS

  void toggleCheckbox(int index) {
    priceFilters[index] =
        priceFilters[index].copyWith(isOn: !priceFilters[index].isOn);
    updateSelectedPriceFilters(priceFilters);

    update();
  }

  void toggleCheckboxCondition(int index) {
    conditionFilters[index] =
        conditionFilters[index].copyWith(isOn: !conditionFilters[index].isOn);
    updateSelectedConditionFilters(conditionFilters);

    update();
  }

  void updateSelectedPriceFilters(List<PriceFilter> allSelectedPriceFilters) {
    selectedPriceFilters.assignAll(
        allSelectedPriceFilters.where((priceFilter) => priceFilter.isOn));
    firstSelectedPriceFilterValue.value =
        selectedPriceFilters.isNotEmpty ? selectedPriceFilters[0].price : '';
  }

  void updateSelectedConditionFilters(
      List<PriceFilter> allSelectedConditionFilters) {
    selectedConditionFilters.assignAll(
        allSelectedConditionFilters.where((priceFilter) => priceFilter.isOn));
    firstSelectedConditionFilterValue.value =
        selectedConditionFilters.isNotEmpty
            ? selectedConditionFilters[0].price
            : '';
  }

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
        final matchId = await firebaseService.sendNewMatchData(match);
        match = match.copyWith(matchID: matchId!);
      }
    }
    return match;
  }
  // void applyFilters(dynamic filterparams)
  // final filtered = service.getfildere(request)
  // cards.assignall(filtered)

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
        Get.to(() => const MatchedItemPage(), arguments: match);
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

  void checkIfPickedItemListIsEmpty() {
    if (pickedCategories.isNotEmpty) {
      buttonIsEnabled = true;
    } else {
      buttonIsEnabled = false;
    }
  }

  void searchCategory(String query) {
    final suggestions = MyConstants.allCategories
        .where((category) {
          final categoryTitle = category.category.toLowerCase();
          final input = query.toLowerCase();
          return categoryTitle.contains(input);
        })
        .map((e) =>
            pickedCategories.contains(e.category) ? e.copyWith(isOn: true) : e)
        .toList();

    pickedCategoriesConstants.assignAll(suggestions);
  }

  void addPickedItemToList(CategoryType pickedCategory) {
    if (pickedCategories.length < 3) {
      pickedCategories.add(pickedCategory.category);

      final index = pickedCategoriesConstants
          .indexWhere((element) => element == pickedCategory);
      final isOn = pickedCategoriesConstants.elementAt(index).isOn;
      pickedCategoriesConstants[index] =
          pickedCategoriesConstants[index].copyWith(isOn: !isOn);
      checkIfPickedItemListIsEmpty();
    }
  }

  void removePickedItemToList(CategoryType pickedCategory) {
    pickedCategories.remove(pickedCategory.category);
    logger.wtf(pickedCategories);

    final index = pickedCategoriesConstants
        .indexWhere((element) => element == pickedCategory);
    final isOn = pickedCategoriesConstants.elementAt(index).isOn;
    pickedCategoriesConstants[index] =
        pickedCategoriesConstants[index].copyWith(isOn: !isOn);
    checkIfPickedItemListIsEmpty();
  }
  // String getSelectedImageName() {
  //   if (pendingImageIndex != -1) {
  //     return images[pendingImageIndex]['name'];
  //   } else {
  //     return images[selectedImageIndex]['name'];
  //   }
  // }
}

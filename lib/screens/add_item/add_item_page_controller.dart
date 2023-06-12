import 'dart:convert';
import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:image_picker/image_picker.dart';
import 'package:this_4_that/categories.dart';
import 'package:this_4_that/constants/constants.dart';
import 'package:this_4_that/models/categoryType/categoryType.dart';
import 'package:this_4_that/models/item/item.dart';
import 'package:this_4_that/services/firebase_service.dart';
import 'package:this_4_that/services/logger_service.dart';

class AddItemPageController extends GetxController {
  /// DEPENDENCIES

  ///REACTIVE VARIABLES

  final logger = Get.find<LoggerService>();
  final firebaseService = Get.find<FirebaseService>();

  final Rx<Item> _newItem = Item(
      itemPictureList: [],
      itemName: 'itemName',
      itemDescription: 'itemDescription',
      priceRange: 'priceRange',
      condition: 'condition',
      userID: 'userID',
      itemID: 'itemID',
      itemState: 'itemState',
      categoryList: []).obs;
  Item get newItem => _newItem.value;
  set newItem(Item value) => _newItem.value = value;
// reactive variabla

  final itemNameController = TextEditingController();
  final RxBool _itemNameIsEmpty = false.obs;
  bool get itemNameIsEmpty => _itemNameIsEmpty.value;
  set itemNameIsEmpty(bool value) => _itemNameIsEmpty.value = value;

  final itemDescriptionController = TextEditingController();
  final RxBool _itemDescriptionIsEmpty = false.obs;
  bool get itemDescriptionIsEmpty => _itemDescriptionIsEmpty.value;
  set itemDescriptionIsEmpty(bool value) =>
      _itemDescriptionIsEmpty.value = value;

  final RxInt _activeStep = 0.obs;
  int get activeStep => _activeStep.value;
  set activeStep(int value) => _activeStep.value = value;
  // Initial step set to 0.
  final pageController = PageController(
    initialPage: 0,
  );

  final FocusNode node1 = FocusNode();
  final FocusNode node2 = FocusNode();
  final titleController = TextEditingController();
  final descriptionController = TextEditingController();

  // OPTIONAL: can be set directly.
  int dotCount = 5;

  File? image;

  final RxList<File?> _imageList = <File?>[null].obs;
  List<File?> get imageList => _imageList;
  set imageList(List<File?> value) => _imageList.assignAll(value);

  final controller = TextEditingController();

  // final String title;
  final RxBool isOn = false.obs;

  final RxList<String> _pickedCategories = <String>[].obs;
  List<String> get pickedCategories => _pickedCategories;
  set pickedCategories(List<String> value) =>
      _pickedCategories.assignAll(value);

  final RxList<CategoryType> _pickedCategoriesConstants = <CategoryType>[].obs;
  List<CategoryType> get pickedCategoriesConstants =>
      _pickedCategoriesConstants;
  set pickedCategoriesConstants(List<CategoryType> value) =>
      _pickedCategoriesConstants.assignAll(value);

  // List<CategoryType> categories = allCategories;

  // int selectedIndexPrice = -1.obs;
  final RxInt _selectedIndexPrice = 0.obs;
  int get selectedIndexPrice => _selectedIndexPrice.value;
  set selectedIndexPrice(int value) => _selectedIndexPrice.value = value;

  // int selectedIndexCondition = -1.obs;
  final RxInt _selectedIndexCondition = 0.obs;
  int get selectedIndexCondition => _selectedIndexCondition.value;
  set selectedIndexCondition(int value) =>
      _selectedIndexCondition.value = value;

  // final logger = Get.find<LoggerService>();

  String advertType = '';

  /// INIT

  @override
  Future<void> onInit() async {
    super.onInit();

    activeStep = 0;
    addListeners();
    pickedCategoriesConstants = MyConstants.allCategories;
    clearData();
    checkArguments();
  }

  // @override
  // void onInitState() {
  //   // super.onInitState();
  //
  //   titleController.addListener(() {});
  // }

  ///
  /// METHODS
  ///

  void checkArguments() {
    if (Get.arguments != null) {
      final advertTypeKey = Get.arguments.keys
          .firstWhere((key) => key == 'advertType', orElse: () => '');
      if (advertTypeKey.isNotEmpty) {
        advertType = Get.arguments[advertTypeKey];
      }
    }
  }

  void addListeners() {
    //ovaj listener sluzi za saveanje imena predmeta
    itemNameController.addListener(() {
      itemNameIsEmpty = itemNameController.text.isNotEmpty &&
          itemNameController.text.length > 3;
    });
    itemDescriptionController.addListener(() {
      itemDescriptionIsEmpty = itemDescriptionController.text.isNotEmpty &&
          itemDescriptionController.text.length > 3;
    });
  }

  void saveTitleAndDescription() {
    newItem = newItem.copyWith(
        itemName: titleController
            .text, // dohvati pomoću controllera title koji je upisan u title textfield
        itemDescription: descriptionController
            .text); // dohvati pomoću controllera description koji je upisan u description textfield
  }

  void saveItemName() {
    logger.w(itemNameController.text);
    newItem = newItem.copyWith(itemName: itemNameController.text);
    logger.e(newItem);
  }

  void saveItemDescription() {
    logger.w(itemDescriptionController.text);
    newItem = newItem.copyWith(itemDescription: itemDescriptionController.text);
    logger.e(newItem);
  }

  void saveSelectedIndexPrice() {
    logger.w(selectedIndexPrice);
    newItem = newItem.copyWith(
        priceRange: MyConstants.buttonValuesPrice[selectedIndexPrice]);
    logger.e(newItem);
  }

  void saveSelectedIndexCondition() {
    logger.w(selectedIndexCondition);
    newItem = newItem.copyWith(
        condition: MyConstants.buttonValuesCondition[selectedIndexCondition],
        userID: FirebaseAuth.instance.currentUser!.uid,
        itemState: 'active');
    logger.e(newItem);
  }

  void saveSelectedCategories() {
    logger.w(pickedCategories);
    newItem = newItem.copyWith(categoryList: pickedCategories);
    // userID: FirebaseAuth.instance.currentUser!.uid);
    logger.e(newItem);
  }

  Future pickImage() async {
    try {
      final pickedImage =
          await ImagePicker().pickImage(source: ImageSource.gallery);

      if (pickedImage == null) return;
      final imageTemporary = File(pickedImage!.path);

      image = imageTemporary;
      if (imageList.length < 5) {
        imageList.insert(0, image);
      }
    } on PlatformException catch (e) {
      print('Failed to pick image $e');
    }
  }

  List<CategoryType> searchCategory(String query) {
    final suggestions = MyConstants.allCategories.where((category) {
      final categoryTitle = category.category.toLowerCase();
      final input = query.toLowerCase();
      return categoryTitle.contains(input);
    }).toList();

    return MyConstants.allCategories = suggestions;
  }

  int countIsOn(List<CategoryType> categories) {
    int counter = 0;
    for (int i = 0; i < categories.length; ++i) {
      if (categories[i].isOn == true) {
        counter++;
      }
    }
    return counter;
  }

  Future<void> sendItemDataToFirebase() async {
    final itemID = await FirebaseService.instance.sendNewItemData(newItem);
    final imageURLs = await saveImages(itemID);

    await FirebaseService.instance
        .updateItemData({'item_picture_list': imageURLs}, itemID);
  }

  void clearData() {
    newItem = Item(
        itemPictureList: [],
        itemName: 'itemName',
        itemDescription: 'itemDescription',
        priceRange: 'priceRange',
        condition: 'condition',
        userID: 'userID',
        itemID: 'itemID',
        itemState: 'itemState',
        categoryList: []);

    imageList.clear();
    imageList.add(null);
    itemNameController.text = '';
    itemDescriptionController.text = '';
    pickedCategories = [];

    for (var i = 0; i < pickedCategoriesConstants.length; ++i) {
      pickedCategoriesConstants[i] =
          pickedCategoriesConstants[i].copyWith(isOn: false);
    }
    selectedIndexPrice = 0;
    selectedIndexCondition = 0;
  }

  Future<List<String>> saveImages(String itemId) async {
    final imageUrls = <String>[];

    /// upload images to firestore and get image urls back
    for (final file in imageList) {
      if (file != null) {
        final imageUrl =
            await FirebaseService.instance.uploadItemPictures(file, itemId);

        if (imageUrl.isNotEmpty) {
          imageUrls.add(imageUrl);
        }
      }
    }
    return imageUrls;
  }

  void addPickedItemToList(CategoryType pickedCategory) {
    if (pickedCategories.length < 3) {
      pickedCategories.add(pickedCategory.category);

      final index = pickedCategoriesConstants
          .indexWhere((element) => element == pickedCategory);
      final isOn = pickedCategoriesConstants.elementAt(index).isOn;
      pickedCategoriesConstants[index] =
          pickedCategoriesConstants[index].copyWith(isOn: !isOn);
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
  }
}

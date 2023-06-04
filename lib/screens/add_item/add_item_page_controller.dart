import 'dart:convert';
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:this_4_that/categories.dart';
import 'package:this_4_that/models/item/item.dart';

class AddItemPageController extends GetxController {
  /// DEPENDENCIES

  ///REACTIVE VARIABLES
  final Rx<Item> _newItem = Item(
          itemPictureList: [],
          itemName: 'itemName',
          itemDescription: 'itemDescription',
          priceRange: 'priceRange',
          condition: 'condition',
          userID: 'userID',
          itemID: 'itemID',
          location: 'location',
          category: 'category')
      .obs;
  Item get newItem => _newItem.value;
  set newItem(Item value) => _newItem.value = value;
// reactive variabla

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
  List<File?> imageList = [null].obs;

  final controller = TextEditingController();

  List<CategoryType> categories = allCategories;

  int selectedIndexPrice = -1.obs;

  List<String> buttonValuesPrice = [
    "0 - 50 €",
    "50 - 100 €",
    "100 - 200 €",
    "200 - 500 €",
    "500 - 1000 €",
    "1000 - 1500 €",
    "1500+ €",
  ];

  int selectedIndexCondition = -1.obs;

  List<String> buttonValuesCondition = [
    "Novo neraspakirano",
    "Novo raspakirano",
    "Rabljeno bez tragona korištenja",
    "Rabljeno s tragovima korištenja",
    "Rabljeno s defektima",
    "Potrgano / neispravno",
  ];

  // final logger = Get.find<LoggerService>();

  /// INIT

  @override
  Future<void> onInit() async {
    super.onInit();
    activeStep = 0;
  }

  @override
  void onInitState() {
    // super.onInitState();

    titleController.addListener(() {});
  }

  ///
  /// METHODS
  ///

  void saveTitleAndDescription() {
    newItem = newItem.copyWith(
        itemName: titleController
            .text, // dohvati pomoću controllera title koji je upisan u title textfield
        itemDescription: descriptionController
            .text); // dohvati pomoću controllera description koji je upisan u description textfield
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
    final suggestions = allCategories.where((category) {
      final categoryTitle = category.title.toLowerCase();
      final input = query.toLowerCase();
      return categoryTitle.contains(input);
    }).toList();

    return categories = suggestions;
  }
}

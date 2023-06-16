import 'package:get/get.dart';
import 'package:this_4_that/models/match/match.dart';
import 'package:this_4_that/services/firebase_service.dart';
import 'package:this_4_that/services/logger_service.dart';

class MessagesPageController extends GetxController {
  /// DEPENDENCIES

  final firebaseService = Get.find<FirebaseService>();
  final logger = Get.find<LoggerService>();

  ///REACTIVE VARIABLES
  final List messages = [
    'message 1',
    'message 2',
    'message 3',
  ];

  final RxList<MatchedItems> _matchedItemsList = <MatchedItems>[].obs;
  List<MatchedItems> get matchedItemsList => _matchedItemsList;
  set matchedItemsList(List<MatchedItems> value) =>
      _matchedItemsList.assignAll(value);

  bool isActiveButton1On = false;
  bool isActiveButton2On = false;
  bool isActiveButton3On = false;

  /// INIT

  @override
  Future<void> onInit() async {
    super.onInit();
    matchedItemsList = await firebaseService.getUsersMatches();
  }

  ///
  /// METHODS

  Future<void> deleteItemFromMessagesList(
      MatchedItems currentItem, bool isCurrentUserFirst) async {
    await firebaseService.deleteMatchedItemsFromDifferentUsers(
        isCurrentUserFirst ? currentItem.item2ID : currentItem.item1ID);
    matchedItemsList.remove(currentItem);
  }
}

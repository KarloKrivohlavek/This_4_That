import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'swipe_item.freezed.dart';
part 'swipe_item.g.dart';

@freezed
class SwipeItem with _$SwipeItem {
  factory SwipeItem({
    @JsonKey(name: 'item_description') required String itemDescription,
    @JsonKey(name: 'item_name') required String itemName,
    @JsonKey(name: 'condition') required String condition,
    @JsonKey(name: 'location') required String location,
    @JsonKey(name: 'item_picture_list') required List<String> itemPictureList,
    @JsonKey(name: 'user_ID') required String userID,
    @JsonKey(name: 'item_ID') required String itemID,
    @JsonKey(name: 'item_state') required String itemState,
    @JsonKey(name: 'user_pictureURL') required String userPictureURL,
    @JsonKey(name: 'user_name') required String userName,
  }) = _SwipeItem;

  factory SwipeItem.fromJson(Map<String, dynamic> json) =>
      _$SwipeItemFromJson(json);
}

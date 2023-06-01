import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'item.freezed.dart';
part 'item.g.dart';

@freezed
class Item with _$Item {
  factory Item({
    @JsonKey(name: 'item_description') required String itemDescription,
    @JsonKey(name: 'item_name') required String itemName,
    @JsonKey(name: 'location') required String location,
    @JsonKey(name: 'category') required String category,
    @JsonKey(name: 'price_range') required String priceRange,
    @JsonKey(name: 'condition') required String condition,
    @JsonKey(name: 'item_picture_list') List<String>? itemPictureList,
    @JsonKey(name: 'profile_picture') String? profilePicture,
    @JsonKey(name: 'user_ID') required String userID,
    @JsonKey(name: 'item_ID') required String itemID,
  }) = _Item;

  factory Item.fromJson(Map<String, dynamic> json) => _$ItemFromJson(json);
}

import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'item.freezed.dart';
part 'item.g.dart';

@freezed
class Item with _$Item {
  factory Item({
    @JsonKey(name: 'item_description') required String itemDescription,
    @JsonKey(name: 'item_name') required String itemName,
    @JsonKey(name: 'category_list') required List<String?> categoryList,
    @JsonKey(name: 'price_range') required List<String?> priceRange,
    @JsonKey(name: 'condition') required List<String?> condition,
    @JsonKey(name: 'item_picture_list') List<String>? itemPictureList,
    @JsonKey(name: 'user_ID') required String userID,
    @JsonKey(name: 'item_ID') required String itemID,
    @JsonKey(name: 'item_state') required String itemState,
  }) = _Item;

  factory Item.fromJson(Map<String, dynamic> json) => _$ItemFromJson(json);
}

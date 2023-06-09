// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'item.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Item _$$_ItemFromJson(Map<String, dynamic> json) => _$_Item(
      itemDescription: json['item_description'] as String,
      itemName: json['item_name'] as String,
      categoryList: (json['category_list'] as List<dynamic>)
          .map((e) => e as String?)
          .toList(),
      priceRange: json['price_range'] as String,
      condition: json['condition'] as String,
      itemPictureList: (json['item_picture_list'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      userID: json['user_ID'] as String,
      itemID: json['item_ID'] as String,
      itemState: json['item_state'] as String,
    );

Map<String, dynamic> _$$_ItemToJson(_$_Item instance) => <String, dynamic>{
      'item_description': instance.itemDescription,
      'item_name': instance.itemName,
      'category_list': instance.categoryList,
      'price_range': instance.priceRange,
      'condition': instance.condition,
      'item_picture_list': instance.itemPictureList,
      'user_ID': instance.userID,
      'item_ID': instance.itemID,
      'item_state': instance.itemState,
    };

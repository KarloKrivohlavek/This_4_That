// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'swipe_item.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_SwipeItem _$$_SwipeItemFromJson(Map<String, dynamic> json) => _$_SwipeItem(
      itemDescription: json['item_description'] as String,
      itemName: json['item_name'] as String,
      condition: json['condition'] as String,
      location: json['location'] as String,
      itemPictureList: (json['item_picture_list'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
      userID: json['user_ID'] as String,
      itemID: json['item_ID'] as String,
      itemState: json['item_state'] as String,
      userPictureURL: json['user_pictureURL'] as String,
      userName: json['user_name'] as String,
    );

Map<String, dynamic> _$$_SwipeItemToJson(_$_SwipeItem instance) =>
    <String, dynamic>{
      'item_description': instance.itemDescription,
      'item_name': instance.itemName,
      'condition': instance.condition,
      'location': instance.location,
      'item_picture_list': instance.itemPictureList,
      'user_ID': instance.userID,
      'item_ID': instance.itemID,
      'item_state': instance.itemState,
      'user_pictureURL': instance.userPictureURL,
      'user_name': instance.userName,
    };

// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_UserData _$$_UserDataFromJson(Map<String, dynamic> json) => _$_UserData(
      dateOfBirth: json['date_of_birth'] as String,
      description: json['description'] as String,
      fullName: json['full_name'] as String,
      location: json['location'] as String,
      matchedItemListIds: (json['matched_item_list_IDs'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      userItemListIDs: (json['user_item_list_IDs'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      profilePicture: json['profile_picture'] as String?,
      userID: json['user_ID'] as String,
      username: json['username'] as String,
    );

Map<String, dynamic> _$$_UserDataToJson(_$_UserData instance) =>
    <String, dynamic>{
      'date_of_birth': instance.dateOfBirth,
      'description': instance.description,
      'full_name': instance.fullName,
      'location': instance.location,
      'matched_item_list_IDs': instance.matchedItemListIds,
      'user_item_list_IDs': instance.userItemListIDs,
      'profile_picture': instance.profilePicture,
      'user_ID': instance.userID,
      'username': instance.username,
    };

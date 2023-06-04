import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'user.freezed.dart';
part 'user.g.dart';

@freezed
class UserData with _$UserData {
  factory UserData({
    @JsonKey(name: 'date_of_birth') required String dateOfBirth,
    @JsonKey(name: 'description') required String description,
    @JsonKey(name: 'full_name') required String fullName,
    @JsonKey(name: 'location') required String location,
    @JsonKey(name: 'matched_item_list_IDs') List<String>? matchedItemListIds,
    @JsonKey(name: 'user_item_list_IDs') List<String>? userItemListIDs,
    @JsonKey(name: 'profile_picture') String? profilePicture,
    @JsonKey(name: 'user_ID') required String userID,
    @JsonKey(name: 'username') required String username,
  }) = _UserData;

  factory UserData.fromJson(Map<String, dynamic> json) =>
      _$UserDataFromJson(json);
}

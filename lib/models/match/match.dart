import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'match.freezed.dart';
part 'match.g.dart';

@freezed
class MatchedItems with _$MatchedItems {
  factory MatchedItems({
    @JsonKey(name: 'item1_name') required String item1Name,
    @JsonKey(name: 'item2_name') required String item2Name,
    @JsonKey(name: 'user1_username') required String user1Username,
    @JsonKey(name: 'user2_username') required String user2Username,
    @JsonKey(name: 'item1_pictureURL') required String item1PictureURL,
    @JsonKey(name: 'item2_pictureURL') required String item2PictureURL,
    @JsonKey(name: 'user1_ID') required String user1ID,
    @JsonKey(name: 'user2_ID') required String user2ID,
    @JsonKey(name: 'item1_ID') required String item1ID,
    @JsonKey(name: 'item2_ID') required String item2ID,
    @JsonKey(name: 'match_ID') required String matchID,
    @JsonKey(name: 'chat_ID') required String chatID,
  }) = _MatchedItems;

  factory MatchedItems.fromJson(Map<String, dynamic> json) =>
      _$MatchedItemsFromJson(json);
}

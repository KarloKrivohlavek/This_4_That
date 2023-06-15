import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'matched_chat_data.freezed.dart';
part 'matched_chat_data.g.dart';

@freezed
class MatchedChatData with _$MatchedChatData {
  factory MatchedChatData({
    @JsonKey(name: 'user1_ID') required String user1ID,
    @JsonKey(name: 'user2_ID') required String user2ID,
    @JsonKey(name: 'chat_ID') required String chatID,
  }) = _MatchedChatData;

  factory MatchedChatData.fromJson(Map<String, dynamic> json) =>
      _$MatchedChatDataFromJson(json);
}

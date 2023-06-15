// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'matched_chat_data.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

MatchedChatData _$MatchedChatDataFromJson(Map<String, dynamic> json) {
  return _MatchedChatData.fromJson(json);
}

/// @nodoc
mixin _$MatchedChatData {
  @JsonKey(name: 'user1_ID')
  String get user1ID => throw _privateConstructorUsedError;
  @JsonKey(name: 'user2_ID')
  String get user2ID => throw _privateConstructorUsedError;
  @JsonKey(name: 'chat_ID')
  String get chatID => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $MatchedChatDataCopyWith<MatchedChatData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MatchedChatDataCopyWith<$Res> {
  factory $MatchedChatDataCopyWith(
          MatchedChatData value, $Res Function(MatchedChatData) then) =
      _$MatchedChatDataCopyWithImpl<$Res, MatchedChatData>;
  @useResult
  $Res call(
      {@JsonKey(name: 'user1_ID') String user1ID,
      @JsonKey(name: 'user2_ID') String user2ID,
      @JsonKey(name: 'chat_ID') String chatID});
}

/// @nodoc
class _$MatchedChatDataCopyWithImpl<$Res, $Val extends MatchedChatData>
    implements $MatchedChatDataCopyWith<$Res> {
  _$MatchedChatDataCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? user1ID = null,
    Object? user2ID = null,
    Object? chatID = null,
  }) {
    return _then(_value.copyWith(
      user1ID: null == user1ID
          ? _value.user1ID
          : user1ID // ignore: cast_nullable_to_non_nullable
              as String,
      user2ID: null == user2ID
          ? _value.user2ID
          : user2ID // ignore: cast_nullable_to_non_nullable
              as String,
      chatID: null == chatID
          ? _value.chatID
          : chatID // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_MatchedChatDataCopyWith<$Res>
    implements $MatchedChatDataCopyWith<$Res> {
  factory _$$_MatchedChatDataCopyWith(
          _$_MatchedChatData value, $Res Function(_$_MatchedChatData) then) =
      __$$_MatchedChatDataCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'user1_ID') String user1ID,
      @JsonKey(name: 'user2_ID') String user2ID,
      @JsonKey(name: 'chat_ID') String chatID});
}

/// @nodoc
class __$$_MatchedChatDataCopyWithImpl<$Res>
    extends _$MatchedChatDataCopyWithImpl<$Res, _$_MatchedChatData>
    implements _$$_MatchedChatDataCopyWith<$Res> {
  __$$_MatchedChatDataCopyWithImpl(
      _$_MatchedChatData _value, $Res Function(_$_MatchedChatData) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? user1ID = null,
    Object? user2ID = null,
    Object? chatID = null,
  }) {
    return _then(_$_MatchedChatData(
      user1ID: null == user1ID
          ? _value.user1ID
          : user1ID // ignore: cast_nullable_to_non_nullable
              as String,
      user2ID: null == user2ID
          ? _value.user2ID
          : user2ID // ignore: cast_nullable_to_non_nullable
              as String,
      chatID: null == chatID
          ? _value.chatID
          : chatID // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_MatchedChatData
    with DiagnosticableTreeMixin
    implements _MatchedChatData {
  _$_MatchedChatData(
      {@JsonKey(name: 'user1_ID') required this.user1ID,
      @JsonKey(name: 'user2_ID') required this.user2ID,
      @JsonKey(name: 'chat_ID') required this.chatID});

  factory _$_MatchedChatData.fromJson(Map<String, dynamic> json) =>
      _$$_MatchedChatDataFromJson(json);

  @override
  @JsonKey(name: 'user1_ID')
  final String user1ID;
  @override
  @JsonKey(name: 'user2_ID')
  final String user2ID;
  @override
  @JsonKey(name: 'chat_ID')
  final String chatID;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'MatchedChatData(user1ID: $user1ID, user2ID: $user2ID, chatID: $chatID)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'MatchedChatData'))
      ..add(DiagnosticsProperty('user1ID', user1ID))
      ..add(DiagnosticsProperty('user2ID', user2ID))
      ..add(DiagnosticsProperty('chatID', chatID));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_MatchedChatData &&
            (identical(other.user1ID, user1ID) || other.user1ID == user1ID) &&
            (identical(other.user2ID, user2ID) || other.user2ID == user2ID) &&
            (identical(other.chatID, chatID) || other.chatID == chatID));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, user1ID, user2ID, chatID);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_MatchedChatDataCopyWith<_$_MatchedChatData> get copyWith =>
      __$$_MatchedChatDataCopyWithImpl<_$_MatchedChatData>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_MatchedChatDataToJson(
      this,
    );
  }
}

abstract class _MatchedChatData implements MatchedChatData {
  factory _MatchedChatData(
          {@JsonKey(name: 'user1_ID') required final String user1ID,
          @JsonKey(name: 'user2_ID') required final String user2ID,
          @JsonKey(name: 'chat_ID') required final String chatID}) =
      _$_MatchedChatData;

  factory _MatchedChatData.fromJson(Map<String, dynamic> json) =
      _$_MatchedChatData.fromJson;

  @override
  @JsonKey(name: 'user1_ID')
  String get user1ID;
  @override
  @JsonKey(name: 'user2_ID')
  String get user2ID;
  @override
  @JsonKey(name: 'chat_ID')
  String get chatID;
  @override
  @JsonKey(ignore: true)
  _$$_MatchedChatDataCopyWith<_$_MatchedChatData> get copyWith =>
      throw _privateConstructorUsedError;
}

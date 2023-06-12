// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

UserData _$UserDataFromJson(Map<String, dynamic> json) {
  return _UserData.fromJson(json);
}

/// @nodoc
mixin _$UserData {
  @JsonKey(name: 'date_of_birth')
  String get dateOfBirth => throw _privateConstructorUsedError;
  @JsonKey(name: 'description')
  String get description => throw _privateConstructorUsedError;
  @JsonKey(name: 'full_name')
  String get fullName => throw _privateConstructorUsedError;
  @JsonKey(name: 'location')
  String get location => throw _privateConstructorUsedError;
  @JsonKey(name: 'matched_item_list_IDs')
  List<String>? get matchedItemListIds => throw _privateConstructorUsedError;
  @JsonKey(name: 'user_item_list_IDs')
  List<String>? get userItemListIDs => throw _privateConstructorUsedError;
  @JsonKey(name: 'profile_picture')
  String? get profilePicture => throw _privateConstructorUsedError;
  @JsonKey(name: 'user_ID')
  String get userID => throw _privateConstructorUsedError;
  @JsonKey(name: 'username')
  String get username => throw _privateConstructorUsedError;
  @JsonKey(name: 'email')
  String get email => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UserDataCopyWith<UserData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserDataCopyWith<$Res> {
  factory $UserDataCopyWith(UserData value, $Res Function(UserData) then) =
      _$UserDataCopyWithImpl<$Res, UserData>;
  @useResult
  $Res call(
      {@JsonKey(name: 'date_of_birth') String dateOfBirth,
      @JsonKey(name: 'description') String description,
      @JsonKey(name: 'full_name') String fullName,
      @JsonKey(name: 'location') String location,
      @JsonKey(name: 'matched_item_list_IDs') List<String>? matchedItemListIds,
      @JsonKey(name: 'user_item_list_IDs') List<String>? userItemListIDs,
      @JsonKey(name: 'profile_picture') String? profilePicture,
      @JsonKey(name: 'user_ID') String userID,
      @JsonKey(name: 'username') String username,
      @JsonKey(name: 'email') String email});
}

/// @nodoc
class _$UserDataCopyWithImpl<$Res, $Val extends UserData>
    implements $UserDataCopyWith<$Res> {
  _$UserDataCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? dateOfBirth = null,
    Object? description = null,
    Object? fullName = null,
    Object? location = null,
    Object? matchedItemListIds = freezed,
    Object? userItemListIDs = freezed,
    Object? profilePicture = freezed,
    Object? userID = null,
    Object? username = null,
    Object? email = null,
  }) {
    return _then(_value.copyWith(
      dateOfBirth: null == dateOfBirth
          ? _value.dateOfBirth
          : dateOfBirth // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      fullName: null == fullName
          ? _value.fullName
          : fullName // ignore: cast_nullable_to_non_nullable
              as String,
      location: null == location
          ? _value.location
          : location // ignore: cast_nullable_to_non_nullable
              as String,
      matchedItemListIds: freezed == matchedItemListIds
          ? _value.matchedItemListIds
          : matchedItemListIds // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      userItemListIDs: freezed == userItemListIDs
          ? _value.userItemListIDs
          : userItemListIDs // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      profilePicture: freezed == profilePicture
          ? _value.profilePicture
          : profilePicture // ignore: cast_nullable_to_non_nullable
              as String?,
      userID: null == userID
          ? _value.userID
          : userID // ignore: cast_nullable_to_non_nullable
              as String,
      username: null == username
          ? _value.username
          : username // ignore: cast_nullable_to_non_nullable
              as String,
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_UserDataCopyWith<$Res> implements $UserDataCopyWith<$Res> {
  factory _$$_UserDataCopyWith(
          _$_UserData value, $Res Function(_$_UserData) then) =
      __$$_UserDataCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'date_of_birth') String dateOfBirth,
      @JsonKey(name: 'description') String description,
      @JsonKey(name: 'full_name') String fullName,
      @JsonKey(name: 'location') String location,
      @JsonKey(name: 'matched_item_list_IDs') List<String>? matchedItemListIds,
      @JsonKey(name: 'user_item_list_IDs') List<String>? userItemListIDs,
      @JsonKey(name: 'profile_picture') String? profilePicture,
      @JsonKey(name: 'user_ID') String userID,
      @JsonKey(name: 'username') String username,
      @JsonKey(name: 'email') String email});
}

/// @nodoc
class __$$_UserDataCopyWithImpl<$Res>
    extends _$UserDataCopyWithImpl<$Res, _$_UserData>
    implements _$$_UserDataCopyWith<$Res> {
  __$$_UserDataCopyWithImpl(
      _$_UserData _value, $Res Function(_$_UserData) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? dateOfBirth = null,
    Object? description = null,
    Object? fullName = null,
    Object? location = null,
    Object? matchedItemListIds = freezed,
    Object? userItemListIDs = freezed,
    Object? profilePicture = freezed,
    Object? userID = null,
    Object? username = null,
    Object? email = null,
  }) {
    return _then(_$_UserData(
      dateOfBirth: null == dateOfBirth
          ? _value.dateOfBirth
          : dateOfBirth // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      fullName: null == fullName
          ? _value.fullName
          : fullName // ignore: cast_nullable_to_non_nullable
              as String,
      location: null == location
          ? _value.location
          : location // ignore: cast_nullable_to_non_nullable
              as String,
      matchedItemListIds: freezed == matchedItemListIds
          ? _value._matchedItemListIds
          : matchedItemListIds // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      userItemListIDs: freezed == userItemListIDs
          ? _value._userItemListIDs
          : userItemListIDs // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      profilePicture: freezed == profilePicture
          ? _value.profilePicture
          : profilePicture // ignore: cast_nullable_to_non_nullable
              as String?,
      userID: null == userID
          ? _value.userID
          : userID // ignore: cast_nullable_to_non_nullable
              as String,
      username: null == username
          ? _value.username
          : username // ignore: cast_nullable_to_non_nullable
              as String,
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_UserData with DiagnosticableTreeMixin implements _UserData {
  _$_UserData(
      {@JsonKey(name: 'date_of_birth')
          required this.dateOfBirth,
      @JsonKey(name: 'description')
          required this.description,
      @JsonKey(name: 'full_name')
          required this.fullName,
      @JsonKey(name: 'location')
          required this.location,
      @JsonKey(name: 'matched_item_list_IDs')
          final List<String>? matchedItemListIds,
      @JsonKey(name: 'user_item_list_IDs')
          final List<String>? userItemListIDs,
      @JsonKey(name: 'profile_picture')
          this.profilePicture,
      @JsonKey(name: 'user_ID')
          required this.userID,
      @JsonKey(name: 'username')
          required this.username,
      @JsonKey(name: 'email')
          required this.email})
      : _matchedItemListIds = matchedItemListIds,
        _userItemListIDs = userItemListIDs;

  factory _$_UserData.fromJson(Map<String, dynamic> json) =>
      _$$_UserDataFromJson(json);

  @override
  @JsonKey(name: 'date_of_birth')
  final String dateOfBirth;
  @override
  @JsonKey(name: 'description')
  final String description;
  @override
  @JsonKey(name: 'full_name')
  final String fullName;
  @override
  @JsonKey(name: 'location')
  final String location;
  final List<String>? _matchedItemListIds;
  @override
  @JsonKey(name: 'matched_item_list_IDs')
  List<String>? get matchedItemListIds {
    final value = _matchedItemListIds;
    if (value == null) return null;
    if (_matchedItemListIds is EqualUnmodifiableListView)
      return _matchedItemListIds;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  final List<String>? _userItemListIDs;
  @override
  @JsonKey(name: 'user_item_list_IDs')
  List<String>? get userItemListIDs {
    final value = _userItemListIDs;
    if (value == null) return null;
    if (_userItemListIDs is EqualUnmodifiableListView) return _userItemListIDs;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  @JsonKey(name: 'profile_picture')
  final String? profilePicture;
  @override
  @JsonKey(name: 'user_ID')
  final String userID;
  @override
  @JsonKey(name: 'username')
  final String username;
  @override
  @JsonKey(name: 'email')
  final String email;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'UserData(dateOfBirth: $dateOfBirth, description: $description, fullName: $fullName, location: $location, matchedItemListIds: $matchedItemListIds, userItemListIDs: $userItemListIDs, profilePicture: $profilePicture, userID: $userID, username: $username, email: $email)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'UserData'))
      ..add(DiagnosticsProperty('dateOfBirth', dateOfBirth))
      ..add(DiagnosticsProperty('description', description))
      ..add(DiagnosticsProperty('fullName', fullName))
      ..add(DiagnosticsProperty('location', location))
      ..add(DiagnosticsProperty('matchedItemListIds', matchedItemListIds))
      ..add(DiagnosticsProperty('userItemListIDs', userItemListIDs))
      ..add(DiagnosticsProperty('profilePicture', profilePicture))
      ..add(DiagnosticsProperty('userID', userID))
      ..add(DiagnosticsProperty('username', username))
      ..add(DiagnosticsProperty('email', email));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_UserData &&
            (identical(other.dateOfBirth, dateOfBirth) ||
                other.dateOfBirth == dateOfBirth) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.fullName, fullName) ||
                other.fullName == fullName) &&
            (identical(other.location, location) ||
                other.location == location) &&
            const DeepCollectionEquality()
                .equals(other._matchedItemListIds, _matchedItemListIds) &&
            const DeepCollectionEquality()
                .equals(other._userItemListIDs, _userItemListIDs) &&
            (identical(other.profilePicture, profilePicture) ||
                other.profilePicture == profilePicture) &&
            (identical(other.userID, userID) || other.userID == userID) &&
            (identical(other.username, username) ||
                other.username == username) &&
            (identical(other.email, email) || other.email == email));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      dateOfBirth,
      description,
      fullName,
      location,
      const DeepCollectionEquality().hash(_matchedItemListIds),
      const DeepCollectionEquality().hash(_userItemListIDs),
      profilePicture,
      userID,
      username,
      email);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_UserDataCopyWith<_$_UserData> get copyWith =>
      __$$_UserDataCopyWithImpl<_$_UserData>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_UserDataToJson(
      this,
    );
  }
}

abstract class _UserData implements UserData {
  factory _UserData(
      {@JsonKey(name: 'date_of_birth')
          required final String dateOfBirth,
      @JsonKey(name: 'description')
          required final String description,
      @JsonKey(name: 'full_name')
          required final String fullName,
      @JsonKey(name: 'location')
          required final String location,
      @JsonKey(name: 'matched_item_list_IDs')
          final List<String>? matchedItemListIds,
      @JsonKey(name: 'user_item_list_IDs')
          final List<String>? userItemListIDs,
      @JsonKey(name: 'profile_picture')
          final String? profilePicture,
      @JsonKey(name: 'user_ID')
          required final String userID,
      @JsonKey(name: 'username')
          required final String username,
      @JsonKey(name: 'email')
          required final String email}) = _$_UserData;

  factory _UserData.fromJson(Map<String, dynamic> json) = _$_UserData.fromJson;

  @override
  @JsonKey(name: 'date_of_birth')
  String get dateOfBirth;
  @override
  @JsonKey(name: 'description')
  String get description;
  @override
  @JsonKey(name: 'full_name')
  String get fullName;
  @override
  @JsonKey(name: 'location')
  String get location;
  @override
  @JsonKey(name: 'matched_item_list_IDs')
  List<String>? get matchedItemListIds;
  @override
  @JsonKey(name: 'user_item_list_IDs')
  List<String>? get userItemListIDs;
  @override
  @JsonKey(name: 'profile_picture')
  String? get profilePicture;
  @override
  @JsonKey(name: 'user_ID')
  String get userID;
  @override
  @JsonKey(name: 'username')
  String get username;
  @override
  @JsonKey(name: 'email')
  String get email;
  @override
  @JsonKey(ignore: true)
  _$$_UserDataCopyWith<_$_UserData> get copyWith =>
      throw _privateConstructorUsedError;
}

// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'item.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Item _$ItemFromJson(Map<String, dynamic> json) {
  return _Item.fromJson(json);
}

/// @nodoc
mixin _$Item {
  @JsonKey(name: 'item_description')
  String get itemDescription => throw _privateConstructorUsedError;
  @JsonKey(name: 'item_name')
  String get itemName => throw _privateConstructorUsedError;
  @JsonKey(name: 'location')
  String get location => throw _privateConstructorUsedError;
  @JsonKey(name: 'category_list')
  List<String?> get categoryList => throw _privateConstructorUsedError;
  @JsonKey(name: 'price_range')
  String get priceRange => throw _privateConstructorUsedError;
  @JsonKey(name: 'condition')
  String get condition => throw _privateConstructorUsedError;
  @JsonKey(name: 'item_picture_list')
  List<String>? get itemPictureList => throw _privateConstructorUsedError;
  @JsonKey(name: 'profile_picture')
  String? get profilePicture => throw _privateConstructorUsedError;
  @JsonKey(name: 'user_ID')
  String get userID => throw _privateConstructorUsedError;
  @JsonKey(name: 'item_ID')
  String get itemID => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ItemCopyWith<Item> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ItemCopyWith<$Res> {
  factory $ItemCopyWith(Item value, $Res Function(Item) then) =
      _$ItemCopyWithImpl<$Res, Item>;
  @useResult
  $Res call(
      {@JsonKey(name: 'item_description') String itemDescription,
      @JsonKey(name: 'item_name') String itemName,
      @JsonKey(name: 'location') String location,
      @JsonKey(name: 'category_list') List<String?> categoryList,
      @JsonKey(name: 'price_range') String priceRange,
      @JsonKey(name: 'condition') String condition,
      @JsonKey(name: 'item_picture_list') List<String>? itemPictureList,
      @JsonKey(name: 'profile_picture') String? profilePicture,
      @JsonKey(name: 'user_ID') String userID,
      @JsonKey(name: 'item_ID') String itemID});
}

/// @nodoc
class _$ItemCopyWithImpl<$Res, $Val extends Item>
    implements $ItemCopyWith<$Res> {
  _$ItemCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? itemDescription = null,
    Object? itemName = null,
    Object? location = null,
    Object? categoryList = null,
    Object? priceRange = null,
    Object? condition = null,
    Object? itemPictureList = freezed,
    Object? profilePicture = freezed,
    Object? userID = null,
    Object? itemID = null,
  }) {
    return _then(_value.copyWith(
      itemDescription: null == itemDescription
          ? _value.itemDescription
          : itemDescription // ignore: cast_nullable_to_non_nullable
              as String,
      itemName: null == itemName
          ? _value.itemName
          : itemName // ignore: cast_nullable_to_non_nullable
              as String,
      location: null == location
          ? _value.location
          : location // ignore: cast_nullable_to_non_nullable
              as String,
      categoryList: null == categoryList
          ? _value.categoryList
          : categoryList // ignore: cast_nullable_to_non_nullable
              as List<String?>,
      priceRange: null == priceRange
          ? _value.priceRange
          : priceRange // ignore: cast_nullable_to_non_nullable
              as String,
      condition: null == condition
          ? _value.condition
          : condition // ignore: cast_nullable_to_non_nullable
              as String,
      itemPictureList: freezed == itemPictureList
          ? _value.itemPictureList
          : itemPictureList // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      profilePicture: freezed == profilePicture
          ? _value.profilePicture
          : profilePicture // ignore: cast_nullable_to_non_nullable
              as String?,
      userID: null == userID
          ? _value.userID
          : userID // ignore: cast_nullable_to_non_nullable
              as String,
      itemID: null == itemID
          ? _value.itemID
          : itemID // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_ItemCopyWith<$Res> implements $ItemCopyWith<$Res> {
  factory _$$_ItemCopyWith(_$_Item value, $Res Function(_$_Item) then) =
      __$$_ItemCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'item_description') String itemDescription,
      @JsonKey(name: 'item_name') String itemName,
      @JsonKey(name: 'location') String location,
      @JsonKey(name: 'category_list') List<String?> categoryList,
      @JsonKey(name: 'price_range') String priceRange,
      @JsonKey(name: 'condition') String condition,
      @JsonKey(name: 'item_picture_list') List<String>? itemPictureList,
      @JsonKey(name: 'profile_picture') String? profilePicture,
      @JsonKey(name: 'user_ID') String userID,
      @JsonKey(name: 'item_ID') String itemID});
}

/// @nodoc
class __$$_ItemCopyWithImpl<$Res> extends _$ItemCopyWithImpl<$Res, _$_Item>
    implements _$$_ItemCopyWith<$Res> {
  __$$_ItemCopyWithImpl(_$_Item _value, $Res Function(_$_Item) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? itemDescription = null,
    Object? itemName = null,
    Object? location = null,
    Object? categoryList = null,
    Object? priceRange = null,
    Object? condition = null,
    Object? itemPictureList = freezed,
    Object? profilePicture = freezed,
    Object? userID = null,
    Object? itemID = null,
  }) {
    return _then(_$_Item(
      itemDescription: null == itemDescription
          ? _value.itemDescription
          : itemDescription // ignore: cast_nullable_to_non_nullable
              as String,
      itemName: null == itemName
          ? _value.itemName
          : itemName // ignore: cast_nullable_to_non_nullable
              as String,
      location: null == location
          ? _value.location
          : location // ignore: cast_nullable_to_non_nullable
              as String,
      categoryList: null == categoryList
          ? _value._categoryList
          : categoryList // ignore: cast_nullable_to_non_nullable
              as List<String?>,
      priceRange: null == priceRange
          ? _value.priceRange
          : priceRange // ignore: cast_nullable_to_non_nullable
              as String,
      condition: null == condition
          ? _value.condition
          : condition // ignore: cast_nullable_to_non_nullable
              as String,
      itemPictureList: freezed == itemPictureList
          ? _value._itemPictureList
          : itemPictureList // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      profilePicture: freezed == profilePicture
          ? _value.profilePicture
          : profilePicture // ignore: cast_nullable_to_non_nullable
              as String?,
      userID: null == userID
          ? _value.userID
          : userID // ignore: cast_nullable_to_non_nullable
              as String,
      itemID: null == itemID
          ? _value.itemID
          : itemID // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Item with DiagnosticableTreeMixin implements _Item {
  _$_Item(
      {@JsonKey(name: 'item_description') required this.itemDescription,
      @JsonKey(name: 'item_name') required this.itemName,
      @JsonKey(name: 'location') required this.location,
      @JsonKey(name: 'category_list') required final List<String?> categoryList,
      @JsonKey(name: 'price_range') required this.priceRange,
      @JsonKey(name: 'condition') required this.condition,
      @JsonKey(name: 'item_picture_list') final List<String>? itemPictureList,
      @JsonKey(name: 'profile_picture') this.profilePicture,
      @JsonKey(name: 'user_ID') required this.userID,
      @JsonKey(name: 'item_ID') required this.itemID})
      : _categoryList = categoryList,
        _itemPictureList = itemPictureList;

  factory _$_Item.fromJson(Map<String, dynamic> json) => _$$_ItemFromJson(json);

  @override
  @JsonKey(name: 'item_description')
  final String itemDescription;
  @override
  @JsonKey(name: 'item_name')
  final String itemName;
  @override
  @JsonKey(name: 'location')
  final String location;
  final List<String?> _categoryList;
  @override
  @JsonKey(name: 'category_list')
  List<String?> get categoryList {
    if (_categoryList is EqualUnmodifiableListView) return _categoryList;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_categoryList);
  }

  @override
  @JsonKey(name: 'price_range')
  final String priceRange;
  @override
  @JsonKey(name: 'condition')
  final String condition;
  final List<String>? _itemPictureList;
  @override
  @JsonKey(name: 'item_picture_list')
  List<String>? get itemPictureList {
    final value = _itemPictureList;
    if (value == null) return null;
    if (_itemPictureList is EqualUnmodifiableListView) return _itemPictureList;
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
  @JsonKey(name: 'item_ID')
  final String itemID;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'Item(itemDescription: $itemDescription, itemName: $itemName, location: $location, categoryList: $categoryList, priceRange: $priceRange, condition: $condition, itemPictureList: $itemPictureList, profilePicture: $profilePicture, userID: $userID, itemID: $itemID)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'Item'))
      ..add(DiagnosticsProperty('itemDescription', itemDescription))
      ..add(DiagnosticsProperty('itemName', itemName))
      ..add(DiagnosticsProperty('location', location))
      ..add(DiagnosticsProperty('categoryList', categoryList))
      ..add(DiagnosticsProperty('priceRange', priceRange))
      ..add(DiagnosticsProperty('condition', condition))
      ..add(DiagnosticsProperty('itemPictureList', itemPictureList))
      ..add(DiagnosticsProperty('profilePicture', profilePicture))
      ..add(DiagnosticsProperty('userID', userID))
      ..add(DiagnosticsProperty('itemID', itemID));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Item &&
            (identical(other.itemDescription, itemDescription) ||
                other.itemDescription == itemDescription) &&
            (identical(other.itemName, itemName) ||
                other.itemName == itemName) &&
            (identical(other.location, location) ||
                other.location == location) &&
            const DeepCollectionEquality()
                .equals(other._categoryList, _categoryList) &&
            (identical(other.priceRange, priceRange) ||
                other.priceRange == priceRange) &&
            (identical(other.condition, condition) ||
                other.condition == condition) &&
            const DeepCollectionEquality()
                .equals(other._itemPictureList, _itemPictureList) &&
            (identical(other.profilePicture, profilePicture) ||
                other.profilePicture == profilePicture) &&
            (identical(other.userID, userID) || other.userID == userID) &&
            (identical(other.itemID, itemID) || other.itemID == itemID));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      itemDescription,
      itemName,
      location,
      const DeepCollectionEquality().hash(_categoryList),
      priceRange,
      condition,
      const DeepCollectionEquality().hash(_itemPictureList),
      profilePicture,
      userID,
      itemID);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ItemCopyWith<_$_Item> get copyWith =>
      __$$_ItemCopyWithImpl<_$_Item>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ItemToJson(
      this,
    );
  }
}

abstract class _Item implements Item {
  factory _Item(
      {@JsonKey(name: 'item_description') required final String itemDescription,
      @JsonKey(name: 'item_name') required final String itemName,
      @JsonKey(name: 'location') required final String location,
      @JsonKey(name: 'category_list') required final List<String?> categoryList,
      @JsonKey(name: 'price_range') required final String priceRange,
      @JsonKey(name: 'condition') required final String condition,
      @JsonKey(name: 'item_picture_list') final List<String>? itemPictureList,
      @JsonKey(name: 'profile_picture') final String? profilePicture,
      @JsonKey(name: 'user_ID') required final String userID,
      @JsonKey(name: 'item_ID') required final String itemID}) = _$_Item;

  factory _Item.fromJson(Map<String, dynamic> json) = _$_Item.fromJson;

  @override
  @JsonKey(name: 'item_description')
  String get itemDescription;
  @override
  @JsonKey(name: 'item_name')
  String get itemName;
  @override
  @JsonKey(name: 'location')
  String get location;
  @override
  @JsonKey(name: 'category_list')
  List<String?> get categoryList;
  @override
  @JsonKey(name: 'price_range')
  String get priceRange;
  @override
  @JsonKey(name: 'condition')
  String get condition;
  @override
  @JsonKey(name: 'item_picture_list')
  List<String>? get itemPictureList;
  @override
  @JsonKey(name: 'profile_picture')
  String? get profilePicture;
  @override
  @JsonKey(name: 'user_ID')
  String get userID;
  @override
  @JsonKey(name: 'item_ID')
  String get itemID;
  @override
  @JsonKey(ignore: true)
  _$$_ItemCopyWith<_$_Item> get copyWith => throw _privateConstructorUsedError;
}

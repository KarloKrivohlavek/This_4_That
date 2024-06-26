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
  @JsonKey(name: 'category_list')
  List<String?> get categoryList => throw _privateConstructorUsedError;
  @JsonKey(name: 'price_range')
  List<String?> get priceRange => throw _privateConstructorUsedError;
  @JsonKey(name: 'condition')
  List<String?> get condition => throw _privateConstructorUsedError;
  @JsonKey(name: 'item_picture_list')
  List<String>? get itemPictureList => throw _privateConstructorUsedError;
  @JsonKey(name: 'user_ID')
  String get userID => throw _privateConstructorUsedError;
  @JsonKey(name: 'item_ID')
  String get itemID => throw _privateConstructorUsedError;
  @JsonKey(name: 'item_state')
  String get itemState => throw _privateConstructorUsedError;

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
      @JsonKey(name: 'category_list') List<String?> categoryList,
      @JsonKey(name: 'price_range') List<String?> priceRange,
      @JsonKey(name: 'condition') List<String?> condition,
      @JsonKey(name: 'item_picture_list') List<String>? itemPictureList,
      @JsonKey(name: 'user_ID') String userID,
      @JsonKey(name: 'item_ID') String itemID,
      @JsonKey(name: 'item_state') String itemState});
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
    Object? categoryList = null,
    Object? priceRange = null,
    Object? condition = null,
    Object? itemPictureList = freezed,
    Object? userID = null,
    Object? itemID = null,
    Object? itemState = null,
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
      categoryList: null == categoryList
          ? _value.categoryList
          : categoryList // ignore: cast_nullable_to_non_nullable
              as List<String?>,
      priceRange: null == priceRange
          ? _value.priceRange
          : priceRange // ignore: cast_nullable_to_non_nullable
              as List<String?>,
      condition: null == condition
          ? _value.condition
          : condition // ignore: cast_nullable_to_non_nullable
              as List<String?>,
      itemPictureList: freezed == itemPictureList
          ? _value.itemPictureList
          : itemPictureList // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      userID: null == userID
          ? _value.userID
          : userID // ignore: cast_nullable_to_non_nullable
              as String,
      itemID: null == itemID
          ? _value.itemID
          : itemID // ignore: cast_nullable_to_non_nullable
              as String,
      itemState: null == itemState
          ? _value.itemState
          : itemState // ignore: cast_nullable_to_non_nullable
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
      @JsonKey(name: 'category_list') List<String?> categoryList,
      @JsonKey(name: 'price_range') List<String?> priceRange,
      @JsonKey(name: 'condition') List<String?> condition,
      @JsonKey(name: 'item_picture_list') List<String>? itemPictureList,
      @JsonKey(name: 'user_ID') String userID,
      @JsonKey(name: 'item_ID') String itemID,
      @JsonKey(name: 'item_state') String itemState});
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
    Object? categoryList = null,
    Object? priceRange = null,
    Object? condition = null,
    Object? itemPictureList = freezed,
    Object? userID = null,
    Object? itemID = null,
    Object? itemState = null,
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
      categoryList: null == categoryList
          ? _value._categoryList
          : categoryList // ignore: cast_nullable_to_non_nullable
              as List<String?>,
      priceRange: null == priceRange
          ? _value._priceRange
          : priceRange // ignore: cast_nullable_to_non_nullable
              as List<String?>,
      condition: null == condition
          ? _value._condition
          : condition // ignore: cast_nullable_to_non_nullable
              as List<String?>,
      itemPictureList: freezed == itemPictureList
          ? _value._itemPictureList
          : itemPictureList // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      userID: null == userID
          ? _value.userID
          : userID // ignore: cast_nullable_to_non_nullable
              as String,
      itemID: null == itemID
          ? _value.itemID
          : itemID // ignore: cast_nullable_to_non_nullable
              as String,
      itemState: null == itemState
          ? _value.itemState
          : itemState // ignore: cast_nullable_to_non_nullable
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
      @JsonKey(name: 'category_list') required final List<String?> categoryList,
      @JsonKey(name: 'price_range') required final List<String?> priceRange,
      @JsonKey(name: 'condition') required final List<String?> condition,
      @JsonKey(name: 'item_picture_list') final List<String>? itemPictureList,
      @JsonKey(name: 'user_ID') required this.userID,
      @JsonKey(name: 'item_ID') required this.itemID,
      @JsonKey(name: 'item_state') required this.itemState})
      : _categoryList = categoryList,
        _priceRange = priceRange,
        _condition = condition,
        _itemPictureList = itemPictureList;

  factory _$_Item.fromJson(Map<String, dynamic> json) => _$$_ItemFromJson(json);

  @override
  @JsonKey(name: 'item_description')
  final String itemDescription;
  @override
  @JsonKey(name: 'item_name')
  final String itemName;
  final List<String?> _categoryList;
  @override
  @JsonKey(name: 'category_list')
  List<String?> get categoryList {
    if (_categoryList is EqualUnmodifiableListView) return _categoryList;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_categoryList);
  }

  final List<String?> _priceRange;
  @override
  @JsonKey(name: 'price_range')
  List<String?> get priceRange {
    if (_priceRange is EqualUnmodifiableListView) return _priceRange;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_priceRange);
  }

  final List<String?> _condition;
  @override
  @JsonKey(name: 'condition')
  List<String?> get condition {
    if (_condition is EqualUnmodifiableListView) return _condition;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_condition);
  }

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
  @JsonKey(name: 'user_ID')
  final String userID;
  @override
  @JsonKey(name: 'item_ID')
  final String itemID;
  @override
  @JsonKey(name: 'item_state')
  final String itemState;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'Item(itemDescription: $itemDescription, itemName: $itemName, categoryList: $categoryList, priceRange: $priceRange, condition: $condition, itemPictureList: $itemPictureList, userID: $userID, itemID: $itemID, itemState: $itemState)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'Item'))
      ..add(DiagnosticsProperty('itemDescription', itemDescription))
      ..add(DiagnosticsProperty('itemName', itemName))
      ..add(DiagnosticsProperty('categoryList', categoryList))
      ..add(DiagnosticsProperty('priceRange', priceRange))
      ..add(DiagnosticsProperty('condition', condition))
      ..add(DiagnosticsProperty('itemPictureList', itemPictureList))
      ..add(DiagnosticsProperty('userID', userID))
      ..add(DiagnosticsProperty('itemID', itemID))
      ..add(DiagnosticsProperty('itemState', itemState));
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
            const DeepCollectionEquality()
                .equals(other._categoryList, _categoryList) &&
            const DeepCollectionEquality()
                .equals(other._priceRange, _priceRange) &&
            const DeepCollectionEquality()
                .equals(other._condition, _condition) &&
            const DeepCollectionEquality()
                .equals(other._itemPictureList, _itemPictureList) &&
            (identical(other.userID, userID) || other.userID == userID) &&
            (identical(other.itemID, itemID) || other.itemID == itemID) &&
            (identical(other.itemState, itemState) ||
                other.itemState == itemState));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      itemDescription,
      itemName,
      const DeepCollectionEquality().hash(_categoryList),
      const DeepCollectionEquality().hash(_priceRange),
      const DeepCollectionEquality().hash(_condition),
      const DeepCollectionEquality().hash(_itemPictureList),
      userID,
      itemID,
      itemState);

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
      @JsonKey(name: 'category_list') required final List<String?> categoryList,
      @JsonKey(name: 'price_range') required final List<String?> priceRange,
      @JsonKey(name: 'condition') required final List<String?> condition,
      @JsonKey(name: 'item_picture_list') final List<String>? itemPictureList,
      @JsonKey(name: 'user_ID') required final String userID,
      @JsonKey(name: 'item_ID') required final String itemID,
      @JsonKey(name: 'item_state') required final String itemState}) = _$_Item;

  factory _Item.fromJson(Map<String, dynamic> json) = _$_Item.fromJson;

  @override
  @JsonKey(name: 'item_description')
  String get itemDescription;
  @override
  @JsonKey(name: 'item_name')
  String get itemName;
  @override
  @JsonKey(name: 'category_list')
  List<String?> get categoryList;
  @override
  @JsonKey(name: 'price_range')
  List<String?> get priceRange;
  @override
  @JsonKey(name: 'condition')
  List<String?> get condition;
  @override
  @JsonKey(name: 'item_picture_list')
  List<String>? get itemPictureList;
  @override
  @JsonKey(name: 'user_ID')
  String get userID;
  @override
  @JsonKey(name: 'item_ID')
  String get itemID;
  @override
  @JsonKey(name: 'item_state')
  String get itemState;
  @override
  @JsonKey(ignore: true)
  _$$_ItemCopyWith<_$_Item> get copyWith => throw _privateConstructorUsedError;
}

// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'categoryType.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

CategoryType _$CategoryTypeFromJson(Map<String, dynamic> json) {
  return _CategoryType.fromJson(json);
}

/// @nodoc
mixin _$CategoryType {
  @JsonKey(name: 'category')
  String get category => throw _privateConstructorUsedError;
  @JsonKey(name: 'isOn')
  bool get isOn => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CategoryTypeCopyWith<CategoryType> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CategoryTypeCopyWith<$Res> {
  factory $CategoryTypeCopyWith(
          CategoryType value, $Res Function(CategoryType) then) =
      _$CategoryTypeCopyWithImpl<$Res, CategoryType>;
  @useResult
  $Res call(
      {@JsonKey(name: 'category') String category,
      @JsonKey(name: 'isOn') bool isOn});
}

/// @nodoc
class _$CategoryTypeCopyWithImpl<$Res, $Val extends CategoryType>
    implements $CategoryTypeCopyWith<$Res> {
  _$CategoryTypeCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? category = null,
    Object? isOn = null,
  }) {
    return _then(_value.copyWith(
      category: null == category
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as String,
      isOn: null == isOn
          ? _value.isOn
          : isOn // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_CategoryTypeCopyWith<$Res>
    implements $CategoryTypeCopyWith<$Res> {
  factory _$$_CategoryTypeCopyWith(
          _$_CategoryType value, $Res Function(_$_CategoryType) then) =
      __$$_CategoryTypeCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'category') String category,
      @JsonKey(name: 'isOn') bool isOn});
}

/// @nodoc
class __$$_CategoryTypeCopyWithImpl<$Res>
    extends _$CategoryTypeCopyWithImpl<$Res, _$_CategoryType>
    implements _$$_CategoryTypeCopyWith<$Res> {
  __$$_CategoryTypeCopyWithImpl(
      _$_CategoryType _value, $Res Function(_$_CategoryType) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? category = null,
    Object? isOn = null,
  }) {
    return _then(_$_CategoryType(
      category: null == category
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as String,
      isOn: null == isOn
          ? _value.isOn
          : isOn // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_CategoryType with DiagnosticableTreeMixin implements _CategoryType {
  _$_CategoryType(
      {@JsonKey(name: 'category') required this.category,
      @JsonKey(name: 'isOn') required this.isOn});

  factory _$_CategoryType.fromJson(Map<String, dynamic> json) =>
      _$$_CategoryTypeFromJson(json);

  @override
  @JsonKey(name: 'category')
  final String category;
  @override
  @JsonKey(name: 'isOn')
  final bool isOn;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'CategoryType(category: $category, isOn: $isOn)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'CategoryType'))
      ..add(DiagnosticsProperty('category', category))
      ..add(DiagnosticsProperty('isOn', isOn));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_CategoryType &&
            (identical(other.category, category) ||
                other.category == category) &&
            (identical(other.isOn, isOn) || other.isOn == isOn));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, category, isOn);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_CategoryTypeCopyWith<_$_CategoryType> get copyWith =>
      __$$_CategoryTypeCopyWithImpl<_$_CategoryType>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_CategoryTypeToJson(
      this,
    );
  }
}

abstract class _CategoryType implements CategoryType {
  factory _CategoryType(
      {@JsonKey(name: 'category') required final String category,
      @JsonKey(name: 'isOn') required final bool isOn}) = _$_CategoryType;

  factory _CategoryType.fromJson(Map<String, dynamic> json) =
      _$_CategoryType.fromJson;

  @override
  @JsonKey(name: 'category')
  String get category;
  @override
  @JsonKey(name: 'isOn')
  bool get isOn;
  @override
  @JsonKey(ignore: true)
  _$$_CategoryTypeCopyWith<_$_CategoryType> get copyWith =>
      throw _privateConstructorUsedError;
}

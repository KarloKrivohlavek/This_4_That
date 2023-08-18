// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'price_filter.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

PriceFilter _$PriceFilterFromJson(Map<String, dynamic> json) {
  return _PriceFilter.fromJson(json);
}

/// @nodoc
mixin _$PriceFilter {
  @JsonKey(name: 'price')
  String get price => throw _privateConstructorUsedError;
  @JsonKey(name: 'isOn')
  bool get isOn => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PriceFilterCopyWith<PriceFilter> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PriceFilterCopyWith<$Res> {
  factory $PriceFilterCopyWith(
          PriceFilter value, $Res Function(PriceFilter) then) =
      _$PriceFilterCopyWithImpl<$Res, PriceFilter>;
  @useResult
  $Res call(
      {@JsonKey(name: 'price') String price, @JsonKey(name: 'isOn') bool isOn});
}

/// @nodoc
class _$PriceFilterCopyWithImpl<$Res, $Val extends PriceFilter>
    implements $PriceFilterCopyWith<$Res> {
  _$PriceFilterCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? price = null,
    Object? isOn = null,
  }) {
    return _then(_value.copyWith(
      price: null == price
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as String,
      isOn: null == isOn
          ? _value.isOn
          : isOn // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_PriceFilterCopyWith<$Res>
    implements $PriceFilterCopyWith<$Res> {
  factory _$$_PriceFilterCopyWith(
          _$_PriceFilter value, $Res Function(_$_PriceFilter) then) =
      __$$_PriceFilterCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'price') String price, @JsonKey(name: 'isOn') bool isOn});
}

/// @nodoc
class __$$_PriceFilterCopyWithImpl<$Res>
    extends _$PriceFilterCopyWithImpl<$Res, _$_PriceFilter>
    implements _$$_PriceFilterCopyWith<$Res> {
  __$$_PriceFilterCopyWithImpl(
      _$_PriceFilter _value, $Res Function(_$_PriceFilter) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? price = null,
    Object? isOn = null,
  }) {
    return _then(_$_PriceFilter(
      price: null == price
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
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
class _$_PriceFilter with DiagnosticableTreeMixin implements _PriceFilter {
  _$_PriceFilter(
      {@JsonKey(name: 'price') required this.price,
      @JsonKey(name: 'isOn') required this.isOn});

  factory _$_PriceFilter.fromJson(Map<String, dynamic> json) =>
      _$$_PriceFilterFromJson(json);

  @override
  @JsonKey(name: 'price')
  final String price;
  @override
  @JsonKey(name: 'isOn')
  final bool isOn;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'PriceFilter(price: $price, isOn: $isOn)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'PriceFilter'))
      ..add(DiagnosticsProperty('price', price))
      ..add(DiagnosticsProperty('isOn', isOn));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_PriceFilter &&
            (identical(other.price, price) || other.price == price) &&
            (identical(other.isOn, isOn) || other.isOn == isOn));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, price, isOn);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_PriceFilterCopyWith<_$_PriceFilter> get copyWith =>
      __$$_PriceFilterCopyWithImpl<_$_PriceFilter>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_PriceFilterToJson(
      this,
    );
  }
}

abstract class _PriceFilter implements PriceFilter {
  factory _PriceFilter(
      {@JsonKey(name: 'price') required final String price,
      @JsonKey(name: 'isOn') required final bool isOn}) = _$_PriceFilter;

  factory _PriceFilter.fromJson(Map<String, dynamic> json) =
      _$_PriceFilter.fromJson;

  @override
  @JsonKey(name: 'price')
  String get price;
  @override
  @JsonKey(name: 'isOn')
  bool get isOn;
  @override
  @JsonKey(ignore: true)
  _$$_PriceFilterCopyWith<_$_PriceFilter> get copyWith =>
      throw _privateConstructorUsedError;
}

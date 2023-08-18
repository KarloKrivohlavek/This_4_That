import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'price_filter.freezed.dart';
part 'price_filter.g.dart';

@freezed
class PriceFilter with _$PriceFilter {
  factory PriceFilter({
    @JsonKey(name: 'price') required String price,
    @JsonKey(name: 'isOn') required bool isOn,
  }) = _PriceFilter;

  factory PriceFilter.fromJson(Map<String, dynamic> json) =>
      _$PriceFilterFromJson(json);
}

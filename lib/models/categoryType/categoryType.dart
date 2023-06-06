import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'categoryType.freezed.dart';
part 'categoryType.g.dart';

@freezed
class CategoryType with _$CategoryType {
  factory CategoryType({
    @JsonKey(name: 'category') required String category,
    @JsonKey(name: 'isOn') required bool isOn,
  }) = _CategoryType;

  factory CategoryType.fromJson(Map<String, dynamic> json) =>
      _$CategoryTypeFromJson(json);
}

import 'dart:convert';

class SwapItem {
  final String title;
  final String subtitle;
  final String description;
  final List<String> imagesNames;
  final bool isMatched;

  SwapItem({
    required this.title,
    required this.subtitle,
    required this.description,
    required this.imagesNames,
    this.isMatched = false,
  });

  SwapItem copyWith({
    String? title,
    String? subtitle,
    String? description,
    List<String>? imagesNames,
    bool? isMatched,
  }) =>
      SwapItem(
        title: title ?? this.title,
        subtitle: subtitle ?? this.subtitle,
        description: description ?? this.description,
        imagesNames: imagesNames ?? this.imagesNames,
        isMatched: isMatched ?? this.isMatched,
      );

  Map<String, dynamic> toMap() => {
        'title': title,
        'subtitle': subtitle,
        'description': description,
        'imagesNames': imagesNames,
        'isMatched': isMatched,
      };

  factory SwapItem.fromMap(Map<String, dynamic> map) => SwapItem(
        title: map['title'] ?? '',
        subtitle: map['subtitle'] ?? '',
        description: map['description'] ?? '',
        imagesNames: map['imagesNames'] ?? [],
        isMatched: map['isMatched'] ?? false,
      );

  String toJson() => json.encode(toMap());

  factory SwapItem.fromJson(String source) =>
      SwapItem.fromMap(json.decode(source));

  @override
  String toString() =>
      'SwapItem(title: $title, subtitle: $subtitle, description: $description,imagesNames: $imagesNames, isMatched: $isMatched)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }

    return other is SwapItem &&
        other.title == title &&
        other.subtitle == subtitle &&
        other.description == description &&
        other.imagesNames == imagesNames &&
        other.isMatched == isMatched;
  }

  @override
  int get hashCode =>
      title.hashCode ^
      subtitle.hashCode ^
      description.hashCode ^
      imagesNames.hashCode ^
      isMatched.hashCode;
}

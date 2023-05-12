import 'dart:convert';

class SwapItem {
  final String title;
  final String subtitle;
  final String description;
  final String location;
  final String age;
  final String condition;
  final String userName;
  final double rating;
  final String image;
  final String userProfilePicture;
  final List<String> imagesURLs;
  final String userID;
  final String itemID;
  final bool isArchived;
  final bool isMatched;

  SwapItem({
    required this.title,
    required this.subtitle,
    required this.description,
    required this.imagesURLs,
    required this.location,
    required this.age,
    required this.condition,
    required this.image,
    required this.userName,
    required this.userProfilePicture,
    required this.rating,
    required this.userID,
    required this.itemID,
    this.isMatched = false,
    this.isArchived = false,
  });

  SwapItem copyWith({
    String? title,
    String? subtitle,
    String? description,
    String? location,
    String? age,
    String? condition,
    String? userName,
    String? userProfilePicture,
    double? rating,
    String? image,
    List<String>? imagesURLs,
    String? userID,
    String? itemID,
    bool? isMatched,
    bool? isArchived,
  }) =>
      SwapItem(
        title: title ?? this.title,
        subtitle: subtitle ?? this.subtitle,
        description: description ?? this.description,
        location: location ?? this.location,
        age: age ?? this.age,
        condition: condition ?? this.condition,
        userName: userName ?? this.userName,
        userProfilePicture: image ?? this.userProfilePicture,
        image: image ?? this.image,
        rating: rating ?? this.rating,
        userID: userID ?? this.userID,
        itemID: itemID ?? this.itemID,
        imagesURLs: imagesURLs ?? this.imagesURLs,
        isMatched: isMatched ?? this.isMatched,
        isArchived: isArchived ?? this.isArchived,
      );

  Map<String, dynamic> toMap() => {
        'title': title,
        'subtitle': subtitle,
        'description': description,
        'location': location,
        'age': age,
        'condition': condition,
        'userName': userName,
        'userProfilePicture': userProfilePicture,
        'image': image,
        'rating': rating,
        'imagesURLs': imagesURLs,
        'userID': userID,
        'itemID': itemID,
        'isMatched': isMatched,
        'isArchived': isArchived,
      };

  factory SwapItem.fromMap(Map<String, dynamic> map) => SwapItem(
        title: map['title'] ?? '',
        subtitle: map['subtitle'] ?? '',
        description: map['description'] ?? '',
        location: map['location'] ?? '',
        age: map['age'] ?? '',
        condition: map['condition'] ?? '',
        userName: map['userName'] ?? '',
        userProfilePicture: map['userProfilePicture'] ?? '',
        image: map['image'] ?? '',
        rating: map['rating'] ?? '',
        userID: map['userID'] ?? '',
        itemID: map['itemID'] ?? '',
        imagesURLs: map['imagesURLs'] ?? [],
        isMatched: map['isMatched'] ?? false,
        isArchived: map['isArchived'] ?? false,
      );

  String toJson() => json.encode(toMap());

  factory SwapItem.fromJson(String source) =>
      SwapItem.fromMap(json.decode(source));

  @override
  String toString() =>
      'SwapItem(title: $title, subtitle: $subtitle, description: $description,location: $location, age: $age, condition: $condition,image:$image, userName: $userName,userProfilePicture:$userProfilePicture, imagesNames: $imagesURLs,rating:$rating, itemId:$itemID, userID:$userID, isMatched: $isMatched,isArchived: $isArchived)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }

    return other is SwapItem &&
        other.title == title &&
        other.subtitle == subtitle &&
        other.description == description &&
        other.location == location &&
        other.age == age &&
        other.condition == condition &&
        other.userName == userName &&
        other.userProfilePicture == userProfilePicture &&
        other.image == image &&
        other.rating == rating &&
        other.imagesURLs == imagesURLs &&
        other.userID == userID &&
        other.itemID == itemID &&
        other.isMatched == isMatched &&
        other.isArchived == isArchived;
  }

  @override
  int get hashCode =>
      title.hashCode ^
      subtitle.hashCode ^
      description.hashCode ^
      location.hashCode ^
      age.hashCode ^
      condition.hashCode ^
      userName.hashCode ^
      userProfilePicture.hashCode ^
      image.hashCode ^
      rating.hashCode ^
      imagesURLs.hashCode ^
      userID.hashCode ^
      itemID.hashCode ^
      isArchived.hashCode ^
      isMatched.hashCode;
}

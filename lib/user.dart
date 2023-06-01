class User {
  final String imagePath;
  final String name;
  final String email;
  final String about;
  // final double userRating;
  final bool isDarkMode;

  const User({
    required this.imagePath,
    required this.name,
    required this.email,
    required this.about,
    // required this.userRating,
    required this.isDarkMode,
  });

  User copy({
    String? imagePath,
    String? name,
    String? email,
    String? about,
    // double? userRating,
    bool? isDarkMode,
  }) =>
      User(
        imagePath: imagePath ?? this.imagePath,
        name: name ?? this.name,
        email: email ?? this.email,
        about: about ?? this.about,
        // userRating: userRating ?? this.userRating,
        isDarkMode: isDarkMode ?? this.isDarkMode,
      );

  static User fromJson(Map<String, dynamic> json) => User(
        imagePath: json['imagePath'],
        name: json['name'],
        email: json['email'],
        about: json['about'],
        // userRating: json['userRating'],
        isDarkMode: json['isDarkMode'],
      );

  Map<String, dynamic> toJson() => {
        'imagePath': imagePath,
        'name': name,
        'email': email,
        'about': about,
        // 'userRating': userRating,
        'isDarkMode': isDarkMode,
      };
}

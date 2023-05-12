class Category {
  final String title;
  bool isOn;

  Category({required this.title, required this.isOn});
}

List<Category> allCategories = [
  Category(title: 'Namještaj', isOn: false),
  Category(title: 'Dekoracije', isOn: false),
  Category(title: 'Posuđe', isOn: false),
  Category(title: 'Kućanski aparati', isOn: false),
  Category(title: 'Vrtlarska oprema', isOn: false),
  Category(title: 'Glazbeni instrumenti', isOn: false),
  Category(title: 'Periferija', isOn: false),
  Category(title: 'Laptopi', isOn: false),
  Category(title: 'Mobiteli', isOn: false),
  Category(title: 'Knjige', isOn: false),
  Category(title: 'CD', isOn: false),
  Category(title: 'Ploče', isOn: false),
  Category(title: 'Trading Card Game', isOn: false)
];

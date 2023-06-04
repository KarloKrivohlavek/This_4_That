class CategoryType {
  final String title;
  bool isOn;

  CategoryType({required this.title, required this.isOn});
}

List<CategoryType> allCategories = [
  CategoryType(title: 'Namještaj', isOn: false),
  CategoryType(title: 'Dekoracije', isOn: false),
  CategoryType(title: 'Posuđe', isOn: false),
  CategoryType(title: 'Kućanski aparati', isOn: false),
  CategoryType(title: 'Vrtlarska oprema', isOn: false),
  CategoryType(title: 'Glazbeni instrumenti', isOn: false),
  CategoryType(title: 'Periferija', isOn: false),
  CategoryType(title: 'Laptopi', isOn: false),
  CategoryType(title: 'Mobiteli', isOn: false),
  CategoryType(title: 'Knjige', isOn: false),
  CategoryType(title: 'CD', isOn: false),
  CategoryType(title: 'Ploče', isOn: false),
  CategoryType(title: 'Trading Card Game', isOn: false)
];

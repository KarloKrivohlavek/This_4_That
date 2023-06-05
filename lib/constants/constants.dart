import 'package:this_4_that/categories.dart';

class MyConstants {
  static List<String> buttonValuesPrice = [
    "0 - 50 €",
    "50 - 100 €",
    "100 - 200 €",
    "200 - 500 €",
    "500 - 1000 €",
    "1000 - 1500 €",
    "1500+ €",
  ];

  static List<String> buttonValuesCondition = [
    "Novo neraspakirano",
    "Novo raspakirano",
    "Rabljeno bez tragona korištenja",
    "Rabljeno s tragovima korištenja",
    "Rabljeno s defektima",
    "Potrgano / neispravno",
  ];

  static List<CategoryType> allCategories = [
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
}

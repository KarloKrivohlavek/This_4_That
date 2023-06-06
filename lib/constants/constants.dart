import 'package:this_4_that/categories.dart';
import 'package:this_4_that/models/categoryType/categoryType.dart';

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
    CategoryType(category: 'Namještaj', isOn: false),
    CategoryType(category: 'Dekoracije', isOn: false),
    CategoryType(category: 'Posuđe', isOn: false),
    CategoryType(category: 'Kućanski aparati', isOn: false),
    CategoryType(category: 'Vrtlarska oprema', isOn: false),
    CategoryType(category: 'Glazbeni instrumenti', isOn: false),
    CategoryType(category: 'Periferija', isOn: false),
    CategoryType(category: 'Laptopi', isOn: false),
    CategoryType(category: 'Mobiteli', isOn: false),
    CategoryType(category: 'Knjige', isOn: false),
    CategoryType(category: 'CD', isOn: false),
    CategoryType(category: 'Ploče', isOn: false),
    CategoryType(category: 'Trading Card Game', isOn: false)
  ];
}

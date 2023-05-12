import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:this_4_that/categories.dart';

class AddItemPage3 extends StatefulWidget {
  @override
  State<AddItemPage3> createState() => _AddItemPage3State();
}

class _AddItemPage3State extends State<AddItemPage3> {
  final controller = TextEditingController();

  List<Category> categories = allCategories;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(14),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Koje je kategorije?',
            style: TextStyle(fontSize: 40, fontWeight: FontWeight.w700),
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            'Ovo nam pomaže u filtriranju da bi ostali lakše pronašli tvoj predmet.',
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
          ),
          SizedBox(
            height: 10,
          ),
          TextField(
            onChanged: searchCategory,
            controller: controller,
            decoration: InputDecoration(
              prefixIcon: Icon(Icons.search),
              hintText: 'Pretraži',
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(width: 3, color: Colors.grey),
                borderRadius: BorderRadius.circular(50.0),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(width: 3, color: Colors.orange),
                borderRadius: BorderRadius.circular(50.0),
              ),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Padding(
              padding: EdgeInsets.all(5),
              child: Text('${countIsOn(categories)} / 3')),
          Expanded(
            child: Wrap(
              children: categories
                  .map((value) => GestureDetector(
                        onTap: () {
                          setState(() {
                            if (countIsOn(categories) < 3) {
                              value.isOn = !value.isOn;
                              print(countIsOn(categories));
                            } else if (countIsOn(categories) == 3 &&
                                value.isOn) {
                              setState(() {
                                value.isOn = !value.isOn;
                              });
                            }
                          });
                        },
                        child: Padding(
                          padding: EdgeInsets.all(2),
                          child: Container(
                            child: Text(value.title),
                            padding: EdgeInsets.all(10),
                            decoration: BoxDecoration(
                                color:
                                    value.isOn ? Colors.orange : Colors.white,
                                borderRadius: BorderRadius.circular(20),
                                border:
                                    Border.all(color: Colors.orange, width: 2)),
                          ),
                        ),
                      ))
                  .toList(),
            ),
          )
        ],
      ),
    );
  }

  void searchCategory(String query) {
    final suggestions = allCategories.where((category) {
      final categoryTitle = category.title.toLowerCase();
      final input = query.toLowerCase();
      return categoryTitle.contains(input);
    }).toList();

    setState(() => categories = suggestions);
  }
}

int countIsOn(List<Category> categories) {
  int counter = 0;
  for (int i = 0; i < categories.length; ++i) {
    if (categories[i].isOn == true) {
      counter++;
    }
  }
  return counter;
}

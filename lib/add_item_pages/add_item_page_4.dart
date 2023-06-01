import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:this_4_that/categories.dart';
import 'package:this_4_that/constants/colors.dart';

class AddItemPage4 extends StatefulWidget {
  const AddItemPage4({super.key});

  @override
  State<AddItemPage4> createState() => _AddItemPage4State();
}

class DataModel {
  String button;
  bool isSelected;

  DataModel(this.button, this.isSelected);
}

class _AddItemPage4State extends State<AddItemPage4> {
  int selectedIndex = -1;

  List<String> buttonValues = [
    "0 - 50 €",
    "50 - 100 €",
    "100 - 200 €",
    "200 - 500 €",
    "500 - 1000 €",
    "1000 - 1500 €",
    "1500+ €",
  ];
  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.all(14),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Text(
            'Koliko vrijedi?',
            style: TextStyle(fontSize: 40, fontWeight: FontWeight.w700),
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            'Ovo nam pomaže u filtriranju kako bi te spojili s predmetima slične vrijednosti',
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
          ),
          SizedBox(
            height: 10,
          ),
          Column(
            children: [
              ListView.builder(
                shrinkWrap: true,
                itemCount: buttonValues.length,
                itemBuilder: (context, index) {
                  return Column(children: [
                    Container(
                      padding: EdgeInsets.zero,
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height * 0.075,
                      child: TextButton(
                        style: ButtonStyle(
                          padding: MaterialStateProperty.all(
                              const EdgeInsets.all(0)),
                          minimumSize: MaterialStateProperty.all(Size.zero),
                          tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                          shape: MaterialStateProperty.all(
                              RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(50))),
                          backgroundColor:
                              MaterialStateProperty.resolveWith<Color>(
                            (Set<MaterialState> states) {
                              if (states.contains(MaterialState.pressed) ||
                                  selectedIndex == index) {
                                return MyColors.orange;
                              }
                              return Colors.transparent;
                            },
                          ),
                        ),
                        onPressed: () {
                          setState(() {
                            selectedIndex = index;
                          });
                        },
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: Padding(
                            padding: EdgeInsets.symmetric(horizontal: 25),
                            child: Text(
                              buttonValues[index],
                              style: TextStyle(
                                fontSize: 16,
                                color: Colors.black,
                              ),
                              textAlign: TextAlign.left,
                            ),
                          ),
                        ),
                      ),
                    ),
                    if (!(index == selectedIndex ||
                        index == selectedIndex - 1 ||
                        index == buttonValues.length - 1))
                      Divider(
                        height: 0,
                        indent: 25,
                        endIndent: 25,
                        color: MyColors.orange,
                        thickness: 2,
                      ),
                  ]);
                },
              ),
            ],
          ),
        ]));
  }
}

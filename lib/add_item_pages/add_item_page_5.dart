import 'package:flutter/material.dart';
import 'package:this_4_that/constants/colors.dart';

class AddItemPage5 extends StatefulWidget {
  const AddItemPage5({super.key});

  @override
  State<AddItemPage5> createState() => _AddItemPage5State();
}

class DataModel {
  String button;
  bool isSelected;

  DataModel(this.button, this.isSelected);
}

class _AddItemPage5State extends State<AddItemPage5> {
  int selectedIndex = -1;

  List<String> buttonValues = [
    "Novo neraspakirano",
    "Novo raspakirano",
    "Rabljeno bez tragona korištenja",
    "Rabljeno s tragovima korištenja",
    "Rabljeno s defektima",
    "Potrgano / neispravno",
  ];
  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(14),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          const Text(
            'Koliko vrijedi?',
            style: TextStyle(fontSize: 40, fontWeight: FontWeight.w700),
          ),
          const SizedBox(
            height: 10,
          ),
          const Text(
            'Ovo nam pomaže u filtriranju kako bi te spojili s predmetima slične vrijednosti',
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
          ),
          const SizedBox(
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
                            padding: const EdgeInsets.symmetric(horizontal: 25),
                            child: Text(
                              buttonValues[index],
                              style: const TextStyle(
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
                      const Divider(
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

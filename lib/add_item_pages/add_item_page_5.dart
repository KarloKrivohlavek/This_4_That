import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:this_4_that/constants/colors.dart';
import 'package:this_4_that/constants/constants.dart';
import 'package:this_4_that/screens/add_item/add_item_page_controller.dart';

class AddItemPage5 extends GetView<AddItemPageController> {
  AddItemPage5({super.key});

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
                itemCount: MyConstants.buttonValuesCondition.length,
                itemBuilder: (context, index) {
                  return Obx(
                    () => Column(children: [
                      Padding(
                        padding: EdgeInsets.symmetric(vertical: 2),
                        child: Container(
                          height: 50.w,
                          padding: EdgeInsets.only(left: 40),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(50),
                              color: controller.selectedIndexCondition == index
                                  ? MyColors.orange
                                  : Colors.transparent),
                          child: TextButton(
                              onPressed: () {
                                controller.selectedIndexCondition = index;
                              },
                              child: Align(
                                alignment: Alignment.centerLeft,
                                child: Text(
                                  MyConstants.buttonValuesCondition[index],
                                  style: TextStyle(
                                    fontSize: 16,
                                    color: Colors.black,
                                  ),
                                ),
                              )),
                        ),
                      ),
                      if (!(index == controller.selectedIndexCondition ||
                          index == controller.selectedIndexCondition - 1 ||
                          index ==
                              MyConstants.buttonValuesCondition.length - 1))
                        Divider(
                          height: 0,
                          indent: 30,
                          endIndent: 30,
                          color: MyColors.orange,
                          thickness: 2,
                        ),
                    ]),
                  );
                },
              ),
            ],
          ),
        ]));
  }
}

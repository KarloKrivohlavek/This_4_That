import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:this_4_that/categories.dart';
import 'package:this_4_that/constants/colors.dart';
import 'package:this_4_that/constants/constants.dart';
import 'package:this_4_that/screens/add_item/add_item_page_controller.dart';
import 'package:this_4_that/widget/filled_color_button_widget.dart';
import 'package:this_4_that/constants/constants.dart';

class AddItemPage3 extends GetView<AddItemPageController> {
  AddItemPage3({super.key});

  @override
  Widget build(BuildContext context) => Padding(
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
              onChanged: controller.searchCategory,
              controller: controller.controller,
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.search),
                hintText: 'Pretraži',
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(width: 3, color: MyColors.grey),
                  borderRadius: BorderRadius.circular(50.0),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(width: 3, color: MyColors.orange),
                  borderRadius: BorderRadius.circular(50.0),
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Padding(
                padding: EdgeInsets.all(5),
                child: Text(
                    '${controller.countIsOn(controller.pickedCategoriesConstants)} / 3')),
            Expanded(
              child: Obx(
                () => Wrap(
                  children: controller.pickedCategoriesConstants
                      .map((value) => GestureDetector(
                            onTap: () {
                              if (controller.countIsOn(
                                      controller.pickedCategoriesConstants) <
                                  3) {
                                controller.addPickedItemToList(value);
                                value.isOn = !value.isOn;
                                print(controller.countIsOn(
                                    controller.pickedCategoriesConstants));
                              } else if (controller.countIsOn(controller
                                          .pickedCategoriesConstants) ==
                                      3 &&
                                  value.isOn) {
                                value.isOn = !value.isOn;
                                controller.removePickedItemToList(value);
                              }
                            },
                            child: Padding(
                              padding: EdgeInsets.all(2),
                              child: Container(
                                child: Text(value.title),
                                padding: EdgeInsets.all(10),
                                decoration: BoxDecoration(
                                    color: value.isOn
                                        ? MyColors.orange
                                        : Colors.white,
                                    borderRadius: BorderRadius.circular(20),
                                    border: Border.all(
                                        color: MyColors.orange, width: 2)),
                              ),
                            ),
                          ))
                      .toList(),
                ),
              ),
            )
          ],
        ),
      );
}

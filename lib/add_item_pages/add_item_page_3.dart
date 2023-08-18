import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:this_4_that/constants/colors.dart';
import 'package:this_4_that/screens/add_item/add_item_page_controller.dart';

class AddItemPage3 extends GetView<AddItemPageController> {
  const AddItemPage3({super.key});

  @override
  Widget build(BuildContext context) => Padding(
        padding: const EdgeInsets.all(14),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Koje je kategorije?',
              style: TextStyle(fontSize: 40, fontWeight: FontWeight.w700),
            ),
            const SizedBox(
              height: 10,
            ),
            const Text(
              'Ovo nam pomaže u filtriranju da bi ostali lakše pronašli tvoj predmet.',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
            ),
            const SizedBox(
              height: 10,
            ),
            TextField(
              onChanged: controller.searchCategory,
              controller: controller.controller,
              decoration: InputDecoration(
                prefixIcon: const Icon(Icons.search),
                hintText: 'Pretraži',
                enabledBorder: OutlineInputBorder(
                  borderSide: const BorderSide(width: 3, color: MyColors.grey),
                  borderRadius: BorderRadius.circular(50.0),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide:
                      const BorderSide(width: 3, color: MyColors.orange),
                  borderRadius: BorderRadius.circular(50.0),
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Padding(
                padding: const EdgeInsets.all(5),
                child: Obx(
                  () => Text('${controller.pickedCategories.length} / 3'),
                )),
            Expanded(
              child: Obx(
                () => SingleChildScrollView(
                  child: Wrap(
                    children: controller.pickedCategoriesConstants
                        .map((value) => GestureDetector(
                              onTap: () {
                                if (controller.countIsOn(controller
                                            .pickedCategoriesConstants) <
                                        3 &&
                                    !value.isOn) {
                                  controller.addPickedItemToList(value);
                                } else if (value.isOn) {
                                  controller.removePickedItemToList(value);
                                }
                              },
                              child: Padding(
                                padding: const EdgeInsets.all(2),
                                child: Container(
                                  padding: const EdgeInsets.all(10),
                                  decoration: BoxDecoration(
                                      color: value.isOn
                                          ? MyColors.orange
                                          : Colors.white,
                                      borderRadius: BorderRadius.circular(20),
                                      border: Border.all(
                                          color: MyColors.orange, width: 2)),
                                  child: Text(value.category),
                                ),
                              ),
                            ))
                        .toList(),
                  ),
                ),
              ),
            )
          ],
        ),
      );
}

import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
import 'package:image_picker/image_picker.dart';
import 'package:this_4_that/screens/add_item/add_item_page_controller.dart';

import '../widget/addImageContainer.dart';

class AddItemPage1 extends GetView<AddItemPageController> {
  AddItemPage1({super.key});

  @override
  Widget build(BuildContext context) => Obx(() => Padding(
        padding: const EdgeInsets.all(14),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Dodaj slike predmeta',
              style: TextStyle(fontSize: 40, fontWeight: FontWeight.w700),
            ),
            const SizedBox(
              height: 10,
            ),
            const Text(
              'Biste li sami uzeli predmet bez slike? Pokažite ostalima što nudite.',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
            ),
            const SizedBox(
              height: 10,
            ),
            TextButton(
              onPressed: () {
                controller.pickImage();
              },
              child: GridView.builder(
                shrinkWrap: true,
                gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                  maxCrossAxisExtent: MediaQuery.of(context).size.width * 0.7,
                  childAspectRatio: 2 / 2,
                  crossAxisSpacing: 20,
                  mainAxisSpacing: 20,
                ),
                itemCount: controller.imageList.length < 5
                    ? controller.imageList.length
                    : 4,
                itemBuilder: (BuildContext context, index) {
                  return GestureDetector(
                      onTap: () {
                        if (controller.imageList.elementAt(index) != null) {
                          controller.imageList.removeAt(index);
                        } else {
                          controller.pickImage();
                        }
                      },
                      child: addImageContainer(
                          image: controller.imageList[index]));
                },
              ),
            )
          ],
        ),
      ));
}

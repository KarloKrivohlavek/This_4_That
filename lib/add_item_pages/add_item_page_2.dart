import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:this_4_that/constants/colors.dart';
import 'package:this_4_that/screens/add_item/add_item_page_controller.dart';

class AddItemPage2 extends GetView<AddItemPageController> {
  const AddItemPage2({super.key});

  @override
  Widget build(BuildContext context) => Scaffold(
        resizeToAvoidBottomInset: false,
        body: Padding(
          padding: const EdgeInsets.all(14),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Napišite nešto o predmetu',
                style: TextStyle(fontSize: 40, fontWeight: FontWeight.w700),
              ),
              const SizedBox(
                height: 20,
              ),
              TextField(
                maxLength: 20,
                onTap: () {
                  FocusScope.of(context).requestFocus(controller.node1);
                },
                onSubmitted: (d) {
                  FocusScope.of(context).requestFocus(controller.node2);
                },
                focusNode: controller.node1,
                textInputAction: TextInputAction.next,
                controller: controller.itemNameController,
                decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                      borderSide:
                          const BorderSide(width: 3, color: MyColors.grey),
                      borderRadius: BorderRadius.circular(50.0),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide:
                          const BorderSide(width: 3, color: MyColors.orange),
                      borderRadius: BorderRadius.circular(50.0),
                    ),
                    hintText: 'Naslov predmeta',
                    suffixIcon: controller.itemNameController.text.isEmpty
                        ? Container(
                            width: 0,
                          )
                        : IconButton(
                            icon: const Icon(
                              Icons.close,
                              color: MyColors.grey,
                            ),
                            onPressed: () {
                              controller.itemNameController.clear();
                            },
                          )),
              ),
              const SizedBox(
                height: 10,
              ),
              SizedBox(
                height: 120,
                child: TextField(
                  maxLength: 120,
                  onTap: () {
                    FocusScope.of(context).requestFocus(controller.node2);
                  },
                  focusNode: controller.node2,
                  maxLines: 9,
                  controller: controller.itemDescriptionController,
                  textInputAction: TextInputAction.done,
                  decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                        borderSide:
                            const BorderSide(width: 3, color: MyColors.grey),
                        borderRadius: BorderRadius.circular(30.0),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide:
                            const BorderSide(width: 3, color: MyColors.orange),
                        borderRadius: BorderRadius.circular(30.0),
                      ),
                      hintText: 'Opis predmeta'),
                ),
              ),
            ],
          ),
        ),
      );
}

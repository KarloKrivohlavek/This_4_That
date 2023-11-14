import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:this_4_that/constants/colors.dart';
import 'package:this_4_that/constants/text_styles.dart';
import 'package:this_4_that/screens/home/home_page_controller.dart';
import 'package:this_4_that/screens/home/widgets/filter_widget_preview.dart';
import 'package:this_4_that/services/firebase_service.dart';
import 'package:this_4_that/widget/custom_divider.dart';
import 'package:this_4_that/widget/filled_color_button_widget.dart';

class filterModalBottomSheet extends StatelessWidget {
  const filterModalBottomSheet({
    super.key,
    required this.controller,
  });
  final HomePageController controller;
  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 40,
      children: [
        Container(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              CustomDivider(),
              SizedBox(
                height: 50.h,
                child: GestureDetector(
                  onTap: () => showModalBottomSheet(
                      backgroundColor: MyColors.white,
                      context: context,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.vertical(
                          top: Radius.circular(20.0),
                        ),
                      ),
                      builder: (context) {
                        return Column(
                          children: [
                            const Divider(
                              color: MyColors.orange,
                              thickness: 3,
                              indent: 150,
                              endIndent: 150,
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Text(
                              'Vrijednost',
                              style: MyTextStyles.poppins16w700,
                            ),
                            Container(
                              child: Expanded(
                                child: ListView.builder(
                                    itemCount: controller.priceFilters.length,
                                    itemBuilder: (context, index) {
                                      return Obx(
                                        () => Padding(
                                          padding: EdgeInsets.only(
                                              right: 10, left: 10),
                                          child: ListTile(
                                            title: Text(controller
                                                .priceFilters[index].price),
                                            trailing: Checkbox(
                                              activeColor: MyColors.orange,
                                              shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(4)),
                                              value: controller
                                                  .priceFilters[index].isOn,
                                              onChanged: (_) {
                                                controller
                                                    .toggleCheckbox(index);
                                              },
                                            ),
                                          ),
                                        ),
                                      );
                                    }),
                              ),
                            ),
                            GestureDetector(
                              onTap: () {
                                Get.back();
                              },
                              child: Padding(
                                padding: EdgeInsets.only(
                                    right: 10, left: 10, top: 20, bottom: 20),
                                child: FilledColorButtonWidget(
                                    buttonHeight: 50.h,
                                    buttonText: 'Primjeni',
                                    buttonWidth: double.infinity,
                                    isEnabled: true),
                              ),
                            )
                          ],
                        );
                      }),
                  child: Obx(
                    () => FilterWidgetPreview(
                        filterType: 'Vrijednost',
                        filterValue:
                            controller.firstSelectedPriceFilterValue.value),
                  ),
                ),
              ),
              SizedBox(
                height: 50.h,
                child: GestureDetector(
                  onTap: () => showModalBottomSheet(
                      context: context,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.vertical(
                          top: Radius.circular(20.0),
                        ),
                      ),
                      builder: (context) {
                        return Column(
                          children: [
                            const Divider(
                              color: MyColors.orange,
                              thickness: 3,
                              indent: 150,
                              endIndent: 150,
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Text(
                              'Stanje',
                              style: MyTextStyles.poppins16w700,
                            ),
                            Container(
                              child: Expanded(
                                child: ListView.builder(
                                    itemCount:
                                        controller.conditionFilters.length,
                                    itemBuilder: (context, index) {
                                      return Obx(
                                        () => Padding(
                                          padding: EdgeInsets.only(
                                              right: 10, left: 10),
                                          child: ListTile(
                                            title: Text(controller
                                                .conditionFilters[index].price),
                                            trailing: Checkbox(
                                              activeColor: MyColors.orange,
                                              shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(4)),
                                              value: controller
                                                  .conditionFilters[index].isOn,
                                              onChanged: (_) {
                                                controller
                                                    .toggleCheckboxCondition(
                                                        index);
                                              },
                                            ),
                                          ),
                                        ),
                                      );
                                    }),
                              ),
                            ),
                            GestureDetector(
                              onTap: () {
                                Get.back();
                              },
                              child: Padding(
                                padding: EdgeInsets.only(
                                    right: 10, left: 10, top: 20, bottom: 20),
                                child: FilledColorButtonWidget(
                                    buttonHeight: 50.h,
                                    buttonText: 'Primjeni',
                                    buttonWidth: double.infinity,
                                    isEnabled: true),
                              ),
                            )
                          ],
                        );
                      }),
                  child: Container(
                    color: Colors.blue,
                    child: Obx(
                      () => FilterWidgetPreview(
                          filterType: 'Stanje',
                          filterValue: controller
                              .firstSelectedConditionFilterValue.value),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 50.h,
                child: GestureDetector(
                  onTap: () => showModalBottomSheet(
                      context: context,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.vertical(
                          top: Radius.circular(20.0),
                        ),
                      ),
                      builder: (context) {
                        return Padding(
                          padding: EdgeInsets.symmetric(horizontal: 10),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              const Divider(
                                color: MyColors.orange,
                                thickness: 3,
                                indent: 150,
                                endIndent: 150,
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Text(
                                'Kategorija',
                                style: MyTextStyles.poppins16w700,
                              ),
                              Flexible(
                                child: Column(
                                  children: [
                                    TextField(
                                      onChanged: controller.searchCategory,
                                      controller: controller.controller,
                                      decoration: InputDecoration(
                                        prefixIcon: const Icon(Icons.search),
                                        hintText: 'Pretraži',
                                        enabledBorder: OutlineInputBorder(
                                          borderSide: const BorderSide(
                                              width: 3, color: MyColors.grey),
                                          borderRadius:
                                              BorderRadius.circular(50.0),
                                        ),
                                        focusedBorder: OutlineInputBorder(
                                          borderSide: const BorderSide(
                                              width: 3, color: MyColors.orange),
                                          borderRadius:
                                              BorderRadius.circular(50.0),
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      height: 20,
                                    ),
                                    // Padding(
                                    //     padding: const EdgeInsets.all(5),
                                    //     child: Obx(
                                    //       () => Text('${controller.pickedCategories.length} / 3'),
                                    //     )),
                                    Expanded(
                                      child: Obx(
                                        () => SingleChildScrollView(
                                          child: Wrap(
                                            children: controller
                                                .pickedCategoriesConstants
                                                .map((value) => GestureDetector(
                                                      onTap: () {
                                                        if (controller.countIsOn(
                                                                    controller
                                                                        .pickedCategoriesConstants) <
                                                                3 &&
                                                            !value.isOn) {
                                                          controller
                                                              .addPickedItemToList(
                                                                  value);
                                                        } else if (value.isOn) {
                                                          controller
                                                              .removePickedItemToList(
                                                                  value);
                                                        }
                                                      },
                                                      child: Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                .all(2),
                                                        child: Container(
                                                          padding:
                                                              const EdgeInsets
                                                                  .all(10),
                                                          decoration: BoxDecoration(
                                                              color: value.isOn
                                                                  ? MyColors
                                                                      .orange
                                                                  : Colors
                                                                      .white,
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          20),
                                                              border: Border.all(
                                                                  color: MyColors
                                                                      .orange,
                                                                  width: 2)),
                                                          child: Text(
                                                              value.category),
                                                        ),
                                                      ),
                                                    ))
                                                .toList(),
                                          ),
                                        ),
                                      ),
                                    ),
                                    GestureDetector(
                                      onTap: () {
                                        Get.back();
                                      },
                                      child: Padding(
                                        padding: EdgeInsets.only(
                                            right: 10,
                                            left: 10,
                                            top: 20,
                                            bottom: 20),
                                        child: FilledColorButtonWidget(
                                            buttonHeight: 50.h,
                                            buttonText: 'Primjeni',
                                            buttonWidth: double.infinity,
                                            isEnabled: true),
                                      ),
                                    )
                                  ],
                                ),
                              )
                            ],
                          ),
                        );
                      }),
                  child: Container(
                    color: Colors.blue,
                    child: Obx(
                      () => FilterWidgetPreview(
                          filterType: 'Kategorija',
                          filterValue: controller.pickedCategories.isEmpty
                              ? 'Nijedan filter nije odabran'
                              : controller.pickedCategories[0]),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        Row(
          children: [
            Expanded(
              child: Container(
                padding: const EdgeInsets.all(10),
                child: GestureDetector(
                  onTap: () {
                    controller.applyFilters();
                    Get.back();
                  },
                  child: FilledColorButtonWidget(
                    buttonHeight: 50.h,
                    buttonText: 'Primjeni filtere',
                    buttonWidth: double.infinity,
                    isEnabled: true,
                  ),
                ),
              ),
            ),
          ],
        )
      ],
    );
  }
}

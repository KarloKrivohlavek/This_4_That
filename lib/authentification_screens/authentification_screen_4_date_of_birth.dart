import 'package:datepicker_dropdown/datepicker_dropdown.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:this_4_that/authentification_screens/authentification_controller.dart';
import 'package:this_4_that/constants/colors.dart';
import 'package:this_4_that/constants/text_styles.dart';
import 'package:this_4_that/widget/filled_color_button_widget.dart';
import 'package:this_4_that/widget/number_of_pages_indicator_widget.dart';

class AuthentificationScreen4DateOfBirth
    extends GetView<AuthentificationController> {
  const AuthentificationScreen4DateOfBirth({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          leading: BackButton(
            color: MyColors.black,
            onPressed: () {
              Get.back();
            },
          ),
          backgroundColor: Colors.transparent,
          elevation: 0,
        ),
        body: Padding(
          padding: const EdgeInsets.only(left: 16, right: 16, bottom: 16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 10,
                    child: NumberOfPagesIndicator(
                      numberOfItems: 5,
                      currentPosition: 2,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    'Kad ti je rođendan?',
                    style: MyTextStyles.poppins40w700,
                  ),
                  const SizedBox(height: 10),
                  Text(
                    'Tvoje godine će biti prikazane javno na profilu.',
                    style: MyTextStyles.poppins16w400,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  // Row(
                  //   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  //   children: [
                  //     SizedBox(
                  //       width: MediaQuery.of(context).size.width * 0.2,
                  //       child: TextField(
                  //         textAlign: TextAlign.center,
                  //         keyboardType: TextInputType.number,
                  //         maxLength: 2,
                  //         // onTap: () {
                  //         //   FocusScope.of(context).requestFocus(node1);
                  //         // },
                  //         // focusNode: node1,
                  //         // controller: titleController,
                  //         decoration: InputDecoration(
                  //           enabledBorder: OutlineInputBorder(
                  //             borderSide: const BorderSide(
                  //                 width: 3, color: MyColors.grey),
                  //             borderRadius: BorderRadius.circular(50.0),
                  //           ),
                  //           focusedBorder: OutlineInputBorder(
                  //             borderSide: const BorderSide(
                  //                 width: 3, color: MyColors.orange),
                  //             borderRadius: BorderRadius.circular(50.0),
                  //           ),
                  //           hintText: 'DD',
                  //           // suffixIcon: titleController.text.isEmpty
                  //           //     ? Container(
                  //           //         width: 0,
                  //           //       )
                  //           //     : IconButton(
                  //           //         icon: const Icon(
                  //           //           Icons.close,
                  //           //           color: MyColors.grey,
                  //           //         ),
                  //           //         onPressed: () {
                  //           //           titleController.clear();
                  //           //         },
                  //           //       )
                  //         ),
                  //       ),
                  //     ),
                  //     SizedBox(
                  //       width: MediaQuery.of(context).size.width * 0.2,
                  //       child: TextField(
                  //         textAlign: TextAlign.center,
                  //         keyboardType: TextInputType.number,
                  //         maxLength: 2,
                  //         // onTap: () {
                  //         //   FocusScope.of(context).requestFocus(node1);
                  //         // },
                  //         // focusNode: node1,
                  //         // controller: titleController,
                  //         decoration: InputDecoration(
                  //           enabledBorder: OutlineInputBorder(
                  //             borderSide: const BorderSide(
                  //                 width: 3, color: MyColors.grey),
                  //             borderRadius: BorderRadius.circular(50.0),
                  //           ),
                  //           focusedBorder: OutlineInputBorder(
                  //             borderSide: const BorderSide(
                  //                 width: 3, color: MyColors.orange),
                  //             borderRadius: BorderRadius.circular(50.0),
                  //           ),
                  //           hintText: 'MM',
                  //           // suffixIcon: titleController.text.isEmpty
                  //           //     ? Container(
                  //           //         width: 0,
                  //           //       )
                  //           //     : IconButton(
                  //           //         icon: const Icon(
                  //           //           Icons.close,
                  //           //           color: MyColors.grey,
                  //           //         ),
                  //           //         onPressed: () {
                  //           //           titleController.clear();
                  //           //         },
                  //           //       )
                  //         ),
                  //       ),
                  //     ),
                  //     SizedBox(
                  //       width: MediaQuery.of(context).size.width * 0.3,
                  //       child: TextField(
                  //         textAlign: TextAlign.center,
                  //         keyboardType: TextInputType.number,
                  //         maxLength: 4,
                  //         // onTap: () {
                  //         //   FocusScope.of(context).requestFocus(node1);
                  //         // },
                  //         // focusNode: node1,
                  //         // controller: titleController,
                  //         decoration: InputDecoration(
                  //           enabledBorder: OutlineInputBorder(
                  //             borderSide: const BorderSide(
                  //                 width: 3, color: MyColors.grey),
                  //             borderRadius: BorderRadius.circular(50.0),
                  //           ),
                  //           focusedBorder: OutlineInputBorder(
                  //             borderSide: const BorderSide(
                  //                 width: 3, color: MyColors.orange),
                  //             borderRadius: BorderRadius.circular(50.0),
                  //           ),
                  //           hintText: 'GGGG',
                  //           // suffixIcon: titleController.text.isEmpty
                  //           //     ? Container(
                  //           //         width: 0,
                  //           //       )
                  //           //     : IconButton(
                  //           //         icon: const Icon(
                  //           //           Icons.close,
                  //           //           color: MyColors.grey,
                  //           //         ),
                  //           //         onPressed: () {
                  //           //           titleController.clear();
                  //           //         },
                  //           //       )
                  //         ),
                  //       ),
                  //     ),
                  //   ],
                  // ),
                  DropdownDatePicker(
                    textStyle: MyTextStyles.poppins16w400,
                    hintTextStyle: MyTextStyles.poppins16w400,
                    inputDecoration: InputDecoration(
                        enabledBorder: OutlineInputBorder(
                            borderSide: const BorderSide(
                                color: MyColors.orange, width: 3.0),
                            borderRadius: BorderRadius.circular(40)),
                        border: OutlineInputBorder(
                            gapPadding: 0,
                            borderSide: const BorderSide(
                                color: MyColors.orange, width: 3),
                            borderRadius:
                                BorderRadius.circular(40))), // optional
                    isDropdownHideUnderline: true, // optional
                    isFormValidator: true, // optional
                    startYear: 1900, // optional
                    endYear: 2020, // optional
                    width: 4, // optional
                    // selectedDay: 14, // optional
                    // selectedMonth: 1, // optional
                    // selectedYear: 1999, // optional
                    onChangedDay: (value) {
                      controller.selectedDay = value ?? '';
                      controller.checkIfDatePicked();
                    },
                    onChangedMonth: (value) {
                      controller.selectedMonth = value ?? '';
                      controller.checkIfDatePicked();
                    },
                    onChangedYear: (value) {
                      controller.selectedYear = value ?? '';
                      controller.checkIfDatePicked();
                    },
                    // boxDecoration: BoxDecoration(
                    //
                    //   border: Border.all(
                    //     color: MyColors.orange,
                    //   ),
                    // ), // optional
                    showDay: true, // optional
                    dayFlex: 2, // optional
                    locale: "fr_FR", // optional
                    hintDay: 'D', // optional
                    hintMonth: 'MMMM', // optional
                    hintYear: 'GGGG', // optional
                    // hintTextStyle: TextStyle(color: Colors.grey), // optional
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                ],
              ),
              GestureDetector(
                onTap: () {
                  // Navigator.push(
                  //   context,
                  //   MaterialPageRoute(
                  //       builder: (context) =>
                  //           const AuthentificationScreen5Description()),
                  // );

                  controller.checkIfDatePicked()
                      ? controller.saveDateOfBirth()
                      : () {};
                },
                child: Obx(
                  () => FilledColorButtonWidget(
                    buttonHeight: 48.w,
                    buttonText: 'Dalje',
                    buttonWidth: MediaQuery.of(context).size.width,
                    isEnabled: controller.checkIfDatePicked(),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

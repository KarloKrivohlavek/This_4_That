import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:this_4_that/authentification_screens/authentification_screen_5_description.dart';
import 'package:this_4_that/constants/colors.dart';
import 'package:this_4_that/constants/strings.dart';
import 'package:this_4_that/constants/text_styles.dart';
import 'package:this_4_that/widget/filled_color_button_widget.dart';
import 'package:this_4_that/widget/number_of_pages_indicator_widget.dart';

class AuthentificationScreen4DateOfBirth extends StatefulWidget {
  const AuthentificationScreen4DateOfBirth({Key? key}) : super(key: key);

  @override
  State<AuthentificationScreen4DateOfBirth> createState() =>
      _AuthentificationScreen4DateOfBirthState();
}

class _AuthentificationScreen4DateOfBirthState
    extends State<AuthentificationScreen4DateOfBirth> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
        ),
        body: Padding(
          padding: EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: 10,
                child: NumberOfPagesIndicator(
                  numberOfItems: 5,
                  currentPosition: 2,
                ),
              ),
              SizedBox(height: 10),
              Text(
                'Kad ti je rođendan?',
                style: MyTextStyles.poppins40w700,
              ),
              SizedBox(height: 10),
              Text(
                'Tvoje godine će biti prikazane javno na profilu.',
                style: MyTextStyles.poppins16w400,
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.2,
                    child: TextField(
                      textAlign: TextAlign.center,
                      keyboardType: TextInputType.number,
                      maxLength: 2,
                      // onTap: () {
                      //   FocusScope.of(context).requestFocus(node1);
                      // },
                      // focusNode: node1,
                      // controller: titleController,
                      decoration: InputDecoration(
                        enabledBorder: OutlineInputBorder(
                          borderSide:
                              const BorderSide(width: 3, color: MyColors.grey),
                          borderRadius: BorderRadius.circular(50.0),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: const BorderSide(
                              width: 3, color: MyColors.orange),
                          borderRadius: BorderRadius.circular(50.0),
                        ),
                        hintText: 'DD',
                        // suffixIcon: titleController.text.isEmpty
                        //     ? Container(
                        //         width: 0,
                        //       )
                        //     : IconButton(
                        //         icon: const Icon(
                        //           Icons.close,
                        //           color: MyColors.grey,
                        //         ),
                        //         onPressed: () {
                        //           titleController.clear();
                        //         },
                        //       )
                      ),
                    ),
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.2,
                    child: TextField(
                      textAlign: TextAlign.center,
                      keyboardType: TextInputType.number,
                      maxLength: 2,
                      // onTap: () {
                      //   FocusScope.of(context).requestFocus(node1);
                      // },
                      // focusNode: node1,
                      // controller: titleController,
                      decoration: InputDecoration(
                        enabledBorder: OutlineInputBorder(
                          borderSide:
                              const BorderSide(width: 3, color: MyColors.grey),
                          borderRadius: BorderRadius.circular(50.0),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: const BorderSide(
                              width: 3, color: MyColors.orange),
                          borderRadius: BorderRadius.circular(50.0),
                        ),
                        hintText: 'MM',
                        // suffixIcon: titleController.text.isEmpty
                        //     ? Container(
                        //         width: 0,
                        //       )
                        //     : IconButton(
                        //         icon: const Icon(
                        //           Icons.close,
                        //           color: MyColors.grey,
                        //         ),
                        //         onPressed: () {
                        //           titleController.clear();
                        //         },
                        //       )
                      ),
                    ),
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.3,
                    child: TextField(
                      textAlign: TextAlign.center,
                      keyboardType: TextInputType.number,
                      maxLength: 4,
                      // onTap: () {
                      //   FocusScope.of(context).requestFocus(node1);
                      // },
                      // focusNode: node1,
                      // controller: titleController,
                      decoration: InputDecoration(
                        enabledBorder: OutlineInputBorder(
                          borderSide:
                              const BorderSide(width: 3, color: MyColors.grey),
                          borderRadius: BorderRadius.circular(50.0),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: const BorderSide(
                              width: 3, color: MyColors.orange),
                          borderRadius: BorderRadius.circular(50.0),
                        ),
                        hintText: 'GGGG',
                        // suffixIcon: titleController.text.isEmpty
                        //     ? Container(
                        //         width: 0,
                        //       )
                        //     : IconButton(
                        //         icon: const Icon(
                        //           Icons.close,
                        //           color: MyColors.grey,
                        //         ),
                        //         onPressed: () {
                        //           titleController.clear();
                        //         },
                        //       )
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            const AuthentificationScreen5Description()),
                  );
                },
                child: FilledColorButtonWidget(
                  buttonHeight: 48.w,
                  buttonText: 'Dalje',
                  buttonWidth: MediaQuery.of(context).size.width,
                  isEnabled: false,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

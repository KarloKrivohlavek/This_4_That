import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:this_4_that/authentification_screens/authentification_screen_4_date_of_birth.dart';
import 'package:this_4_that/constants/colors.dart';
import 'package:this_4_that/constants/strings.dart';
import 'package:this_4_that/constants/text_styles.dart';
import 'package:this_4_that/widget/filled_color_button_widget.dart';
import 'package:this_4_that/widget/number_of_pages_indicator_widget.dart';

class AuthentificationScreen3Username extends StatefulWidget {
  const AuthentificationScreen3Username({Key? key}) : super(key: key);

  @override
  State<AuthentificationScreen3Username> createState() =>
      _AuthentificationScreen3UsernameState();
}

class _AuthentificationScreen3UsernameState
    extends State<AuthentificationScreen3Username> {
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
                  currentPosition: 1,
                ),
              ),
              SizedBox(height: 10),
              Text(
                'Kako da te zovemo?',
                style: MyTextStyles.poppins40w700,
              ),
              SizedBox(height: 10),
              Text(
                'Ovo možeš mijenjati i prikazivati će se javno na profilu.',
                style: MyTextStyles.poppins16w400,
              ),
              const SizedBox(
                height: 20,
              ),
              TextField(
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
                    borderSide:
                        const BorderSide(width: 3, color: MyColors.orange),
                    borderRadius: BorderRadius.circular(50.0),
                  ),
                  hintText: 'Nadimak',
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
              const SizedBox(
                height: 10,
              ),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            const AuthentificationScreen4DateOfBirth()),
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

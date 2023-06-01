import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:this_4_that/authentification_screens/authentification_screen_3_username.dart';
import 'package:this_4_that/constants/colors.dart';
import 'package:this_4_that/constants/strings.dart';
import 'package:this_4_that/constants/text_styles.dart';
import 'package:this_4_that/widget/filled_color_button_widget.dart';
import 'package:this_4_that/widget/number_of_pages_indicator_widget.dart';

class AuthentificationScreen2NameSurname extends StatefulWidget {
  const AuthentificationScreen2NameSurname({Key? key}) : super(key: key);

  @override
  State<AuthentificationScreen2NameSurname> createState() =>
      _AuthentificationScreen2NameSurnameState();
}

class _AuthentificationScreen2NameSurnameState
    extends State<AuthentificationScreen2NameSurname> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: true,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
        ),
        body: Padding(
          padding: EdgeInsets.all(16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    height: 10,
                    child: NumberOfPagesIndicator(
                      numberOfItems: 5,
                      currentPosition: 0,
                    ),
                  ),
                  SizedBox(height: 10),
                  Text(
                    'Kako se zoveš?',
                    style: MyTextStyles.poppins40w700,
                  ),
                  SizedBox(height: 10),
                  Text(
                    'Ovo nećeš moći mijenjati, ali se neće prikazivati javno na profilu.',
                    style: MyTextStyles.poppins16w400,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  TextField(
                    maxLength: 20,
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
                      hintText: 'Ime i prezime',
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
                ],
              ),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            const AuthentificationScreen3Username()),
                  );
                },
                child: FilledColorButtonWidget(
                  buttonHeight: 48.w,
                  buttonText: 'Dalje',
                  buttonWidth: MediaQuery.of(context).size.width,
                  isEnabled: false,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
